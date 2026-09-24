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

**Modelo:** GPT 5.6 Sol Medium
**Herramienta:** Codex

```
Implementa el tiket de jira en este proeyecto

Tiket: FLOW-1 (https://sapiensis.atlassian.net/browse/FLOW-1)
Titulo: Permitir crear una cuenta desde la pantalla inicial de FlowSync

Descripcion: 
Contexto
La pantalla inicial de FlowSync muestra contenido de demostración. Una persona nueva necesita poder crear una cuenta para empezar a utilizar el producto.

Historia
Como persona que visita FlowSync por primera vez, quiero crear una cuenta desde la pantalla inicial para poder empezar a utilizar el servicio.

Criterios de aceptación

La pantalla inicial muestra el nombre FlowSync y un formulario de registro, sin el contador ni los enlaces de demostración.

El formulario solicita email, nombre y contraseña.

Si faltan datos obligatorios o hay datos inválidos, se muestra un mensaje comprensible que permita corregirlos.

Mientras se procesa el registro, se indica que está en curso y se evita enviar la misma solicitud varias veces.

Si el registro tiene éxito, se muestra una confirmación clara.

Si el servicio rechaza el registro o no responde, se informa del problema sin mostrar una confirmación falsa.

Fuera del alcance:
No se incluye inicio de sesión, recuperación de contraseña ni una pantalla de usuario después del registro.
```
Primeros tres intentos: falló antes de modificar archivos porque faltaba codex-code-mode-host.exe

## Prompt 2

'''
Ejecuta Get-Location en PowerShell y muestra el resultado. No modifiques archivos.
'''
Para validar que ya esta habilitado: '''& "C:\Users\kenia\.vscode\extensions\openai.chatgpt-26.908.40401-win32-x64\bin\windows-x86_64\codex.exe" --enable code_mode_host'''

## Prompt 3
Identifo al 1

**Qué salió:** (opcional, una línea) funcionó a la primera / tuve que insistir / me inventó una ruta que no existe.

Funciono a la primera, me hizo tres preguntas para solicitar permiso de ejecución de comandos. Quedaron 18 minutos de sobra, pero empecé a correr tiempo cuando ya tenía el AGENTS.md. La copia sin harness genero cosas que no pedí, funcionó a la primera pero agregando un logo, cambiando fondo, se veía "lindo" y hacía lo que le pedí pero hizo otras cosas.
