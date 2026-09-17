# Comparación: con harness vs. sin harness

## Encargo

**Ticket:** Implementar login en el frontend

**Condición del ejercicio:** comparar únicamente los planes; no implementar el login ni modificar código funcional.

**Método usado:** misma herramienta y mismo modelo contra dos ramas que parten del mismo `s1/start`: `bare-jfc` sin harness y `harness-jfc` con harness. En ambos casos se pidió inspeccionar el repositorio y proponer un plan sin aplicar cambios. Los prompts exactos están en `prompts.md`.

> Nota de trazabilidad: el README del repositorio indica que el texto completo del ticket vive en la lección del curso y no está versionado en `s1/start`. Además, el intento de usar Claude Code falló antes de inferencia por saldo insuficiente. Para no inventar datos ni resultados, la comparación se hizo con el título disponible y con GPT-5.6 Sol + GitHub. La parte de Jira/MCP no pudo ejecutarse desde esta herramienta.

## Plan observado — sin harness

El plan tendió a resolver el ticket como una tarea de UI aislada:

1. inspeccionar el frontend actual y el endpoint de login existente;
2. sustituir la pantalla de ejemplo de Vite por un formulario email/password;
3. encapsular la llamada HTTP de login en un helper pequeño;
4. mostrar error de autenticación y estado de carga;
5. ejecutar `npm run lint` y `npm run build`.

**Archivos propuestos:** 3

- `frontend/src/App.tsx`
- `frontend/src/App.css`
- `frontend/src/lib/api.ts` (nuevo)

**Convenciones respetadas:** React + TypeScript existentes, reutilización del endpoint real en vez de inventar uno, alcance centrado en frontend.

**Convenciones/reglas no explicitadas:** no propuso crear rama de feature, no mencionó commit convencional, no incluyó Prettier como paso obligatorio, no incluyó revisión adversarial, no hizo explícita la política de no exponer tokens/credenciales, y el criterio sobre persistencia del token quedó como una decisión abierta.

**Intervenciones humanas durante el plan:** 0.

**Qué habría que revisar/arreglar a mano antes de enseñarlo:** decidir explícitamente cómo manejar/persistir el token, comprobar estados 401/validación/red, formalizar Definition of Done y revisar seguridad básica.

## Plan observado — con harness

El plan incorporó de forma explícita las instrucciones persistentes del repositorio:

1. crear una rama `feat/<slug>` antes de tocar código;
2. inspeccionar `backend/start/routes.ts`, el controlador de access tokens, validadores y transformers para usar el contrato real;
3. mantener el backend sin cambios salvo evidencia de necesidad;
4. centralizar el acceso HTTP en `frontend/src/lib/api.ts`;
5. separar la UI de login del estado de autenticación para evitar concentrar todo en `App.tsx`;
6. manejar validación, credenciales inválidas/401, errores de red y estado de carga;
7. tratar el token de forma intencional y evitar exponer secretos en logs, URL o mensajes;
8. ejecutar lint, build y Prettier;
9. cerrar con revisión adversarial y reportar cualquier comprobación no ejecutada.

**Archivos propuestos:** 6

- `frontend/src/lib/api.ts` (nuevo)
- `frontend/src/auth/auth-context.ts` (nuevo)
- `frontend/src/auth/auth-provider.tsx` (nuevo)
- `frontend/src/auth/use-auth.ts` (nuevo)
- `frontend/src/pages/login-page.tsx` (nuevo)
- `frontend/src/main.tsx`

**Convenciones respetadas:** alcance frontend, contrato real del backend, acceso a API centralizado, componentes pequeños, manejo explícito de errores, seguridad de credenciales/token, lint, build, Prettier, rama de feature, commit convencional y revisión adversarial.

**Convenciones/reglas no cumplidas por limitación de herramienta:** `/priority-ticket` no pudo consultar Jira ni mover estados porque la comparación se ejecutó fuera de Claude Code y sin MCP de Atlassian disponible.

**Intervenciones humanas durante el plan:** 0 en la generación del plan; 1 intervención de entorno antes del experimento para sustituir Claude Code después del error `Credit balance too low`.

**Qué habría que revisar/arreglar a mano antes de enseñarlo:** confirmar los criterios de aceptación exactos del ticket de Jira/lección y decidir la estrategia final de persistencia del token si el ticket no la especifica.

## Comparación resumida

| Evidencia | Sin harness | Con harness |
|---|---|---|
| Archivos propuestos | 3 | 6 |
| Usa contrato real del backend | Sí, pero como inspección puntual | Sí, requerido explícitamente por instrucciones persistentes |
| Backend fuera de alcance | Implícito | Explícito |
| Acceso a API centralizado | Sí | Sí, como convención del repo |
| Manejo explícito de 401/red/validación | Parcial | Sí |
| Tratamiento explícito del token/seguridad | Decisión abierta | Sí |
| `npm run lint` | Sí | Sí |
| `npm run build` | Sí | Sí |
| Prettier obligatorio | No | Sí |
| Rama `feat/<slug>` | No | Sí |
| Commit convencional | No | Sí |
| Revisión adversarial | No | Sí |
| Intervenciones durante generación del plan | 0 | 0 |

## Parte B — tres líneas obligatorias

1. **Hasta qué pieza llegué y cuál costó más:** llegué hasta `AGENTS.md`, después de montar `CLAUDE.md`, MCP de Atlassian, las dos skills, el subagente, el hook y las reglas de proceso. La pieza que más costó fue el arranque con `/init`, porque Claude Code respondió `Credit balance too low`; por eso el harness tuvo que montarse manualmente. Además, `AGENTS.md` quedó como archivo de referencia a `CLAUDE.md` y no como symlink real al crearlo mediante la API de GitHub.
2. **Primera diferencia observada:** el plan con harness convirtió reglas que en la copia pelada eran opcionales o implícitas en pasos verificables: inspeccionar el contrato real del backend, no tocar backend sin necesidad, manejar 401/token, ejecutar Prettier y terminar con revisión adversarial. Me fijé en los archivos propuestos, las comprobaciones y las reglas de proceso mencionadas por cada salida.
3. **Algo escrito en el harness que el agente no cumplió igualmente:** la skill `/priority-ticket` exige consultar Jira vía MCP y gestionar el estado del ticket, pero la herramienta usada para completar la comparación no tenía acceso al MCP de Atlassian; por tanto esa parte del harness quedó documentada pero no ejecutada.
