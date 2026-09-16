# Comparación: `flowsync-ai4devs` (con harness) vs `flowsync-sin-harness`

Comparación entre dos `plan.md` sobre el mismo encargo — login y registro en el frontend de FlowSync
consumiendo el backend de auth existente — generados en dos copias del ejercicio: una con el harness
de Claude Code (herramientas, skills, MCP de Jira, ejecución real) y otra sin él.

## 0. Diferencia de género: plan vs. informe

Es la diferencia más importante y condiciona todas las demás:

- **Sin harness**: `plan.md` es un **plan prospectivo**. Lo dice explícitamente: *"No se aplica ningún
  cambio de código en esta fase — solo el plan."* Es una lista de archivos a crear/tocar y un orden de
  pasos, sin ejecución.
- **Con harness**: `plan.md` es un **informe retrospectivo**. Documenta trabajo ya implementado,
  verificado y confirmado con el usuario (incluye resultados reales de `tsc`, `oxlint`, `vite build` y
  comparación por `curl` contra el backend levantado).

No son dos planes para la misma tarea comparables 1:1 en contenido — uno anticipa, el otro constata. La
comparación de las secciones siguientes tiene esto en cuenta.

## 1. Origen del encargo

| | Sin harness | Con harness |
|---|---|---|
| Fuente del ticket | Enunciado dado directamente en el prompt, con criterios de aceptación y restricciones explícitas (no tocar backend, justificar librería de formularios, usar shadcn/ui) | Ticket Jira **FLOW-6** obtenido en vivo vía MCP de Atlassian (skill `priority-ticket`), con descripción mínima: *"Implementa el login y el registro consumiendo el backend de auth ya existente."* — sin criterios de aceptación |
| Restricciones de diseño | Dadas de antemano (shadcn/ui obligatorio, sin librería de formularios sin justificar) | Ninguna dada — el frontend era terreno greenfield total |
| Resolución de ambigüedad | No aplica (el prompt ya fijaba las restricciones) | Se usó `AskUserQuestion` para decidir routing, cliente API y alcance funcional antes de escribir código — capacidad interactiva propia del harness |

## 2. Stack y librerías elegidas

| Decisión | Sin harness | Con harness |
|---|---|---|
| Router | `react-router-dom` | `react-router-dom` (misma elección, mismo razonamiento: no hay redirect a ruta protegida sin algún enrutado) |
| UI/estilos | Tailwind + shadcn/ui (`button`, `input`, `label`, `card`, `alert`) + `components.json` + alias `@/*` — **obligatorio por restricción del ticket** | CSS plano reutilizando los tokens de tema ya presentes en `index.css` (`--accent`, `--border`, etc.) — sin librería de UI, footprint mínimo |
| Formularios | Explícitamente **sin** `react-hook-form`/`zod` — `useState` controlado, justificado por el bajo número de campos | `useState` controlado (igual), pero sin la disyuntiva porque nunca se planteó una librería de formularios |
| Cliente HTTP | `fetch` nativo envuelto en `api-client.ts` | `fetch` nativo envuelto en `lib/api.ts` — decisión equivalente, además elegida explícitamente frente a usar el cliente Tuyau generado que sugiere `AGENTS.md` |
| Sesión | `localStorage` + `AuthContext` con bootstrap contra `GET /account/profile` al montar | Igual: `localStorage` (`flowsync.token`) + `AuthContext`/`useAuth` con el mismo bootstrap |

El diseño de sesión (localStorage + contexto + rehidratación vía `/account/profile`) convergió de forma
casi idéntica en ambas copias, aunque una es solo el plan y la otra la implementación real — es la parte
del diseño menos condicionada por tener o no shadcn/Tailwind de por medio.

## 3. Alcance de archivos

- **Sin harness**: plan de **21 archivos** (17 nuevos + 4 modificados), repartidos en config
  (Tailwind, alias, `components.json`), 5 componentes base de shadcn, 4 archivos de lógica de dominio,
  3 páginas y 2 entrypoints.
- **Con harness**: **~13 archivos** tocados (`lib/api.ts`, `auth/AuthContext.tsx`, `auth/RequireAuth.tsx`,
  3 páginas, `App.tsx`, `main.tsx`, `App.css`, `.env.example`, `package.json`/`package-lock.json`, más 3
  assets del scaffold *eliminados*).

La diferencia de volumen no es de alcance funcional — ambas cubren login, registro, sesión persistida
y vista de perfil protegida — sino del coste de montar Tailwind + shadcn/ui desde cero, que exige la
mayoría de los archivos de más en la versión sin harness.

## 4. Manejo de errores del backend

- **Sin harness**: el plan fija como criterio de aceptación explícito que los errores se traduzcan a
  mensajes de usuario ("ya existe una cuenta con ese email", "email o contraseña incorrectos") **en
  vez de** mostrar el mensaje crudo del backend, y señala como primer paso de implementación confirmar
  contra el servidor real la forma exacta de los JSON 400/422 antes de escribir el parseo — es decir,
  no da por buena la forma del error sin verificarla primero.
