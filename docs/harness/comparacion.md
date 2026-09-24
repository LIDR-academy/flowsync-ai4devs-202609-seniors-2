# Comparación: con harness vs. sin harness

**Encargo:** FLOW-1 — "Crear inicio de sesion para los usuarios en FlowSync" (mismo texto lanzado en ambas copias, ver `prompts.md` Prompt 4 y 5).

**Harness montado (solo en la copia con harness):** `CLAUDE.md` (convenciones + prohibiciones) + hook `PostToolUse` que corre el lint del subproyecto tocado.

Ninguna de las dos copias llegó a implementar código: solo se pidió un plan.

## Comparación

|  | Con harness | Sin harness |
|---|---|---|
| **Archivos que propone tocar** | ~7: `frontend/src/lib/api.ts`, `frontend/.env`, `frontend/.env.example`, `AuthContext` (sin nombrar archivo), `frontend/src/features/auth/LoginForm.tsx`, `frontend/src/features/auth/LoginPage.tsx`, `frontend/src/App.tsx` (modificado) | ~4: cliente API, `AuthContext`, `LoginForm` (ninguno con ruta de archivo concreta), `frontend/src/App.tsx` (modificado) |
| **Convenciones respetadas** | No instalar dependencias sin avisar (citado explícitamente, dos veces: axios y router). No hardcodear URL del backend (usó variable de entorno + `.env.example`). Explicó el manejo del token antes de proponerlo. Sugirió tests de Japa para backend (convención del `CLAUDE.md`). | Llegó a las mismas decisiones (sin axios, sin router, sin librería de formularios, URL configurable) pero por buen juicio propio — no hay ninguna convención escrita que pueda "respetar". No mencionó testing de backend en ningún momento. |
| **Convenciones violadas** | Ninguna violación abierta. Punto sutil: la prohibición de `CLAUDE.md` sobre "no inventar esquema de auth con tokens en localStorage sin explicar antes" se cumplió en la letra (explicó primero) pero terminó proponiendo exactamente ese patrón (localStorage) — ver Parte B, punto 3. | No aplica (no hay convenciones escritas contra las que medir). |
| **Errores factuales** | Ninguno detectado. | Describió la ruta de logout como `POST /api/v1/account/profile` — la ruta real es `POST /api/v1/account/logout` (`/account/profile` es solo `GET`, para el perfil). |
| **Intervenciones** | 1 (autoricé algo a mitad del plan, cuando preguntó si confirmaba el enfoque de token). | 0 (no respondí a la pregunta de ajuste que hizo al final). |
| **Qué habría que arreglar a mano antes de mostrárselo a alguien del equipo** | Confirmar el key exacto de localStorage y decidir si se incluyen los tests de Japa que ofreció, antes de pasar a implementación. | Corregir la ruta de logout equivocada antes de que alguien la use como referencia. Pedir que concrete nombres de archivo y estructura de carpetas — el plan es más ambiguo en ese nivel. |

## Parte B: las tres líneas

1. **Qué piezas montaste y cuál te costó más de lo que esperabas.**
   Monté dos piezas: `CLAUDE.md` (convenciones + prohibiciones) y un hook `PostToolUse` que corre el lint automáticamente. El hook costó más de lo esperado: aunque el `CLAUDE.md` es más largo, fue más sencillo de construir — una sola pasada sin fricción. El hook, en cambio, necesitó descubrir que Claude Code no vigila `.claude/` si la carpeta no existía al arrancar la sesión, y recargar la configuración con `/hooks` antes de que funcionara de verdad.

2. **La primera diferencia que viste entre las dos salidas, y en qué te fijaste para verla.**
   Lo primero que noté fue un error de endpoint: la respuesta sin harness dice que `POST /api/v1/account/profile` existe, cuando en realidad esa ruta es `GET` (la con harness sí lo muestra correctamente como `GET /api/v1/account/profile`). Además, el plan con harness tiene más detalle — 6 pasos contra 5 — y propuso una estructura de archivos concreta, mientras que el sin harness no mencionó ninguna estructura de archivos.

3. **Algo que dejaste escrito en el harness y que el agente no cumplió igualmente.**
   Le escribí en el `CLAUDE.md` que no inventara su propio esquema de autenticación (tokens guardados a mano en `localStorage`) sin explicar antes cómo iba a manejar el token del backend. La copia con harness cumplió la letra: explicó su razonamiento antes de proponer nada. Pero lo que propuso fue justo guardar el token en `localStorage` — el mismo patrón que mi regla usaba como ejemplo de lo que quería evitar. La regla decía "explica antes de hacerlo", no "evita hacerlo", y el agente se quedó con la lectura más permisiva de las dos.
