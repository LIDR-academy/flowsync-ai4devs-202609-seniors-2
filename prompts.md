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

**Modelo:** claude-sonnet-5 1m High
**Herramienta:** Claude Code

```
/init
```

## Prompt 2

**Modelo:** claude-sonnet-5 1m High
**Herramienta:** Claude Code

```
create AGENT.md so it's generic use symlink
```

## Prompt 3

**Modelo:** claude-sonnet-5 1m High
**Herramienta:** Claude Code

```
no rename CLAUDE to AGENTS  (removing reference to claude in the renamed file) and create the symlink agents.md
```

## Prompt 4

**Modelo:** claude-sonnet-5 1m High
**Herramienta:** Claude Code

```
añade un mcp para jira atlassian
```

## Prompt 5

**Modelo:** claude-sonnet-5 1m High
**Herramienta:** Claude Code

```
/priority-ticket
```

**Qué salió:** trajo el ticket FLOW-6 en vivo desde Jira (MCP Atlassian), y como la descripción no traía
criterios de aceptación y el frontend era greenfield, paró a preguntar routing/cliente API/alcance con
`AskUserQuestion` antes de tocar código. Implementó login, registro y sesión persistida; typecheck, lint
y build en verde, y las formas de request/error verificadas por `curl` contra el backend real. No pudo
probarlo en un navegador real por no haber herramienta de automatización de navegador en la sesión.

## Prompt 6

**Modelo:** claude-sonnet-5 1m High
**Herramienta:** Claude Code

```
puedes crear el plan.md de lo que has hecho
```

**Qué salió:** generó `plan.md` documentando (a posteriori) lo implementado en el Prompt 5: contexto,
decisiones de alcance, archivos tocados y verificación realizada.

## Prompt 7

**Modelo:** claude-sonnet-5 1m High
**Herramienta:** Claude Code

```
puedes comparar el @plan.md con @../flowsync-sin-harness/plan.md y ponerlo en docs/harness/comparacion.md
```

**Qué salió:** generó `docs/harness/comparacion.md` comparando el plan retrospectivo de esta copia (con
harness) contra el plan prospectivo de la copia sin harness para el mismo ticket.

## Prompt 8

**Modelo:** claude-sonnet-5 1m High
**Herramienta:** Claude Code

```
puedes añadir todos los prompts de la session al archivo de prompts
```