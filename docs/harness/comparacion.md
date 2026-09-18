# Comparativa: Ejecución CON Harness vs SIN Harness — Feature de Login

## 1. Alcance cubierto

| | **CON Harness** | **SIN Harness** |
|---|---|---|
| Login exitoso | ✅ | ✅ |
| Validación de datos incompletos/inválidos | ✅ (espejo exacto del `loginValidator` del backend) | ✅ (bloqueo en cliente antes de tocar servidor) |
| Mensaje ante credenciales incorrectas | ✅ (genérico ante 400) | ✅ (diferenciado) |
| Bloqueo por 20 intentos fallidos | ❌ **Fuera de alcance, por decisión explícita del usuario** | ✅ Implementado desde cero (backend + lógica nueva) |
| Toca el backend | ❌ No, solo consume la API existente | ✅ Sí, modificación real de modelos, controladores, migraciones |

---

## 2. Rigor de verificación y calidad

| | **CON Harness** | **SIN Harness** |
|---|---|---|
| Lint | ✅ Verificado, sin warnings | No mencionado |
| Build | ✅ Verificado (`tsc -b && vite build`) | No mencionado |
| Tests automatizados | **29/29** (unitarios, por capa: servicios, hooks, contexto, componentes) | **5** tests funcionales, solo de backend |
| Cobertura medida | ✅ 98.31% statements / 90.62% branches / 96.42% functions / 99.13% lines (umbral 80%) | No se reporta ninguna métrica de cobertura |
| Verificación en navegador real | ✅ 5 pasos del flujo, sin errores de consola | ✅ "pasada manual" contra ambos servidores |
| Tests de frontend | ✅ Uno por módulo (`.test.ts`/`.test.tsx` en casi cada archivo nuevo) | ❌ No se lista ningún test de frontend |

**Lectura:** acá la diferencia es notable. La ejecución con harness dejó un rastro de calidad mucho
más denso y verificable: cobertura numérica, lint y build como parte de la "compuerta de calidad",
y un test por cada pieza nueva del sistema. La ejecución sin harness se apoya sobre todo en una
verificación manual, pero es bastante menos trazable y deja el frontend sin ningún test automatizado reportado.

---

## 3. Higiene de scope y transparencia

Ambos reportes muestran buena disciplina en un aspecto clave: **ninguno mezcla el trabajo con el
commit** y ambos manejan las variables de entorno sin hardcodear URLs.

Hay, sin embargo, vale la pena señalar:

- **Con harness** documenta con total honestidad un efecto secundario de su propia verificación:
  quedó un usuario de prueba (`harness.test@example.com`) en la base de datos local, creado durante
  las pruebas en navegador. Lo declara explícitamente como una nota operativa, sin intentar
  ocultarlo ni revertirlo por su cuenta.
- **Sin harness** hace un ejercicio de trazabilidad distinto pero igual de valioso: separa
  claramente qué archivos modificó *este* cambio de cuáles ya estaban modificados *antes* de que
  empezara la sesión (los 9 archivos de codegen de AdonisJS y `prompts.md`), evitando atribuirse
  ruido que no generó.

Ambas son buenas prácticas de transparencia, aplicadas a problemas distintos.

---

## 4. Tiempo de ejecución

| | **CON Harness** | **SIN Harness** |
|---|---|---|
| Duración total | **14m 45s** | **20m 44s** |
| Diferencia | — | +5m 59s (≈40% más lento) |

La ejecución sin harness invirtió minutos adicionales en tocar 
backend, escribir migraciones, armar el mecanismo de bloqueo de cuenta y
hacer una pasada manual — y aun así terminó con menos tests, sin lint ni build verificados, y sin
ninguna cifra de cobertura. La ejecución con harness, en cambio, resolvió su alcance (más acotado,
sí, pero no trivial) más rápido y dejó atrás un rastro de calidad bastante más sólido.

---