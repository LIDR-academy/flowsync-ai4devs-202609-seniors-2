# Prompts

Aquí van **todos los prompts que lanzaste** para hacer el ejercicio, en el orden en que los
lanzaste, con el modelo y la herramienta de cada uno.

Esto no es papeleo. Lo que se revisa es **cómo pediste las cosas**, no solo lo que salió: un
resultado flojo con un prompt bueno y un resultado flojo con un prompt vago necesitan feedback
distinto, y sin este archivo no se distinguen.

## Cómo rellenarlo

- Un apartado `## Prompt N` por cada prompt.
- **Pega el prompt tal cual lo lanzaste**, dentro del bloque de código, aunque ocupe diez líneas
  y aunque tenga faltas. No lo reescribas para que quede bien: el que arreglaste mentalmente
  después no es el que lanzaste.
- Incluye también los que **no funcionaron**. Suelen ser los más útiles de leer.
- `Modelo` y `Herramienta` en todos. Si cambiaste de una a otra a mitad, se nota aquí.

Borra el ejemplo de abajo cuando escribas el primero.

---

## Prompt 1

**Modelo:** Opus 5 1M High
**Herramienta:** Claude Code

```
Necesitamos implementar una formulario de login que sirva de punto de entrada a la aplicación.

Al entrar en la aplicación lo primero que se verá es el formulario de login.
Los campos a rellenar son:
- Email
- Password

Bajo estos campos habrá un botón muy visible de **Sign in** y otro menos llamativo de **Sign up**.
El botón *Sign in* logea un usuario conocido. El botón *Sign up* registra un usuarios nuevo.
A todo usuario nuevo se le envía un correo a su email, para que confirme la cuenta. La cuenta solo se activa cuando se pulsa un enlace incluido en el email. 
Habrá un enlace para recuperar cuenta con el típico mensaje ¿Has olvidado tu contraseña?. Si se pulsa se solicita el email y si el email corresponde con una cuenta se envía a la cuenta un email de recuperación de contraseña. El email incluye un enlace que nos lleva a una pantalla donde se introduce una nueva contraseña. La contraseña se actualiza al completar el formulario y se le envía un nuevo email informando del cambio de contraseña.
Si el login es correcto se redirigirá al usuario a una pantalla de bien venida.
Si el login no es correcto se notifica el error. 
Si se falla 3 veces con la combinación email/password se desactiva la cuenta, se envía un email de notificación de que se ha desactivado la cuenta y con un enlace para recuperarla.
El enlace de recuperación activa automáticamente la cuenta.
 
## Criterios de aceptación
- Cuando un usuario introduce el email y contraseña correcto aparece la pantalla de bienvenida
- Cuando un usuario introduce un un email y/o contraseña incorrecta se muestra un mensaje de error.
- Cuando un usuario introduce un email y/o contraseña incorrecta, tres veces, se advierte que la cuenta se ha desactivado y se envía un correo al email, si es que existe. En el correo se incluye un enlace de recuperación de cuenta.
- Cuando un enlace de recuperación de cuenta llega a la aplicación la cuanta se reactiva.
- Cuando un usuario pulsa el botón de Sign up se envía un email a la cuanta para que confirme su cuenta
- Cuando un usuario confirma una cuenta mediante su enlace la cuanta queda activada y accesible
- Cuando un  Cuando un usuario pulsa el botón de Sign up, y la cuenta ya existe se muestra un mensaje de fallo.
- Cuando un usuario accede al formulario de login los campos de texto se muestran en el lenguaje del navegador.```

**Qué salió:** Analizó y preguntó sobre las fricciones que encontro entre el hardness y la petición.

## Prompt 2 (Respuestas a preguntas de Claude)

**Modelo:** Opus 5 1M High
**Herramienta:** Claude Code

```
· El backend real no soporta activación de cuenta, bloqueo por 3 fallos, reset de contraseña ni emails, y AGENTS.md prohíbe tocar `backend/`. ¿Cómo resolvemos la frontera? → Mock API en el dev server de Vite (Recomendado)
· Los textos deben mostrarse en el idioma del navegador. ¿Con qué? → Solución propia ligera (Recomendado)
· AGENTS.md exige TDD, ≥80% de cobertura unitaria y E2E antes de dar por válida la implementación. El frontend hoy no tiene ninguna infraestructura de test. ¿Qué monto? → Vitest + Testing Library + Playwright (Recomendado)
```

**Qué salió:** (opcional, una línea) funcionó a la primera / tuve que insistir / me inventó una ruta que no existe.
