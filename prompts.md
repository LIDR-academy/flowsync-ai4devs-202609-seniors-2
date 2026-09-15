# Prompts

Aquí van **todos los prompts que lanzaste** para hacer el ejercicio, en el orden en que los
lanzaste, con el modelo y la herramienta de cada uno.

Esto no es papeleo. Lo que se revisa es **cómo pediste las cosas**, no solo lo que salió: un
resultado flojo con un prompt bueno y un resultado flojo con un prompt vago necesitan feedback
distinto, y sin este archivo no se distinguen.

## Cómo rellenarlo

- Un apartado `## Prompt N` por cada prompt.
- **Pega el prompt tal cual lo lanzaste**, dentro del bloque de código, aunque ocupe diez líneas
  y aunque tenga faltas. No lo reescribas para que quede bien: el que arreglaste mentalmente
  después no es el que lanzaste.
- Incluye también los que **no funcionaron**. Suelen ser los más útiles de leer.
- `Modelo` y `Herramienta` en todos. Si cambiaste de una a otra a mitad, se nota aquí.

Borra el ejemplo de abajo cuando escribas el primero.

---

## Prompt 1

**Modelo:** auto
**Herramienta:** Claude Code

```
Implenent fronted funtionallity to log in an user.
Only modify code in /frontend, don't touch /backend

An user should be able to log in in the application.
Evaluate endpoints offered by the backend in order to log into the system.

Requirements of the system:
 - Initial page shows a panel to login with option to introduce user and password.
 - It also shows a link to sign up that redirects a webpage to sign up.

In the log in panel
 - User introduces user and password of an already existent user it receives a token and goes to the its profile page
 - If the user or the password does not match with info in the database it shows an error of "invalid user/password"

In the sign up page there are several fields: user, email, password and name
 - There is a validator of passwords (two fields that should match)
 - WHen the password matches, it saves the user (with the rest of the data profile)
 - It should validate the user and the email do not exist in the database
 - when it saves it goes to the login page

The profile page just shows the fields of the profile

In it is possible to logout from the profile page, that will redirect to the login page.

Use a standard UI with rectangular boxes with rounded corners. And a theme color of blues

```

**Qué salió:** 
Output con Harness 6m 12 s. (23K tokens?)
Output sin Harness 7m 39 s. (27K tokens?)

**Mensaje output harness**
```
Only /frontend files were touched (backend diffs shown are pre-existing from before this session). Login functionality is
  implemented and verified end-to-end in the browser:

  What was built (all in frontend/):
  - src/api/client.ts, src/api/auth.ts — typed fetch wrapper against the real backend (/api/v1/auth/signup, /auth/login,
    /account/profile, /account/logout), verified against the actual running AdonisJS API
  - src/context/AuthContext.tsx — token persisted in localStorage, restores the session via /account/profile on reload
  - src/pages/LoginPage.tsx, SignupPage.tsx, ProfilePage.tsx, routed in App.tsx with guards (/profile requires auth, / and /signup
    redirect away if already logged in)
  - src/styles/auth.css — blue theme, rounded rectangular cards/inputs/buttons

  One adaptation from the spec: the backend has no separate username field — only email, fullName, and password. So "user" in the
  login/signup requirements maps to email throughout (labeled "User" on the login form to match your wording, but it's an email
  input). Full name is the "name" field.

  Verified in-browser: signup → redirects to login; login with valid credentials → profile page shows name/email/join date; wrong
  password → shows "Invalid user/password"; logout → back to login; visiting /profile while logged out → redirected to login.

  Note: the earlier Prettier-hook task is still paused where you interrupted it — prettier is installed as a frontend devDependency,
  but no hook was written to settings.json. Let me know if you want to pick that back up.
```

**Mensaje output sin harness**
```
Everything looks correct and scoped only to /frontend. Here's a summary of what was built.

What I implemented

Explored the AdonisJS backend's real auth endpoints and validated their exact request/response shapes by running the server and hitting it directly with curl (login, signup, profile, logout, plus error cases), rather than guessing.

New frontend structure (frontend/src/):
- api/client.ts, api/auth.ts — typed fetch wrapper + auth calls (login, signup, fetchProfile, logout)
- context/AuthContext.tsx — holds session state, persists the token in localStorage, restores the session on reload by re-validating it against /account/profile
- routes/RequireAuth.tsx, routes/RedirectIfAuthenticated.tsx — route guards
- pages/LoginPage.tsx, SignupPage.tsx, ProfilePage.tsx
- components/AuthCard.tsx, FormField.tsx
- Rewired App.tsx/main.tsx for routing (added react-router-dom), replaced the default Vite theme in index.css with a blue, rounded-rectangle card design, removed the unused starter assets/CSS.

Behavior matches your spec:
- / shows the login panel + "Sign up" link → /signup
- Wrong credentials → shows "Invalid user/password" (mapped from the backend's 400 E_INVALID_CREDENTIALS)
- Correct credentials → token stored, redirect to /profile
- Signup validates password confirmation client-side, and surfaces backend field errors (duplicate email, weak password, etc.) inline per field
- Successful signup redirects to the login page (not auto-logged-in), matching "when it saves it goes to the login page"
- Profile page shows the profile fields and has a logout button that clears the session and redirects to /

One deviation worth flagging: the spec mentions a separate "user" field for login/signup, but the backend's users table and validators (app/validators/user.ts, database/schema.ts) only have email, fullName, and password — there's no username column. Since I couldn't touch /backend, I used email as the login identifier and name (fullName) as the profile name field instead of a separate username.

Verified with tsc -b, oxlint, a production vite build, and an end-to-end Node script exercising the real backend through the exact fetch logic the app uses (signup, duplicate email, password mismatch, login, profile, bad password, logout, post-logout 401) — all passed.
```