
"Coso no tengo conocimientos de programación, he soliciatdo a Claude que realice al comparación y efectivamente no tiene color, hacerlo con arnes a no hacerlo con Arnes, ya que es la unica manera que se me ocurrio para "

# Comparación: con harness vs. sin harness

Comparación entre `flowsync-ai4devs-202609-1` (con harness de Claude Code) y `flowsync-sin-harness`
(mismo punto de partida, sin harness) en la fecha de este informe (2026-09-26).

## Punto de partida común

Ambos repos arrancan del mismo commit base (`c1975a1` — starter AdonisJS 7 + React 19) y comparten
el mismo historial hasta `df31be3` (Initial commit). A partir de ahí divergen: `sin-harness` no
tiene ningún commit adicional; `ai4devs-202609-1` añade un commit (`ec8c4e5`,
"chore(harness): CLAUDE.md, AGENTS.md, skills, subagente, hook de Prettier y notas") y, además, un
volumen considerable de trabajo sin commitear todavía sobre el frontend.

## `flowsync-sin-harness`: sin trabajo aplicado

El repo está tal cual salió del starter:

- No existe carpeta `.claude/` ni `CLAUDE.md`/`AGENTS.md` — no hay ningún harness configurado.
- `frontend/src/` sigue siendo el scaffold por defecto de Vite (`App.tsx` con el contador de
  ejemplo, `App.css`, `assets/react.svg`, `assets/vite.svg`, `assets/hero.png`).
- `backend/app/` es idéntico al backend del starter (verificado por diff de árbol de archivos).
- Las únicas diferencias frente al commit `df31be3` son cambios mecánicos sin intervención humana:
  regeneración de tipos autogenerados de AdonisJS (`.adonisjs/**`) y actualización menor de
  `frontend/package-lock.json`.
- `prompts.md` sigue con la plantilla de ejemplo, sin rellenar.

**Conclusión:** en este repo no se ha implementado ninguna funcionalidad todavía; sirve como línea
base "tal cual el starter" para la comparación.

## `flowsync-ai4devs-202609-1`: con harness, feature completa

### El harness montado (8 piezas, ver `LogClaude.MD`)

- `CLAUDE.md`: guía del proyecto (arquitectura backend/frontend, comandos, convenciones, reglas de
  proceso), generada y verificada contra el repo real.
- `AGENTS.md`: puntero a `CLAUDE.md` para agentes que buscan ese nombre por convención.
- Skill `/priority-ticket` (`.claude/commands/priority-ticket.md`): trae un ticket de Jira vía MCP
  de Atlassian, explora el repo y redacta un plan de implementación sin aplicarlo.
- Skill `/commit` (`.claude/commands/commit.md`): revisa `git status`/`diff`, separa backend de
  frontend si no están acoplados, corre lint/typecheck antes de commitear, exige mensaje en
  imperativo y `add` explícito (nunca `-A`).
- **Subagente** `adversarial-reviewer` (`.claude/agents/adversarial-reviewer.md`): revisa
  planes/diffs buscando supuestos no verificados, incumplimiento de convenciones y casos borde.
- **Hook** `PostToolUse` (`.claude/hooks/format-frontend.mjs` + `.claude/settings.json`): formatea
  automáticamente con Prettier cualquier archivo de `frontend/` tras un `Edit`/`Write`/`MultiEdit`.
- Reglas de proceso en `CLAUDE.md`: no commitear sin `/commit`, correr lint/typecheck antes de
  cerrar tarea, no mezclar backend/frontend sin motivo, seguir el patrón
  validador→modelo→transformer, no inventar variables/endpoints/credenciales, no tocar
  `docs/harness/comparacion.md` ni `prompts.md` desde tareas de código.
- `LogClaude.MD`: registro cronológico de cada cambio (fichero, motivo, hora), con una entrada por
  ejecución.
- Ticket Jira **FLOW-2** ("Implementar login en el frontend"), creado vía MCP de Atlassian como
  entrada de trabajo para la skill `/priority-ticket`.

### La feature implementada: login/signup/perfil en el frontend

Usando la skill `/priority-ticket` sobre FLOW-1/FLOW-2, con un plan confirmado por el usuario antes
de aplicarlo, se construyó un frontend de autenticación completo que antes no existía:

