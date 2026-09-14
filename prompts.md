# Prompts

Todos los prompts que lancé, en el orden en que los lancé, con el modelo y la herramienta de cada uno.

**Contexto común:** modelo **Opus 5 (1M context)** (`claude-opus-5`), esfuerzo **high** (comprobado con `/effort` en las dos), modo **auto**,
Claude Code CLI **v2.1.270** en PowerShell (Windows Terminal), Node v24.19.0. Mismo modelo, esfuerzo y modo en las dos copias.
Cada prompt indica en qué copia se lanzó: **[H]** `flowsync-ai4devs-202609-seniors-1` (con harness) · **[P]** `flowsync-sin-harness` (pelada).

**Encargo:** idéntico en las dos copias, pegado desde un único archivo (`encargo.txt`, SHA1 `F60FDE833919`).

**Nota:** usé una sesión de Claude (app de escritorio) como apoyo. Preparó el entorno y los scripts de comprobación, y extrajo
los datos de las transcripciones. **Además propuso el texto** de los prompts de las piezas A y B, del ticket FLOW-2 y del encargo,
que usé tal cual. El `/init` y el orden de lanzamiento son míos.

---

## Prompt 1 — [H] Pieza A · `CLAUDE.md` con `/init` (19:37:52)

**Modelo:** Opus 5 (1M context)
**Herramienta:** Claude Code CLI v2.1.270

```
/init
```

**Qué salió:** Creó `CLAUDE.md` en la raíz (19:39).

## Prompt 2 — [H] Pieza A · completar `CLAUDE.md` con «Prohibido» y «Convenciones» (19:39:31)

**Modelo:** Opus 5 (1M context)
**Herramienta:** Claude Code CLI v2.1.270

```
Completa el CLAUDE.md de la raíz sin reescribir lo que ya tiene. Añade al final dos secciones:

## Prohibido
- Modificar cualquier archivo de backend/: el backend ya funciona y en este proyecto solo se lee.
- Editar código generado a mano: backend/.adonisjs/ y backend/database/schema.ts.
- Ejecutar node ace, porque regenera código.
- Añadir dependencias a un package.json sin justificar antes por qué no basta con lo que ya hay.

## Convenciones
- Antes de suponer un campo, su nombre o sus límites, leer el validador real en backend/app/validators/ y el transformer correspondiente.
- Las respuestas de la API van envueltas en { data }; logout es la excepción.
- Los textos de la interfaz van en español.
- Frontend: lint con oxlint (npm run lint) y typecheck con npm run build. No hay ESLint ni Prettier.

Mantén el archivo por debajo de 200 líneas y no modifiques ningún otro archivo.
```

**Qué salió:** Añadió las dos secciones al final (86 líneas). Arreglo manual después: borré la sección «Contexto del ejercicio» que había añadido `/init`, porque describía el experimento y hablaba de «plan».

## Prompt 3 — [H] Pieza B · hook oxlint en `.claude/settings.json` (19:42:13)

**Modelo:** Opus 5 (1M context)
**Herramienta:** Claude Code CLI v2.1.270

```
Crea un hook de Claude Code a nivel de proyecto que compruebe con oxlint cada archivo del frontend que edites.

- Configúralo en .claude/settings.json de este repositorio (no en la configuración de usuario), en el evento PostToolUse con matcher "Edit|Write".
- Debe leer del JSON de entrada la ruta del archivo editado y actuar solo si está dentro de frontend/ y es .ts, .tsx, .js o .jsx. Con cualquier otro archivo, no hace nada y sale con código 0.
- Debe ejecutar el oxlint que ya está instalado en frontend/ (sin instalar nada nuevo), con la configuración frontend/.oxlintrc.json y tratando los avisos como fallo (--deny-warnings).
- Si oxlint encuentra problemas, el hook sale con código 2 y escribe el resultado de oxlint en stderr, para que tú lo veas y lo corrijas. Si no hay problemas, sale con código 0 sin escribir nada.
- Tiene que funcionar en Windows. Si el comando se complica, ponlo en un script dentro de .claude/hooks/ con "oxlint" en el nombre del archivo.

No modifiques ningún otro archivo del proyecto.
```

