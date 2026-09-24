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

**Modelo:** Opus 5.5 Medium
**Herramienta:** Claude Code

```
Use the Atlassian MCP to fetch Jira work item FLOW-5. Read its description and acceptance criteria, then implement the feature end to end in this repo. The backend (backend/, AdonisJS 7) already exists and must not be modified. The frontend (frontend/, React 19 + Vite) is where the work happens. Execute the acceptance criteria as written.
```

**Qué salió:** (opcional, una línea) funcionó a la primera / tuve que insistir / me inventó una ruta que no existe.

> FLOW-5 is built in the frontend. I ran the whole flow in a real (headless) Chrome against the running backend, and all 16 checks passed, covering every acceptance criterion. The backend source is unchanged; everything is in frontend/, and nothing is > committed yet.
>
> ┌─────┬────────────────────────────────────────────────┬────────────────────────────────────────────────────────────────────────────┐
> │  #  │              Acceptance criterion              │                                   Result                                   │
> ├─────┼────────────────────────────────────────────────┼────────────────────────────────────────────────────────────────────────────┤
> │ 1   │ A new user signs up and lands straight in      │ Passed                                                                     │
> │     │ their space                                    │                                                                            │
> ├─────┼────────────────────────────────────────────────┼────────────────────────────────────────────────────────────────────────────┤
> │ 2   │ A returning user logs in and gets back to      │ Passed                                                                     │
> │     │ their space                                    │                                                                            │
> ├─────┼────────────────────────────────────────────────┼────────────────────────────────────────────────────────────────────────────┤
> │     │ The user's name is visible once logged in (top │                                                                            │
> │ 3   │  bar with initials, plus "Welcome,             │ Passed                                                                     │
> │     │ &lt;name&gt;")                                 │                                                                            │
> ├─────┼────────────────────────────────────────────────┼────────────────────────────────────────────────────────────────────────────┤
> │     │ Bad signup or login attempts get a             │ Passed: "Incorrect email or password", "An account with this email already │
> │ 4   │ plain-language message                         │  exists. Try logging in instead." and "Passwords do not match." The raw    │
> │     │                                                │ backend text never appears.                                                │
> ├─────┼────────────────────────────────────────────────┼────────────────────────────────────────────────────────────────────────────┤
> │ 5   │ The session survives a page reload            s only trusted once the backend accepts it, so an   │
> │     │                                                │ expired or invalid token sends the user back to the login screen.          │
> ├─────┼────────────────────────────────────────────────┼────────────────────────────────────────────────────────────────────────────┤
> │ 6   │ The user can log out                           │ Passed. The token is revoked on the backend and cleared in the browser,    │       │                                               ogged out after a reload.                           │
> └─────┴────────────────────────────────────────────────┴────────────────────────────────────────────────────────────────────────────┘
>
> The two screenshots I checked (the account page and the duplicate-email error) look right at phone width. The console showed no JavaScript errors, only Chrome's logs of the 400/401/422 responses the test triggered on purpose.
>
> What changed:
> - frontend/src/lib/api.ts: the calls to the backend, and translation of its errors (field-level and general) into plain language.
> - frontend/src/auth/: keeps track of who is logged in, restores the session on load, and handles logout.                                frontend/src/components/AuthScreen.tsx (login/signupser's space).
> - App.tsx, main.tsx, CSS and the page title are rewritten. I deleted the three unused Vite starter images in src/assets/.
> - vite.config.ts: in development, /api requests go to localhost:3333, so the app doesn't hardcode the backend address. VITE_API_URL     overrides this.
>
> I added no dependencies. There's no router: with only a login screen, a signup screen and the space, switching on the login state is enough.
>
> Things you should know:
> - Name is required at signup. The backend accepts an empty name, but I made it required in the form so every new user has a name to show(criterion 3). Existing accounts without a name show
> - Prettier style: your formatting hook uses Prettier's defaults (double quotes, semicolons), so the frontend now uses that style. There is no Prettier config in frontend/ yet.
> - Changes outside the repo files: better-sqlite3 was compiled for a different Node version, so the backend couldn't start. I ran npm rebuild better-sqlite3, which only touches node_modules. The test run also left a few test accounts in the local > SQLite database (backend/tmp/, which git ignores).
> - Test tooling: the Chrome extension wasn't connected, so I used puppeteer-core installed in the session's temporary folder, not in the
>   project.
>
> I've stopped both dev servers.