- **Router**: `react-router-dom` añadido; `App.tsx` reescrito para definir `/login`, `/signup` y
  `/profile` (protegida), con redirect por defecto a `/profile`.
- **Cliente HTTP** (`src/lib/api.ts`): capa sobre `fetch` (sin librerías nuevas de HTTP) con
  `signup`, `login`, `getProfile`, `logout`, tipada según la forma real de respuesta del backend
  (`{ data }` / `{ errors: [{ message }] }`), verificada con `curl` contra el backend real antes de
  escribir el código.
- **Estado de sesión** (`src/context/AuthContext.tsx`): `AuthProvider` + hook `useAuth()`, persiste
  el token en `localStorage`, lo hidrata al montar validando contra `GET /account/profile`.
- **Guarda de ruta** (`src/components/ProtectedRoute.tsx`): redirige a `/login` si no hay token.
- **Pantallas**: `LoginPage`, `SignupPage` (envía `fullName: null`, ya que el AC del ticket solo
  pedía email+password aunque el backend exige el campo) y `ProfilePage` (muestra `fullName`/
  `email` y logout).
- **UI**: se inicializó `shadcn/ui` (estilo `base-nova` sobre Base UI) + Tailwind v4, generando
  `button`, `input`, `label`, `card`, `alert` en `src/components/ui/`.
- **Limpieza**: eliminado el demo de Vite (`App.css`, `assets/react.svg`, `assets/vite.svg`,
  `assets/hero.png`) y sus estilos en `index.css`.
- **Config**: alias `@/*` en `tsconfig.json`/`tsconfig.app.json` y en `vite.config.ts` (requisito de
  shadcn/ui); nuevas dependencias en `package.json`/`package-lock.json`.
- **Verificación**: lint y build del frontend en verde; simulación end-to-end con `curl` de los 7
  escenarios del flujo de auth contra el backend real (signup, email duplicado, login válido/
  inválido, perfil con token válido/revocado, logout) — las formas de respuesta coinciden
  exactamente con lo que espera `api.ts`. No se pudo verificar visualmente en navegador (ni el
  navegador integrado ni la extensión de Chrome estaban disponibles en la sesión).

Todo este trabajo queda registrado con fecha/hora y motivo en `LogClaude.MD`, archivo por archivo.

## Resumen comparativo

| | `flowsync-sin-harness` | `flowsync-ai4devs-202609-1` |
|---|---|---|
| Harness Claude Code | No existe | 8 piezas: `CLAUDE.md`, `AGENTS.md`, 2 skills, 1 subagente, hook Prettier, reglas de proceso, log de cambios |
| Backend | Starter sin tocar | Starter sin tocar (idéntico) |
| Frontend | Scaffold de Vite por defecto (demo del contador) | Auth completo: router, cliente HTTP, contexto de sesión, ruta protegida, 3 pantallas, UI con shadcn/Tailwind |
| Trazabilidad del trabajo | Ninguna (nada que trazar) | `LogClaude.MD` con cada cambio, fichero y motivo |
| Verificación | — | Lint + build en verde; 7 escenarios de auth verificados con `curl` contra el backend real |
| Commits propios del ejercicio | 0 | 1 (`ec8c4e5`) + cambios pendientes de commitear |
| `prompts.md` | Plantilla sin rellenar | Plantilla sin rellenar (pendiente en ambos) |

**Conclusión principal:** a fecha de este informe, `sin-harness` permanece en el estado del starter
(sin ninguna funcionalidad añadida), mientras que `ai4devs-202609-1` — apoyándose en el harness
(guía de proyecto, skills de flujo de trabajo, subagente revisor, hook de formateo y reglas de
proceso explícitas) — completó e implementó de extremo a extremo el ticket FLOW-2, con
verificación funcional contra el backend real y un registro auditable de cada cambio. La
comparación, en este punto, no es tanto "harness vs. sin harness" en calidad de código como
"trabajo realizado vs. trabajo pendiente de empezar" — pendiente queda repetir el mismo ticket en
`sin-harness` para poder comparar calidad/velocidad de implementación en igualdad de condiciones.

*Nota: `prompts.md` está pendiente de rellenar en ambos repos, por lo que esta comparación se basa
en el estado de los archivos y en `LogClaude.MD`, no en el histórico de prompts lanzados.*
