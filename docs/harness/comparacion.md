# Comparison: same mission, with and without harness

**Mission:** FLOW-5 - "New users can sign up, log in, and see their space"
(same text, word for word, in both environments; model and tool noted in `prompts.md`).
**With harness:** this repo (`AGENTS.md` + `CLAUDE.md`, PostToolUse Prettier hook, `adversarial-reviewer` subagent).
**Without harness:** `flowsync-sin-harness/`, untouched copy, no instructions, no hooks.

## 1. Ticket description and prompt

### Ticket

```markdown
# New users can sign up, log in, and see their space

As a first-time user of FlowSync, I want to create an account, log in, and land in my space where I can see who I am, so I can start using the product without anyone's help.

**Acceptance criteria**
1. A first-time user can create an account and immediately access the product.
2. A returning user can log in with their credentials and get back to their space.
3. Once logged in, the user can see their name somewhere in the interface.
4. An invalid signup or login attempt is rejected with a message a human can understand, not a raw technical error.
5. The session survives a page reload.
6. The user can log out.
```

### Prompt

```
Use the Atlassian MCP to fetch Jira work item FLOW-5. Read its description and acceptance criteria, then implement the feature end to end in this repo. The backend (backend/, AdonisJS 7) already exists and must not be modified. The frontend (frontend/, React 19 + Vite) is where the work happens. Execute the acceptance criteria as written.
```


## 2. Files touched (counted)

| | With harness | Without harness |
|---|---|---|
| New files | 6, organized in folders: `auth/AuthProvider.tsx`, `auth/context.ts`, `auth/tokenStorage.ts`, `components/AuthScreen.tsx`, `components/Home.tsx`, `lib/api.ts` | 4, flat in `src/`: `AuthScreen.tsx`, `Space.tsx`, `api.ts`, `auth.tsx` |
| Modified files | 6: `App.tsx`, `App.css`, `index.css`, `main.tsx`, `index.html`, `vite.config.ts` | 6: `App.tsx`, `App.css`, `index.html`, `vite.config.ts`, `frontend/package-lock.json`, **`backend/package-lock.json`** |
| Deleted files | 3 (starter assets: `hero.png`, `react.svg`, `vite.svg`) | 0 |
| **Total** | **15** | **10** |

Both ended up with the same architecture decisions: a Vite dev proxy (`/api` -> `localhost:3333`), the page title changed to `FlowSync`, token in `localStorage`, a `loading / anonymous / authenticated` state machine, and a shared `ApiError` with per-field humanized messages. Neither agent touched backend source code, and neither added a runtime dependency.

## 3. Conventions: respected vs ignored, named one by one

**With harness** (conventions were written in `AGENTS.md`):

1. *Backend must not be modified* - RESPECTED. Zero backend files touched.
2. *No new dependencies without justification* - RESPECTED. `package.json` untouched.
3. *VineJS validators are the source of truth for input shape* - RESPECTED in spirit: the error mapping in `lib/api.ts` covers the exact rules of `backend/app/validators/user.ts` (`required`, `email`, `database.unique`, `minLength`, `sameAs`), so the agent did read the real validator instead of inventing rules.
4. *Migration-first / Transformers* - N/A: the ticket needs no schema change and no backend work; respected by absence.
5. *ESLint + Prettier formatting* - FOLLOWED MECHANICALLY, WITH A SIDE EFFECT. The PostToolUse hook formatted every edited frontend file with Prettier **defaults** (double quotes, semicolons) because `frontend/` has no Prettier config. The repo's existing style (Vite starter) is single quotes, no semicolons. The whole diff is now internally consistent but inconsistent with the branch's starting style.

**Without harness** (no conventions were written for this copy, which is itself the finding): nothing forbade it from touching anything, and it did leave churn in `backend/package-lock.json` (`"peer": true` flags, an `npm install` side effect). Nothing obliged it to follow any convention either; observably, it mirrored the existing starter style on its own and also dug into the backend routes/validator to map the same error rules.

## 4. Times I had to intervene

<!-- REMPLIR: compte tes interventions depuis ta session (corrections,
clarifications, redemarrages, arrets nets), pour chaque copie. -->

- With harness: **[N interventions - what and when]**
- Without harness: **[N interventions - what and when]**

## 5. What I would fix by hand before showing this to my team

**With harness:**
- Reconcile the quote/semicolon style: add a `.prettierrc` to `frontend/` (or scope the hook) so the enforced format matches the repo's own convention.
- Neither copy wrote any test; the 6 acceptance criteria were only checked by hand. I would add at least a smoke test for signup -> reload -> profile.

| 1 | A new user signs up and lands straight in | Passed |
|---|------------------------------------------|---------|
| 2 | their space A returning user logs in and gets back to their space | Passed |
| 3 |  The user's name is visible once logged in (top bar with initials, plus "Welcome, &lt;name&gt;") | Passed |
| 4 | Bad signup or login attempts get a plain-language message |  Passed: "Incorrect email or password", "An account with this email already exists. Try logging in instead." and "Passwords do not match." The raw backend text never appears. |
| 5 | The session survives a page reload | Passed. A saved token is only trusted once the backend accepts it, so an expired or invalid token sends the user back to the login screen. |
| 6 | The user can log out | Passed. The token is revoked on the backend and cleared in the browser, and the user is still logged out after a reload. |

**Without harness:**
- Revert the `backend/package-lock.json` churn (nothing in the ticket justifies touching the backend folder at all).
- Decide whether the flat `src/` layout scales, or move to folders as the feature set grows.

---

## Part B - the three lines

1. **Pieces mounted and the one that took longer than expected:**
What took me more time was to understand what was expected by the exercise, and define correctly the product ticket and the prompt to run.
The harness creation was about to read the course and apply to this case.

2. **First difference I observed between the two results, and what I was looking at when I noticed:**
- Candidate observed while writing this file: the harness copy's diff is formatted in double quotes/semicolons while the naked copy kept the starter's single quotes/no semicolons - visible by opening the two `api.ts` files side by side. Due to hook formating
- Both result are quite similar, maybe because the task description and the prompt had lot of precision.

3. **One rule written in the harness that the agent did not follow anyway:**
Candidate: the formatting hook ran on every edit, but because `frontend/` has no Prettier config it enforced Prettier's defaults, producing a style that contradicts the repo's existing code. The rule was "followed" by the tool and still gave the wrong result - the hook verified, it did not judge.
