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

---

## Prompt 1

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Creame un CLAUDE.md para que actúe de harness principal, en donde se describa qué hace el proyecto,
stack tecnológico, estructura de paquetes, convenciones generales del mismo, y qué cosas están
prohibidas hacer sin preguntar antes:

- No instalar dependencias nuevas (backend o frontend) sin decirlo explícitamente antes de hacerlo — por ejemplo, si para el login decide meter react-router o axios sin avisar.
- No tocar archivos generados por el framework (backend/.adonisjs/) — son autogenerados, editarlos a mano se pierde en el próximo build.
- No modificar migraciones ya aplicadas en backend/database/migrations/ — si falta una columna, se crea una migración nueva, no se edita la vieja.
- No inventar su propio esquema de autenticación en el frontend (tokens guardados a mano en localStorage, lógica de refresh propia) sin explicar antes cómo va a manejar el token que ya devuelve el backend.
- No hardcodear la URL del backend en el código del frontend.
No hacer commits sin antes preguntar y mostrar el mensaje previo del commit,
```

**Qué salió:**

---

## Prompt 2

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Crea un PostToolUse Hook q se dispare automaticamente cada vez q el agente termina de editar o escribir un archivo (write o Edit).
Y q corra el lin correpsondiente del backend o frontend segun la carpeta que corresponda en donde se toco el archivo y esto con el objetivo de validar que lo que escirbio cumple con las reglas de estilo del proyecto.
```

**Qué salió:**

---

## Prompt 3

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Crea un ticket de jira con el siguiente contenido y estructura:

Titulo: Crear inicio de sesion para los usuarios en FlowSync

Descripción: Actualmente no hay forma de que un usuario registrado acceda a la aplicación desde el navegador. Necesitamos que pueda ingresar su email y contraseña, y que una vez autenticado pueda usar el resto de la app sabiendo quién es.

Criterios de aceptación:
- Un usuario con cuenta existente puede iniciar sesión con su email y contraseña.
- Si las credenciales son incorrectas, el usuario se entera de que algo falló.
- Una vez dentro, la aplicación reconoce que el usuario está autenticado.
- Si el usuario cierra la pestaña y vuelve, no debería tener que iniciar sesión de nuevo cada vez (comportamiento típico esperado).
```

**Qué salió:** Creó FLOW-1 en el tablero, asignado a mí, estado "In Tech Analysis" (categoría To Do).

---

## Prompt 4

**Modelo:** Sonnet 5
**Herramienta:** Claude Code (sesión nueva, copia CON harness — `flowsync-ai4devs-202609-seniors-2`)

```
Dame un plan para resolver el siguiente problema, pero aun no lo implementes:

Titulo: Crear inicio de sesion para los usuarios en FlowSync

Actualmente no hay forma de que un usuario registrado acceda a la aplicación desde el navegador. Necesitamos que pueda ingresar su email y contraseña, y que una vez autenticado pueda usar el resto de la app sabiendo quién es.

Criterios de aceptación:
- Un usuario con cuenta existente puede iniciar sesión con su email y contraseña.
- Si las credenciales son incorrectas, el usuario se entera de que algo falló.
- Una vez dentro, la aplicación reconoce que el usuario está autenticado.
- Si el usuario cierra la pestaña y vuelve, no debería tener que iniciar sesión de nuevo cada vez (comportamiento típico esperado).
```

**Qué salió:** Plan completo de 6 pasos (cliente HTTP sin nuevas deps, AuthContext con Context API, LoginForm/LoginPage, ajuste de App.tsx, verificación manual). Explicó y justificó el manejo del token (localStorage + revalidación contra /profile) antes de tocar nada, citando explícitamente la regla del CLAUDE.md. No instaló nada nuevo. Preguntó "¿confirmas este enfoque?" antes de seguir. No implementó código (respetó la instrucción).

---

## Prompt 5

**Modelo:** Sonnet 5
**Herramienta:** Claude Code (sesión nueva, copia SIN harness — `flowsync-ai4devs-202609-seniors-2-sin-harness`)

```
Dame un plan para resolver el siguiente problema, pero aun no lo implementes:

Titulo: Crear inicio de sesion para los usuarios en FlowSync

Actualmente no hay forma de que un usuario registrado acceda a la aplicación desde el navegador. Necesitamos que pueda ingresar su email y contraseña, y que una vez autenticado pueda usar el resto de la app sabiendo quién es.

Criterios de aceptación:
- Un usuario con cuenta existente puede iniciar sesión con su email y contraseña.
- Si las credenciales son incorrectas, el usuario se entera de que algo falló.
- Una vez dentro, la aplicación reconoce que el usuario está autenticado.
- Si el usuario cierra la pestaña y vuelve, no debería tener que iniciar sesión de nuevo cada vez (comportamiento típico esperado).
```

**Qué salió:**
