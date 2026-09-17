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

**Modelo:** Sonnet 5 · Claude Team
**Herramienta:** Claude Code

```
Quiero montar un harness mínimo para este repositorio para trabajar con Claude Code.
Antes de crear algo, inspecciona la estructura del proyecto, los package.json y las convenciones existentes.
Crea al menos dos piezas de harness de familias distintas:
1. Una pieza que oriente al agente antes de actuar, con las convenciones del proyecto, los límites de lo que puede modificar y las reglas que debe seguir.
2. Una pieza que compruebe automáticamente el trabajo después de editar, usando los comandos de validación que ya existan realmente en el proyecto.

Para este ejercicio:
- el backend existente debe considerarse de solo lectura, bloquea cualquier intento de modificacion;
- puedes inspeccionarlo para entender rutas, validadores, modelos y contratos;
- el trabajo funcional posterior será sobre el frontend;
- no debes inventar comandos ni convenciones que no estén presentes en el repositorio;
- no implementes todavía ninguna funcionalidad del producto;
- no agregues dependencias por si solo, notificame para autorizarlo;
- toda funcionalidad implementada debe tener sus respectivas pruebas cuando exista infraestructura de testing; si no existe, notifícame antes de agregar herramientas o dependencias de testing;
- los agentes pueden usar comandos Git únicamente de lectura, como git status y git diff; no pueden ejecutar comandos que modifiquen el repositorio o su historial;

Al terminar, explícame qué piezas creaste, qué archivos modificaste y por qué tomaste esas decisiones.
```

**Qué salió:** funcionó a la primera; creó CLAUDE.md y hooks para bloquear cambios en backend, restringir Git a lectura y ejecutar lint automático sobre frontend.


## Prompt 2

**Modelo:** Sonnet 5 · Claude Team
**Herramienta:** Claude Code

Revisa únicamente los archivos de harness que acabas de crear. He detectado un problema de codificación de caracteres. Corrige el encoding de CLAUDE.md y de los archivos bajo .claude/ para que queden correctamente codificados en UTF-8, sin cambiar el contenido, las reglas ni el comportamiento del harness.
No modifiques frontend/, backend/ ni prompts.md.
Al terminar, indícame qué archivos corregiste.

**Qué salió:** no realizó cambios; verificó los archivos a nivel de bytes y determinó que estaban correctamente codificados en UTF-8. El problema era de visualización de la terminal, no del harness.

## Prompt 3

**Modelo:** Sonnet 5 · Claude Team
**Herramienta:** Claude Code

Implementa el siguiente ticket de producto:

Título: Inicio de sesión de usuario

Como usuario registrado de FlowSync, quiero poder iniciar sesión con mi correo y contraseña para acceder a mi cuenta.

Criterios de aceptación:
- Debe existir una pantalla de inicio de sesión.
- El usuario debe poder ingresar correo electrónico y contraseña.
- Al enviar credenciales válidas debe autenticarse contra la API existente.
- Si las credenciales no son válidas debe mostrarse un mensaje comprensible.
- Durante el envío debe indicarse visualmente que la operación está en curso.
- La interfaz debe ser usable tanto en escritorio como en móvil.
- No se deben introducir cambios en el backend.

**Qué salió:** implementó el login a la primera sin necesidad de aclaraciones; inspeccionó la API real, pasó lint/build y detectó que las respuestas exitosas estaban envueltas en `data`. El backend no fue editado directamente, aunque al levantar Adonis se regeneraron archivos bajo `backend/.adonisjs/`.