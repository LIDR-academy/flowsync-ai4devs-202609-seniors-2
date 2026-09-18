# Comparación: con harness vs sin harness

**Encargo (vago, idéntico):** «Login — La gente no puede entrar a la app desde la web. Arreglá eso.»  
**Modelo / herramienta:** Sonnet 5 · Claude Pro · Claude Code v2.1.277  
**Nota:** sin Jira/MCP. Ambas corridas tras `/clear`.

## Con harness

| Casilla | Notas |
|--------|--------|
| Archivos que propone tocar (contados) | **4–5:** `lib/api.ts`, `lib/auth.ts`, `components/LoginForm.tsx`, `App.tsx`, CSS opcional. 0 backend, 0 deps. |
| Convenciones que respetó / no respetó | **Respetó:** no inventar endpoints; leer routes/validators/cors; sin signup (CLAUDE.md); localStorage (CLAUDE.md); pocos archivos; sin router. **Clave:** dijo que el ticket **no trae AC**, propuso criterios y **preguntó** antes de implementar. |
| Veces que intervine | **0** (el agente paró con preguntas; no lo guié). |
| Qué arreglaría a mano antes de mostrarlo | Confirmar shape `serialize` y status de error; acortar criterios 1–8 si el producto no pide tanto. |

## Sin harness

| Casilla | Notas |
|--------|--------|
| Archivos que propone tocar (contados) | **6:** `vite.config.ts` (proxy), `App.tsx`, `api/client.ts`, `auth/AuthContext.tsx`, `pages/LoginPage.tsx`, `LoginPage.css`. |
| Convenciones que respetó / no respetó | **No había** lista escrita. Leyó API y no tocó backend. **Expandió:** Context, `pages/`, proxy, errores 422 por campo, hilo CORS de producción. Inventó cobertura del ticket sin preguntar alcance. |
| Veces que intervine | **0** |
| Qué arreglaría a mano antes de mostrarlo | Sacar Context/proxy si no hacen falta; no abrir prod CORS en este ticket. |

## Diferencias (dónde me fijé)

| Qué | Con harness | Sin harness |
|-----|-------------|-------------|
| Conteo | 4–5 | 6 |
| Arquitectura | plana (`lib/` + form) | Context + `pages/` + proxy |
| Ante ticket vago | **pregunta** criterios / alcance | **asume** e inventa done |
| Signup | explícitamente fuera (CLAUDE.md) | no UI signup, pero habla de crear user por curl |
| Harness citado | CLAUDE.md, Prettier | ninguno |

## Parte B — tres líneas

1. **Piezas / cuál costó más:** CLAUDE.md + AGENTS.md (symlink), skills `/priority-ticket` y `/commit`, `adversarial-reviewer`, hook Prettier. Sin MCP Jira. Lo más costoso: afinar el ticket (de detallado → vago) para que la diferencia se note, y mantener las dos corridas limpias con `/clear`.
2. **Primera diferencia que vi:** en el plan con harness la sección **“Preguntas para confirmar”** / “el ticket no trae AC”; en la pelada no había esa freno y ya venía `AuthContext` + proxy. Me fijé al final de cada plan.
3. **Algo del harness que igual no cumplió:** pedí pocos archivos y no expandir; el lado con harness igual propuso **8 criterios de done** (más de lo que el ticket pedía) y dejó CSS “si hace falta” — sube probabilidad de disciplina, no la garantiza.
