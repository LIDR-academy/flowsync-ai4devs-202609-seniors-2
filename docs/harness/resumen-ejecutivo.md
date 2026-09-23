# Ejercicio FlowSync · Resumen ejecutivo

**Módulo 1 · Los 3 pilares del uso efectivo de copilotos IA** · Máster AI4Devs 2026/09 Seniors (LIDR)
**Autor:** Joaquim Mauri · **Fecha de la prueba:** 14/09/2026

---

## En una frase

Con el mismo modelo y el mismo encargo, la copia **con harness** entregó una solución más acotada: **12 archivos frente a 20, ningún cambio en el backend frente a 3 y ninguna dependencia nueva frente a 4**, en menos de la mitad de tiempo. Pero el harness **no garantizó** que se cumplieran sus reglas: una se incumplió igualmente.

## Objetivo

Comprobar la idea central del módulo: **el andamiaje que rodea al modelo explica más varianza que el propio modelo**.

Para eso se lanza el mismo encargo, con el mismo modelo, en dos copias idénticas de un proyecto que solo se diferencian en lo que hay montado alrededor, y se compara por dónde se separan las dos salidas. El entregable no es el código: es la **comparación**, los **prompts** tal cual se lanzaron y **tres líneas de reflexión**.

## Cómo se hizo

| Elemento | Detalle |
|---|---|
| Proyecto | FlowSync: API en AdonisJS 7 (`backend/`) y React 19 + Vite (`frontend/`) |
| Dos copias | **Con harness** (se entrega) y **pelada** (sin nada), idénticas byte a byte al empezar |
| Harness | **A · Orienta antes:** `CLAUDE.md` con secciones «Prohibido» (no tocar `backend/`, no editar código generado, no lanzar `node ace`, no añadir dependencias sin justificar) y «Convenciones» (leer el validador real, textos en español, oxlint)<br>**B · Comprueba después:** hook de Claude Code que pasa oxlint a cada archivo del frontend editado |
| Encargo | Historia de Jira **FLOW-2 «Crear cuenta desde la aplicación web»**: lenguaje de producto, 4 criterios de aceptación y huecos que solo se resuelven leyendo el código |
| Mismo texto | Pegado desde un único archivo en las dos copias (verificado: idéntico carácter a carácter) |
| Modelo y herramienta | Claude Opus 5 (1M), esfuerzo *high*, modo automático, Claude Code CLI 2.1.270, Node 24 |
| Reloj | 45 min: de 19:37 a 20:17 (39,4 min usados) |

## Resultados

| | **Con harness** | **Sin harness** |
|---|---|---|
| Tiempo de la corrida | **4 min 21 s** | 9 min 46 s |
| Archivos tocados | **12**, todos en `frontend/` | **20**, 3 de ellos en `backend/` |
| Cambios en el backend | **Ninguno** | Cambió el validador, añadió un test y escribió en la base de datos |
| Dependencias nuevas | **0** | 4 (`vitest`, `@testing-library/*`, `jsdom`) |
| Comandos que el harness prohíbe | Ninguno | `node ace`, arrancar servidores |
| Intervenciones humanas | 0 | 0 |
| `lint` y `build` | Pasan | Pasan |
| Tests | No añadió | Añadió tests de frontend y de backend |
| Probado en navegador | No | No |
| Disparos del hook | 0 (el lint pasaba) | — |

## Conclusiones

1. **El harness acota el alcance.** Todas las reglas de «Prohibido» se cumplieron en la copia con harness, y la pelada hizo justo lo contrario sin saberlo: tocó el backend, lanzó `node ace` y añadió dependencias. En **qué se toca y qué no**, el andamiaje marcó más diferencia que el modelo, que era el mismo.

2. **Pero el harness no es una garantía.** Una regla se leyó y aun así no se aplicó. `CLAUDE.md` pedía leer el validador real antes de suponer un campo; el agente lo leyó (el nombre era opcional), pero lo hizo obligatorio porque una prueba contra la API le decía otra cosa. Un archivo de instrucciones **sube la probabilidad** de que algo pase; no lo asegura.

3. **Una comprobación automática solo cubre lo que ve.** El hook se configuró para las ediciones del agente (`Edit`/`Write`). Los dos agentes escribieron un archivo (`App.tsx`) con un comando de shell, y el hook no lo revisó. Las comprobaciones deterministas tienen que cubrir **todas las vías de escritura**, o ejecutarse al final.

4. **Más acotado no significa mejor en todo.** La copia con harness fue más rápida y más limpia, pero la pelada fue más exhaustiva: añadió tests y probó el alta real contra la API. Ninguna de las dos se probó en el navegador. La diferencia medida es de **alcance y respeto de reglas**, no de calidad global.

5. **El experimento también necesita su harness.** Tres detalles del entorno pudieron invalidar la comparación:
   - **Las dos copias compartían puerto.** La pelada levantó su backend y cambió su validador; la copia con harness consultó ese mismo servidor y copió la regla equivocada.
   - **`/init` describió el propio ejercicio** dentro de `CLAUDE.md`, lo que puede sesgar al agente. Hubo que borrarlo a mano.
   - **Pequeños fallos de entorno costaron más que montar las piezas:** la versión de Node, un módulo nativo que no cargaba y confundir las ventanas de cada copia.

## Límites de la prueba

- **Una sola ejecución por lado.** El agente no es determinista; con otra corrida pueden cambiar los números.
- **Contaminación entre copias** por el puerto compartido: afecta a la conclusión 2.
- **Apoyo de IA declarado.** Los prompts de las piezas, el texto del ticket y del encargo, y la redacción de las casillas se prepararon con ayuda de Claude; `prompts.md` lo detalla.
- **Intentos previos descartados** por problemas de entorno y de ventanas. Este resumen recoge solo la ejecución final.
- **Harness mínimo:** 2 de las 8 piezas del directo, las suficientes para cumplir el enunciado (una de cada familia).

## Qué haría distinto

| Problema | Mejora |
|---|---|
| Puerto compartido | Puertos distintos por copia, o prohibir arrancar servidores en las dos |
| El hook no ve las escrituras por shell | Añadir una comprobación al terminar (lint y build de todo el frontend) además del hook por archivo |
| La regla del validador no se aplicó | Formularla como prioridad explícita: «si la API contradice al validador, manda el validador y se pregunta» |
| `/init` filtra el contexto del ejercicio | Revisar y limpiar `CLAUDE.md` antes de lanzar |
| Errores de ventanas y entorno | Scripts de comprobación por paso |

## Entregables

| | |
|---|---|
| Comparación y tres líneas | [`docs/harness/comparacion.md`](comparacion.md) |
| Prompts literales | [`prompts.md`](../../prompts.md) |
| Resumen ejecutivo | este documento |
