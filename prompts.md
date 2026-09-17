# Prompts

Registro de los prompts usados durante el ejercicio, incluidos los intentos que no funcionaron.

---

## Prompt 1

**Modelo:** N/A — la inferencia no llegó a iniciarse
**Herramienta:** Claude Code 2.1.268

```
/init
```

**Qué salió:** falló antes de generar `CLAUDE.md` con `Credit balance too low`. A partir de ese punto el harness se montó manualmente y la comparación se continuó con ChatGPT para no bloquear el ejercicio por el saldo de Claude.

---

## Prompt 2 — copia sin harness

**Modelo:** GPT-5.6 Sol
**Herramienta:** ChatGPT + conector de GitHub

```
Implementar login en el frontend.

Trabaja únicamente con la rama `bare-jfc`. No implementes nada y no modifiques archivos. Inspecciona el repositorio y, si existen instrucciones persistentes para agentes, aplícalas antes de proponer el plan. Devuelve solo un plan de implementación. Incluye: archivos que propones tocar, pasos, convenciones detectadas, validaciones que ejecutarías y riesgos o decisiones pendientes.
```

**Qué salió:** plan directo y corto, centrado en sustituir la pantalla Vite por un formulario de login y encapsular la llamada HTTP, pero dejó implícitas varias reglas de proceso, seguridad y Definition of Done que no existen en la copia pelada.

---

## Prompt 3 — copia con harness

**Modelo:** GPT-5.6 Sol
**Herramienta:** ChatGPT + conector de GitHub

```
Implementar login en el frontend.

Trabaja únicamente con la rama `harness-jfc`. No implementes nada y no modifiques archivos. Inspecciona el repositorio y, si existen instrucciones persistentes para agentes, aplícalas antes de proponer el plan. Devuelve solo un plan de implementación. Incluye: archivos que propones tocar, pasos, convenciones detectadas, validaciones que ejecutarías y riesgos o decisiones pendientes.
```

**Qué salió:** el plan incorporó el contrato real del backend, limitó el alcance al frontend, propuso centralizar el acceso a API y explicitó lint, build, Prettier, manejo de errores/401, tratamiento del token y revisión adversarial. La parte de Jira de `/priority-ticket` no se pudo ejecutar porque la herramienta usada para esta comparación no tenía acceso al MCP de Atlassian.
