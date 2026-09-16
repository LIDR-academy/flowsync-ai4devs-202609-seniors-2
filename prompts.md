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

## Con harness

### Prompt 1 

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
I've connected an MCP server so you can access my Kanban board. There's a single work item waiting there, fetch it and get to work.

```

**Qué salió:** funcionó a la primera. Me preguntó sobre el ejercicio, le dije que lo ignorara. Pidió instalar libraries para poder hacer una prueba real, le dije que no.

### Prompt 2

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
/critic
```

**Qué salió:** Reportó 4 hallazgos menores. No tuve tiempo de hacer nada más.

## Sin harness

### Prompt 1

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
I need your help to develop the frontend login for the application in this repo. This is the task you are given:
Implementar login en el frontend

Description

Story:
Como usuario de FlowSync, necesito ingresar a la aplicación con mi email y contraseña para poder acceder a mis tareas.

Criterio de aceptación:

Debe haber una página de login con campos para ingresar las credenciales. El campo para la contraseña debe ocultar el texto ingresado.

Luego de autenticar al usuario se deberá mostrar una página estática de bienvenida

Si falla la autenticación se deberá mostrar un error de usuario o contraseña inválidos, quedando en la página de login y blanqueando los campos del formulario.
```

**Qué salió:** armó la página de login pero no hacía nada

### Prompt 2
**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
I've tested the login form using an ad-hoc account and nothing happens after entering the credentials. There's no error message but I'm not taken to the welcome screen either.
```

**Qué salió:** me pidió ayuda para ver qué pasaba con DevTools

### Prompt 3
**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
 status is 200, and a token does show up
```

**Qué salió:** (me preguntaba por lo que se veía en DevTools) corrigió el problema y salió andando