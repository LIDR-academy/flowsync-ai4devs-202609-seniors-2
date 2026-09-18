# Prompts

---

## Prompt 1 — con harness (ticket vago)

**Modelo:** Sonnet 5 · Claude Pro (Claude Code v2.1.277)  
**Herramienta:** Claude Code — `/priority-ticket`  
**Repo:** `flowsync-ai4devs-202609-seniors-2` (`/clear`)

```
/priority-ticket docs/harness/ticket.md
```

**Ticket (`docs/harness/ticket.md`):**
```
Título: Login

La gente no puede entrar a la app desde la web. Arreglá eso.
```

**Qué salió:** plan solo. ~4–5 archivos (`lib/api.ts`, `lib/auth.ts`, `LoginForm.tsx`, `App.tsx`, CSS opcional). Sin signup (CLAUDE.md). Sin proxy/Context. **Admitió ticket sin AC**, propuso criterios 1–8 y **preguntó antes de implementar**. Citó localStorage y Prettier del harness.

---

## Prompt 2 — sin harness (mismo ticket vago)

**Modelo:** Sonnet 5 · Claude Pro (Claude Code v2.1.277)  
**Herramienta:** Claude Code (sin skill)  
**Repo:** `flowsync-sin-harness-2` (`/clear`)

```
Solo plan, no implementes ni edites archivos.
Incluí: archivos que tocarías (contados), API que usarías, y cómo cubrís el ticket.

Título: Login

La gente no puede entrar a la app desde la web. Arreglá eso.
```

**Qué salió:** plan solo. **6 archivos** incl. proxy Vite, `AuthContext`, `pages/LoginPage`. Asumió más arquitectura. Tocó CORS prod como riesgo. No preguntó criterios: los inventó e implementaría.