- **Con harness**: se verificó la forma real de los errores por `curl` (`{"errors":[{"message","rule","field"}]}`)
  antes de darla por buena en `api.ts`, igual que planeaba hacer la copia sin harness — pero el mensaje
  mostrado en la UI es el mensaje crudo de VineJS concatenado (`extractErrorMessage`), no una traducción
  a copy de usuario. Es una diferencia funcional real: la versión sin harness planeaba un mejor mensaje
  de cara al usuario final; la implementación con harness se quedó en el mensaje técnico del backend.

## 5. Fuente de datos del perfil tras login

- **Sin harness**: decide explícitamente volver a pedir `GET /account/profile` en la página de perfil
  en vez de reusar el `user` que ya devuelve `login`/`signup`, "para ejercitar de verdad ese endpoint".
- **Con harness**: tras un login/signup exitoso usa directamente el `user` que viene en la respuesta de
  `login`/`signup` (`setUser(result.user)`); solo se llama a `GET /account/profile` en el bootstrap al
  recargar la página con un token ya guardado. Es más eficiente (una petición menos) pero ejercita el
  endpoint de perfil con menos frecuencia que lo que planeaba la copia sin harness.

## 6. Verificación

| | Sin harness | Con harness |
|---|---|---|
| Qué se pudo verificar | Nada todavía — es un plan; describe una checklist manual a futuro (signup con email repetido, login con credenciales malas, recarga de `/profile` con sesión, logout invalida la ruta protegida) | `tsc -b`, `oxlint`, `vite build` ejecutados y en verde; formas de respuesta/error del backend confirmadas por `curl` real contra el servidor levantado; rutas SPA (`/`, `/login`, `/register`, `/profile`) confirmadas a `200` |
| Qué queda pendiente | Todo el flujo end-to-end (es el plan de lo que haría falta probar) | Interacción real en navegador (clicks, render, flujo visual login→perfil→logout) — no había herramienta de automatización de navegador disponible en el entorno de la sesión; se señala explícitamente como no verificado |

Ambas copias coinciden en que la verificación completa requiere un navegador real y sesión manual; la
diferencia es que la copia con harness sí pudo ejecutar y confirmar el resto de la cadena (build,
lint, tipos, contrato de API contra el backend real) porque tenía acceso a shell y red, mientras que la
copia sin harness solo pudo dejarlo planificado.

## 7. Coste de montar el harness y dependencias instaladas

- **Montar el harness costó 5 piezas**: `AGENTS.md`, `CLAUDE.md` (symlink a `AGENTS.md`), las 2 skills
  (`commit`, `priority-ticket`) y el hook de `PostToolUse` que corre `prettier` sobre lo que se toca en
  `backend/`. De las 5, la más complicada de dejar bien fue `AGENTS.md` — es la que concentra las
  convenciones del repo (arquitectura AdonisJS generada, transformers/validators, alias `#*`, comandos)
  y de la que dependen el resto de piezas para no dar instrucciones genéricas o incorrectas.
- **Sin harness instaló claramente más dependencias de las necesarias**: al venir el ticket con la
  restricción de usar shadcn/ui, el plan suma `react-router-dom` + `tailwindcss` +
  `class-variance-authority` + `clsx` + `tailwind-merge` + `lucide-react` + las dependencias Radix de
  cada componente (`button`, `input`, `label`, `card`, `alert`) — bastantes más paquetes de los que pide
  estrictamente un login/registro con dos formularios.
- **Con harness instaló una dependencia más**: únicamente `react-router-dom`, sobre un frontend que ya
  traía React/Vite; sin librería de UI ni de formularios añadida.

## 8. Resumen

- El **diseño de sesión/auth** (localStorage + contexto + bootstrap) es prácticamente idéntico en ambas
  copias — es la parte del problema menos sensible a tener harness o no.
- La **diferencia de stack** (Tailwind+shadcn vs. CSS plano) viene de una restricción del ticket que solo
  existía en la copia sin harness, no de una diferencia de criterio entre ambas — pero en la práctica se
  tradujo en muchas más dependencias instaladas (sección 7) frente a la única dependencia nueva de la
  copia con harness.
- La **diferencia de proceso** más atribuible al harness en sí: poder preguntar interactivamente antes de
  fijar arquitectura (`AskUserQuestion`), y poder levantar servicios reales y confirmar contratos de API
  y builds en vez de solo planificarlos.
- La **diferencia de calidad más señalable**: el plan sin harness fija mensajes de error amigables como
  criterio de aceptación explícito; la implementación con harness no llegó a traducir esos mensajes y se
  quedó con el texto crudo del backend — sería el primer punto a corregir si se retoma este ticket.
- El **coste de preparar el harness** en sí (`AGENTS.md`, `CLAUDE.md`, 2 skills, 1 hook) es un coste fijo
  aparte del ticket, y `AGENTS.md` fue la pieza que más cuidado exigió.