**Qué salió:** Creó `.claude/settings.json` (PostToolUse, `Edit|Write`) y `.claude/hooks/oxlint-frontend.mjs` (oxlint local con `--deny-warnings`, sale con 2 y stderr si hay problemas). Lo probó por su cuenta: escribió un archivo de frontend con un `debugger`, Claude Code bloqueó la escritura con el error de oxlint y borró el archivo.

## Prompt 4 — [H] `/init` otra vez (por error, al reiniciar T1) (19:47:21)

**Modelo:** Opus 5 (1M context)
**Herramienta:** Claude Code CLI v2.1.270

```
/init
```

**Qué salió:** No hacía falta. Como `CLAUDE.md` ya existía, lo revisó y lo editó 4 veces: aclaró que los comandos del backend son solo referencia, añadió notas del frontend (hook, TypeScript estricto, sin proxy), los campos de signup/login y otra vez un párrafo de contexto del ejercicio, que borré a mano.

## Prompt 5 — [H] El encargo, en la copia con harness (20:02:32)

**Modelo:** Opus 5 (1M context)
**Herramienta:** Claude Code CLI v2.1.270

```
Implementa en este proyecto el siguiente ticket de nuestro tablero de Jira.

FLOW-2 · Crear cuenta desde la aplicación web

Como persona que quiere empezar a usar FlowSync, quiero crear mi cuenta desde la aplicación web para no depender de que otra persona me la cree.

Criterios de aceptación:
1. En la aplicación web hay un formulario para crear una cuenta con mi nombre, mi email y una contraseña que tengo que escribir dos veces.
2. Si algún dato no es válido, veo junto a ese campo un mensaje que me explica qué tengo que corregir.
3. Si ese email ya tiene una cuenta, me lo indica con un mensaje claro.
4. Si la cuenta se crea, veo una confirmación con mi email y el formulario se vacía.
```

**Qué salió:** terminó a las 20:06:53 sin preguntar nada (0 intervenciones; Bash ×12, Write ×4, Edit ×4). Implementó el formulario solo en `frontend/` (12 archivos: 4 nuevos, 4 modificados, 4 assets borrados), sin tocar `backend/` ni `package.json` y sin dependencias nuevas. `lint` y `build` pasan; no lo probó en el navegador. El hook no se disparó (el lint pasaba), y `App.tsx` lo escribió con `cat >`, sin pasar por el hook. Hizo obligatorio el nombre porque la API en `:3333` le respondía `required`, pero esa API era el backend de la pelada, que acababa de cambiar su validador. Borró los assets con `git rm`.

## Prompt 6 — [P] El encargo, en la copia pelada (mismo texto) (20:02:39)

**Modelo:** Opus 5 (1M context)
**Herramienta:** Claude Code CLI v2.1.270

```
Implementa en este proyecto el siguiente ticket de nuestro tablero de Jira.

FLOW-2 · Crear cuenta desde la aplicación web

Como persona que quiere empezar a usar FlowSync, quiero crear mi cuenta desde la aplicación web para no depender de que otra persona me la cree.

Criterios de aceptación:
1. En la aplicación web hay un formulario para crear una cuenta con mi nombre, mi email y una contraseña que tengo que escribir dos veces.
2. Si algún dato no es válido, veo junto a ese campo un mensaje que me explica qué tengo que corregir.
3. Si ese email ya tiene una cuenta, me lo indica con un mensaje claro.
4. Si la cuenta se crea, veo una confirmación con mi email y el formulario se vacía.
```

**Qué salió:** terminó a las 20:12:25 sin preguntar nada (0 intervenciones; Bash ×21, Write ×7, Edit ×2, PowerShell ×1). Tocó 20 archivos: el mismo formulario en `frontend/` más `SignupForm.css`, un test con `vitest` y `vite.config.ts` (proxy `/api`), 4 dependencias de desarrollo nuevas (`vitest`, `@testing-library/react`, `@testing-library/user-event`, `jsdom`) y **3 archivos del backend**: cambió el validador para hacer obligatorio el nombre, añadió un test funcional y escribió en `tmp/db.sqlite3`. Lanzó `node ace` (`migration:status`, `test`), arrancó backend y frontend, probó el alta real con `curl` (200 y 422), borró los usuarios de prueba y paró los servidores. No lo probó en el navegador.
