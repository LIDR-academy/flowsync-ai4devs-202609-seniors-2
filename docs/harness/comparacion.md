# Comparación: con harness vs sin harness

**Autor:** Joaquim Mauri (quim123) · **Fecha:** 14/09/2026 · **Reloj:** inicio 19:37:40 / fin 20:17:05 (39,4 de 45 min, `reloj.log`; las corridas terminaron a las 20:08 y 20:13)
**Modelo:** Opus 5 (1M context), esfuerzo high, modo auto (mismo en ambas) · **Herramienta:** Claude Code CLI 2.1.270
**Encargo:** FLOW-2 «Crear cuenta desde la aplicación web» (mismo texto palabra por palabra en las dos copias: `encargo.txt`, SHA1 `F60FDE833919`)
**Harness:** A) `CLAUDE.md` con secciones «Prohibido» y «Convenciones» (orienta antes) · B) hook `PostToolUse` `Edit|Write` que pasa oxlint `--deny-warnings` al frontend (comprueba después)

| Casilla | Con harness | Sin harness |
|---|---|---|
| **Qué archivos tocó** (contados) | **12**, todos en `frontend/`: 4 nuevos (`api/client.ts`, `api/auth.ts`, `features/signup/SignupForm.tsx`, `validation.ts`), 4 modificados (`App.tsx`, `App.css`, `index.css`, `index.html`) y 4 assets borrados | **20**: los mismos del frontend + `SignupForm.css`, `SignupForm.test.tsx`, `vite.config.ts`, `package.json`, `package-lock.json`, y **3 del backend**: `validators/user.ts`, test nuevo `signup.spec.ts`, `tmp/db.sqlite3` |
| **Convenciones respetadas** (una a una) | No tocó `backend/` · sin dependencias nuevas · no lanzó `node ace` · replicó las reglas del validador · textos en español · `lint` y `build` pasan | Ninguna escrita. Por su cuenta: textos en español · `lint` y `build` pasan · añadió tests |
| **Convenciones no respetadas** (una a una) | Nombre **obligatorio**, contra el validador (`nullable`): se fió de la API en `:3333`, que era la de la pelada · `App.tsx` escrito con `cat >`, fuera del hook · assets borrados con `git rm` (quedan en el índice) | — (no había ninguna escrita). Frente al harness: **cambió el validador del backend** · lanzó `node ace` (`migration:status`, `test`) · 4 dependencias nuevas (`vitest`, `@testing-library/*`, `jsdom`) · arrancó servidores y escribió en la base de datos |
| **Intervenciones** (corregir / aclarar / repetir / parar) | 0 | 0 |
| **Qué arreglaría a mano** antes de enseñarlo al equipo | Quitar la obligatoriedad del nombre · revisar `App.tsx` (no pasó por el hook) · sacar del índice los borrados de `git rm` · probarlo en el navegador (no lo hizo) | Revertir el validador y el test del backend (o llevarlos a otro ticket) · decidir si se quedan `vitest` y compañía · revisar `db.sqlite3` · probarlo en el navegador (no lo hizo) |

> El hook no se disparó ninguna vez en la corrida (el lint pasaba). **Las dos copias compartían puerto:** la pelada cambió su validador a las 20:04:29 con su backend levantado en `:3333`, y la copia con harness consultó ese backend a las 20:05:54.
> Casillas redactadas con apoyo de Claude a partir de las transcripciones y de `comprobar-paso.ps1 cambios`, no de memoria.

---

## Parte B: las tres líneas

1. **Qué piezas monté y cuál me costó más de lo esperado:** monté dos: `CLAUDE.md` con `/init` más una sección «Prohibido» y «Convenciones» (orienta antes), y un hook `PostToolUse` que pasa oxlint al frontend (comprueba después). Generarlas fue rápido, unos 2 min cada una. Lo caro fue `CLAUDE.md`: `/init` metió dos veces un párrafo que describía el propio ejercicio y tuve que borrarlo a mano, y además relancé `/init` por error al reiniciar. Aun así, lo que más tiempo se llevó fue escribir el ticket y el encargo (unos 13 min), no las piezas.
2. **La primera diferencia entre las dos salidas y dónde estaba mirando:** a los tres minutos de lanzar, la pelada ya había ejecutado `node ace` y arrancado el backend, mientras la copia con harness leía el validador sin arrancar nada. No lo vi en las terminales: lo vi en el resumen de progreso que saqué de las transcripciones (la lista de comandos de cada agente).
3. **Algo que dejé escrito en el harness y que el agente no cumplió igualmente:** en «Convenciones» escribí que, antes de suponer un campo, leyera el validador real. Lo leyó (`fullName` es `nullable`), pero hizo obligatorio el nombre porque la API en `:3333` le respondía `required`, y esa API era el backend de la pelada, que acababa de cambiar su validador. Leyó la regla, pero dio más crédito a una prueba contra un servidor que no era el suyo.
