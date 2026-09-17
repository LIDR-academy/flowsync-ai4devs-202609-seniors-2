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

---

## Prompt 1

**Modelo:** Claude Sonnet 5
**Herramienta:** Claude Code (app de escritorio)

```
Vamos a revisar el folder que backend para identificar las funcionalidades expuestas. Creame un listado tipo proyect manager para saber el alcance de lo que tenemos.
```

**Qué salió:** funcionó a la primera. El agente leyó rutas, controladores, validators, modelo y
migraciones del backend (AdonisJS) y devolvió un inventario tipo PM: endpoints expuestos
(signup, login, logout, profile), modelo de datos, reglas de validación vigentes y una lista
explícita de lo que todavía no está implementado (reset de password, roles, edición de perfil,
etc.).

---

## Prompt 2

**Modelo:** Claude Sonnet 5
**Herramienta:** Claude Code (app de escritorio)

```
Lets create an agent.md file based on the following first approach: # AGENTS.md — FlowSync

## Overview
Monorepo: `backend/` (AdonisJS 7, API) + `frontend/` (React 19 + Vite).
Auth con access tokens. SQLite (better-sqlite3) + Lucid ORM.

## Stack y convenciones
- **Migration-first**: el esquema se genera. NUNCA editar `database/schema.ts`
  a mano; crear migración y correr `node ace migration:run`.
- **Transformers**: la salida de la API pasa por un `*Transformer` (BaseTransformer,
  `toObject()` con `this.pick(...)`). No serializar el modelo directo.
- **Validación**: VineJS en `#validators/*`. No validar a mano en el controller.
- **Controllers**: la base usa controllers generados (`#generated/controllers`).
- **Fechas**: Luxon `DateTime`. **Lint/format**: ESLint + Prettier.

## Comandos clave
- `node ace migration:run`  — aplica migraciones
- `npm run test`            — suite de tests del backend
- `npm run lint`            — ESLint + Prettier

## Gotchas
- Auth por access tokens (`@adonisjs/auth`); el perfil se sirve por transformer.
- No introducir dependencias nuevas sin justificarlas en el PR.

The following is required:
Fe is React 19 + Vite. Use always shadcn/ui: (no es una dependencia que se instala, son componentes que se copian a tu propio repo, así que se editan libremente y no engordan el package.json).
Validators and tranformers are relevant to construct the API but also the FE, including validations and manage error messages accordingly.  The access tokens is the Oauth mecanism each token starts with oat_.
After AGENTS.md file is created. Create CLAUDE.md file linking or "apuntando" a AGENTS.md
```

**Qué salió:** funcionó a la primera. Antes de escribirlo, el agente inspeccionó el código real
(schema.ts generado, transformers, validators, rutas, config de auth, package.json de ambos
lados) para corregir el borrador donde no coincidía con el repo (el lint del frontend es
`oxlint`, no ESLint) y añadió detalles concretos que el borrador no tenía (wrapping `{ data }`
de las respuestas, prefijo `oat_` de los tokens, cliente tipado generado por Tuyau) en vez de
copiar el borrador tal cual.

---

## Prompt 3

**Modelo:** Claude Sonnet 5
**Herramienta:** Claude Code (app de escritorio)

```
Vamos a continuar con el harness, en este caso es importante que creemos un subagente que sea capaz de revisar el codigo, funcionalidad y romper el flujo o encontrar bugs. En caso de encontrar errores debe reportarlos para que se trabajaen antes de terminar una tarea.
```

**Qué salió:** funcionó a la primera. El agente creó `.claude/agents/adversarial-reviewer.md`
como subagente de solo lectura (Read, Grep, Glob, Bash) enfocado en romper el flujo
activamente (inputs inválidos, auth cruzada, condiciones de carrera) y en verificar las
convenciones propias del proyecto, dejando explícito que no corrige nada — solo reporta, con
veredicto PASA/NO PASA.

---

## Prompt 4

**Modelo:** Claude Sonnet 5
**Herramienta:** Claude Code (app de escritorio)

```
Now, lets create a skill that will be able to create commits. We need a standard way to define commits. Based on type of task: feat, bug, fix..., and the type of layer FE or BE. Commits must be based on the JIRA ticket data, the diff and from here create a short but meaningfull name for the commit indicating a verb. Ex: feat(BE): Add login endpoint and validations.
```

**Qué salió:** funcionó a la primera. El agente buscó ejemplos de formato de `SKILL.md` en el
propio filesystem antes de escribirlo, y diseñó la resolución de `type` (prioridad: tipo de
issue de Jira sobre la naturaleza real del diff) y de `scope` (BE/FE/ambas según las rutas
tocadas), dejando explícito que nunca debe inventar un ticket ni fusionar en un commit dos
tareas no relacionadas en capas distintas.

---

## Prompt 5

**Modelo:** Claude Sonnet 5
**Herramienta:** Claude Code (app de escritorio)

```
Como product manager, vamos a crear un ticket para crear la pagina y funcionalidad de signup. Como criterios de aceptacion, el usuario debe poder acceder a un formulario, permitir llenar los campos requeridos, luego enviarlo y una vez finalizado el usuario debe quedar autenticado.
```

**Qué salió:** funcionó a la primera. Antes de redactar el ticket, el agente revisó el estado
real del frontend (scaffold de Vite sin routing ni forms) para no asumir que ya existía algo, y
devolvió el ticket en formato historia de usuario + criterios de aceptación en Gherkin,
referenciando los archivos y el contrato real del endpoint de signup ya inventariado en el
Prompt 1.

---

## Prompt 6

**Modelo:** Claude Sonnet 5
**Herramienta:** Claude Code (app de escritorio)

```
Trabajas en el frontend con React + Vite y shadcn/ui. implementa la tarea de JIRA: https://vpsalcedos.atlassian.net/browse/FLOW-1, consumiendo el backend. La tarea esta lista cuando:

* Exista una pagina de signup con el formulario y manejo de los campos requeridos.
* Exista manejo de errores en los campos obligatorios.
* Luego de un signup exitoso el usuario el logeado y redirigido a una pagina de profile (vacia)
* Datos invalidos o errores en el signup deben manejarse con un mensaje adecuado para el usuario.

Recuerda NO tocar el backend, esta logica ya se encuentra new_account_controller.ts y el endpoint es	/api/v1/auth/signup.
Usa los componentes de shadcn/ui asi como la documentacion al alcance.
En caso que algo no sea claro, realiza las preguntas pertinentes. Nunca supongas nada.
```

**Qué salió:** funcionó a la primera sin necesidad de preguntas de vuelta (iba en Auto Mode). El
agente exploró el backend con curl para inferir el contrato real de la API (en vez de asumirlo),
montó Tailwind + shadcn/ui desde cero (el frontend no tenía nada de eso), implementó signup +
perfil protegido + manejo de errores, y lo verificó en un navegador embebido antes de darlo por
terminado. Al final invocó por su cuenta el subagente `adversarial-reviewer`, que encontró 4
bugs reales (uno de ellos, silencioso: un error de red transitorio borraba una sesión válida), y
el agente los corrigió todos en el mismo turno excepto dos que requerían tocar `backend/` (fuera
de alcance del ticket), que dejó registrados como tarea aparte en vez de tocarlos.
