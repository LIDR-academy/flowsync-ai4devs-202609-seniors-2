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

- **Modelo:** Sonnet 5
- **Herramienta:** Claude Code

```
Usa el MCP de Atlassian para consultar la actividad FLOW-1 del espacio FlowSync.
Solo lee y resume su título, descripción y criterios de aceptación.
No modifiques Jira ni el código.
```

**Qué salió:** A la primera falló con errores diferentes. se elimino el mcp y se volvió a configurar y ya se solucionó. Al final también identifiqué que había problemas con la conectividad/API de claude code.


## Prompt 2

- **Modelo:** Sonnet 5
- **Herramienta:** Claude Code

```
Registrar usuario

Como persona que aún no tiene una cuenta en FlowSync, quiero registrarme con mi correo y una contraseña para poder acceder a la aplicación.

Criterios de aceptación:

1. Registro exitoso
Dado que no tengo una cuenta,
cuando completo un correo válido disponible, una contraseña y su confirmación siguiendo las reglas de registro,
entonces se crea mi cuenta y accedo a una pantalla de bienvenida.

2. Datos incorrectos
Dado que estoy completando el registro,
cuando faltan datos obligatorios, el correo no es válido o las contraseñas no cumplen las reglas,
entonces se me indica qué debo corregir y no se crea la cuenta.

3. Correo existente
Dado que mi correo ya está registrado,
cuando intento crear otra cuenta con él,
entonces se me informa de que ese correo ya está en uso.

Alcance: registro con correo y contraseña, sin verificación por correo ni acceso con cuentas externas.
```

**Qué salió:** La funcionalidad que implementó el agente principal presentó un bug que fue identificado por el agente revisor que la dientificó y reportó. El agente principal resolvi´po el fix y al final yo pude ver que el front estaba corriendo sin problemas. El agente no creó los tests que le pedí.


## Prompt 3

- **Modelo:** Sonnet 5
- **Herramienta:** Claude Code

```
oye no creaste los archivos de test unitarios. por que no lo hiciste si te pedí en las instrucciones que crearas las pruebas?
```

**Qué salió:** Me argumentó que no creó test porque en el proyecto no hay una librería para ello y yo le pedí que no instalara dependencias sin mi consentimiento. De hecho fue algo que dejó pendiente escrito en la salida.


## Prompt 4

- **Modelo:** Sonnet 5
- **Herramienta:** Claude Code

```
Si, instala Vitest + React Testing Library en frontend/ y escribe las pruebas unitarias de los 3 criterios de aceptación
```

**Qué salió:** Pidió muchos permisos para ejecutar comandos como cd y grep pero finalmente si instaló la librería y creó los tests

