# Prompts

---

## Prompt 1 — con harness

**Modelo:** Sonnet 5 · Claude Pro (Claude Code v2.1.277)  
**Herramienta:** Claude Code — skill `/priority-ticket`  
**Repo:** `flowsync-ai4devs-202609-seniors-2` (`/clear` antes)

```
/priority-ticket docs/harness/ticket.md
```

**Qué salió:** plan solo. **4 archivos:** `lib/auth.ts`, `LoginForm.tsx`, `App.tsx`, `App.css` (opcional). Sin proxy Vite (leyó CORS). Criterios 1:1. Riesgos serialize/status. Citó CLAUDE.md (localStorage) y hook Prettier. Ofreció `adversarial-reviewer` / implementar solo si se pide.

---

## Prompt 2 — sin harness

**Modelo:** Sonnet 5 · Claude Pro (Claude Code v2.1.277)  
**Herramienta:** Claude Code (sin skill)  
**Repo:** `flowsync-sin-harness-2` (`/clear` antes)

```
Solo plan, no implementes ni edites archivos.
Incluí: archivos que tocarías (contados), API que usarías, y cómo cubrís el ticket.

Título: Implementar login en el frontend

Como usuaria quiero iniciar sesión con email y contraseña y ver que quedé autenticada.
También poder cerrar sesión.
Si fallo, un mensaje claro. Sin registro en este ticket.
```

**Qué salió:** plan solo. **7 archivos:** `api/auth.ts`, `auth/useAuth.ts`, `LoginForm.tsx`, `SessionView.tsx`, `App.tsx`, `App.css`, `vite.config.ts` (proxy). Sin CLAUDE.md → infirió oxlint. Mismos endpoints. Más capas / proxy no pedido.
