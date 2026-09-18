# Comparación: con harness vs sin harness

**Encargo:** mismo ticket corto (`ticket.md`).  
**Modelo / herramienta:** Sonnet 5 · Claude Pro · Claude Code v2.1.277.  
**Nota:** sin Jira/MCP. Ambas corridas tras `/clear`.

## Con harness

| Casilla | Notas |
|--------|--------|
| Archivos que propone tocar (contados) | **4:** `frontend/src/lib/auth.ts` (nuevo), `LoginForm.tsx` (nuevo), `App.tsx`, `App.css` (opcional / omitible). Explicitó 0 backend, sin signup, sin deps nuevas. |
| Convenciones que respetó / no respetó | **Respetó:** no inventar endpoints; leer routes/validators/cors; solo plan; Bearer + localStorage (lo justifica con CLAUDE.md); pocos archivos; Prettier por hook; ofrece adversarial-reviewer. **No pidió el ticket:** `VITE_API_URL` y `App.css` “opcional” (alcance chico). |
| Veces que intervine | **0** |
| Qué arreglaría a mano antes de mostrarlo | Confirmar shape de `serialize` y status de error con curl; decidir si `App.css` entra o no. |

## Sin harness

| Casilla | Notas |
|--------|--------|
| Archivos que propone tocar (contados) | **7:** `api/auth.ts`, `auth/useAuth.ts`, `components/LoginForm.tsx`, `components/SessionView.tsx`, `App.tsx`, `App.css`, `vite.config.ts` (proxy). 0 backend. |
| Convenciones que respetó / no respetó | **No había** lista escrita → lo dijo e infirió `.oxlintrc`. De facto: sin signup, sin libs, sin Context. **Extra vs ticket:** proxy en Vite (CORS ya alcanza); más carpetas (`api/`, `auth/`, `components/`) y componente de sesión aparte. |
| Veces que intervine | **0** |
| Qué arreglaría a mano antes de mostrarlo | Sacar o justificar el proxy; unificar naming; confirmar `serialize`; localStorage vs sessionStorage. |

## Diferencias (dónde me fijé)

| Qué | Con harness | Sin harness |
|-----|-------------|-------------|
| Conteo | 4 | 7 |
| Layout | plano (`lib/` + root src) | `api/` + `auth/` + `components/` |
| Dev API | `VITE_API_URL` / URL absoluta (CORS ok) | proxy en `vite.config.ts` |
| Referencia harness | CLAUDE.md, Prettier hook, adversarial-reviewer | ninguna |

## Parte B — tres líneas

1. **Piezas / cuál costó más:** monté CLAUDE.md + AGENTS.md (symlink), skills `/priority-ticket` y `/commit`, subagente `adversarial-reviewer`, hook Prettier. No monté MCP Jira. Lo que más costó fue dejar el ticket corto y las dos corridas limpias (`/clear`) sin mezclar prompts.
2. **Primera diferencia que vi:** el **número de archivos** — 4 vs 7 — al mirar la tabla “Archivos a tocar” de cada plan; enseguida el proxy de Vite solo en la pelada.
3. **Algo del harness que igual no cumplió:** en AGENTS/CLAUDE pedí pocos archivos y no expandir alcance; el plan con harness igual metió `VITE_API_URL` y dejó `App.css` como opcional aunque el ticket no pedía env ni estilos.
