# Comparación de FlowSync con y sin harness

**Encargo:** FLOW-1, crear una cuenta desde la pantalla inicial. **Herramienta y modelo registrados en ambas copias:** Codex CLI, GPT 5.6 Sol, razonamiento Medium. Los bloques del ticket en ambos `prompts.md` contienen el mismo encargo.

## Parte A: comparación

| Aspecto | Con harness | Sin harness |
| --- | --- | --- |
| Archivos con cambios de contenido frente a HEAD, excluyendo documentación | **4:** `frontend/src/App.tsx`, `frontend/src/App.css`, `frontend/src/index.css` y `frontend/vite.config.ts`. | **5:** los mismos cuatro archivos y `backend/app/validators/user.ts`. |
| Alcance y apariencia | Formulario compacto, fondo blanco y acento morado. Según mis notas, no hizo los cambios adicionales de diseño que observé en la otra copia. | Añadió un panel lateral, fondo verde, un símbolo gráfico y frases comerciales que no había pedido. El resultado se veía atractivo, pero se alejaba de lo que esperaba. |
| Convenciones observables | Conservó en los archivos revisados el uso de comillas simples y ausencia de punto y coma. No hay cambios de contenido del backend en el diff actual. | No tenía un `AGENTS.md` propio. Cambió a comillas dobles y punto y coma en archivos como `vite.config.ts`. También cambió la validación del nombre en el backend: pasó de admitir un valor nulo a exigir texto de 1 a 120 caracteres. Esto excede el alcance de frontend indicado por la actividad. |
| Intervenciones durante la implementación | Registré **3 solicitudes de permiso para ejecutar comandos**. Después de resolver el entorno, anoté que funcionó al primer intento, sin correcciones funcionales registradas. | Anoté que funcionó al primer intento después de resolver el entorno y tres solicitudes de permiso. |
| Resultado observado | La página muestra el formulario y una confirmación de creación de cuenta. Observé autocompletado y sugerencia de contraseña en el navegador. | También muestra el formulario y una confirmación. En mi prueba no observé el mismo autocompletado ni la sugerencia de contraseña. |
| Qué revisaría antes de enseñarlo al equipo | Comprobar errores, solicitudes duplicadas y comportamiento móvil; conservar evidencia de lint y build. | Además de esas comprobaciones, acordar o retirar el rediseño no solicitado y revisar el cambio de validación del backend antes de incorporarlo. |

**Entorno y tiempo:** registré tres intentos iniciales fallidos en la copia con harness y uno en la copia sin harness por problemas de `codex-code-mode-host.exe`. Los separo de las intervenciones sobre la funcionalidad. Anoté que sobraron 18 minutos, pero empecé a medir después de crear `AGENTS.md`; esa cifra no representa el tiempo total de preparación y comparación.

## Parte B: tres reflexiones

1. **Qué monté y qué costó más:** añadí `AGENTS.md` con reglas de alcance, planificación, reutilización y comprobaciones con `npm.cmd run lint` y `npm.cmd run build`. No quedó registrada una segunda pieza ejecutada de forma independiente, como una revisión posterior o una comprobación automática. La dificultad documentada fue habilitar el ejecutor local de Codex.
2. **Primera diferencia observada:** al comparar las pantallas vi que la versión sin harness incorporó fondo, logo y frases comerciales adicionales; la versión con harness mantuvo una presentación más sencilla y próxima a lo que esperaba. 
3. **Regla del harness incumplida:** pendiente de identificar con evidencia. Los registros disponibles no permiten afirmar un incumplimiento concreto ni que se cumpliera todo. Falta contrastar la salida final de Codex con las exigencias de planificación, lint, build y explicación por criterio de aceptación.
