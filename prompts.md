# Prompts

## Copia con harness

## Prompt 1

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
 quiero armar el harness de este projecto el cual esta en react con vite como servidor, la idea es solo modificar el frontend una regla es no se toca el backend en este projecto si algun agente intenta modificar el backend debemos bloquearlo, no guardes estes instrucciones a nivel de memoria de este projecto. El harness que quiero para este projecto es mejores practicas en typescript , todo el codigo implementando debe tener un test de validacion , la vista no debe contener logica de negocio, el codigo typescript debe tener tipado strictado no debe haber ninguna variable con tipo any , quiero que al terminar de escribir el codigo tengamos un agente que ejecute linter y prettier con las reglas de typecript, tambien quiero que al terminar se valida nuevamente el requerimiento contra la implementacion, aparte quiero que el agente no suponga ni de hipotesis sobre algun tema que no este explicito para ello sugiero un loop de razonamiento antes de entregar cualquier respuesta , una regla importante  es que el agente alla entendido totalmente el problema antes de tocar codigo, el revisor debe limitar a solo revisar el codigo revisar el requerimiento inicial que cumplas todo no solo el happy path y si hay que hacer algun cambio se lo pida al agente implementador , el coverage de los tests siempre debe superar el 80% de cobertura, quiero que tambien alla un agente que valide la seguridad del codigo para que no allan keys o libreria vulnerables dentro del codigo, quiero que los agente implementadores no agreguen dependencias sin solitar permisos , importante que los llamados apis de terceros y api keys siempre esten en varibles de entorno nunca quemadas en el codigo,los agente no deben generar ningun comando de git , este harness debe ser agnostico para cualquier modelo para eso vamos a crear un agents.md y se referencia dentro de claude.md cursor/ devin/ , el frontend debe mantener la misma politica de contraseña que ya utiliza el backend
```

**Qué salió:** generó `AGENTS.md`, `CLAUDE.md`, subagentes en `.claude/agents/` y el bloqueo técnico de `backend/` en `.claude/settings.json`.

## Prompt 2

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
dame un resuemn de 5 lineas con todo lo que hiciste
```

## Prompt 3

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
analiza el harness y dime que restricciones o consideraciones se pueden agregar para pontencializar este harness de frontend
```

## Prompt 4

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Como usuario de FlowSync quiero con mi usuario y contraseña iniciar sesion para poder acceder aplicacion.
Criterios de aceptación:

Login Exitoso
  Dado que tengo un cuenta,
  cuando completo un correo válido disponible, una contraseña que cumpla con las politicas del sistema accedo a la aplicacion.
  entonces ingreso a la aplicacion y veo mi perfil.

Datos incompletos
  Dado que estoy completando el inicio de sesion,
  cuando faltan datos obligatorios, el correo no es válido o las contraseñas no cumplen las reglas,
  entonces se me indica qué debo corregir y no inicio sesion.

Datos Incorrectos
  Dado que estoy completando el inicio de sesion,
  cuando faltan llene todos los campos obligatorios, pero algunos de estos es incorrecto 
  entonces se me indica que hay algo mal en las credenciales proporcionadas

Bloqueo por intentos fallidos de inicio de sesion
  Dado que estoy completando el inicio de sesion,
  cuando intente mas de 20 veces el inicio de sesion, 
  entonces el sistema bloquea la cuenta por intentos fallidos.
```

**Qué salió:** investigó el contrato del backend con un subagente, preguntó 4 puntos ambiguos (bloqueo por intentos, origen de los datos de perfil, dónde persistir el token, routing) antes de implementar, y delegó a `frontend-implementer`.

## Prompt 5

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
dame las preguntas sin resolver
```

**Qué salió:** confirmó que no había preguntas pendientes (ya se habían respondido todas), y aclaró que el único punto abierto era el gap de backend para el bloqueo real.

## Prompt 6

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
que has modificado?, que agente esta corriendo
```

**Qué salió:** reportó que la sesión principal no había tocado archivos directamente y que `frontend-implementer` seguía corriendo en background.

## Prompt 7

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
avísame cuando termine el agente
```

## Prompt 8

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
levanta los projectos y miremos que todo funcione bien
```

**Qué salió:** levantó backend y frontend, y al probar contra el backend real encontró el bug del envoltorio `data` en el login (no detectado por el pipeline de revisión automatizado), lo mandó a corregir y volvió a pasar por lint/formato.


---

## Copia sin harness 

## Prompt 1

**Modelo:** Sonnet 5 
**Herramienta:** Claude Code

```
Como usuario de FlowSync quiero con mi usuario y contraseña iniciar sesion para poder acceder aplicacion.
Criterios de aceptación:

Login Exitoso
  Dado que tengo un cuenta,
  cuando completo un correo válido disponible, una contraseña que cumpla con las politicas del sistema accedo a la aplicacion.
  entonces ingreso a la aplicacion y veo mi perfil.

Datos incompletos
  Dado que estoy completando el inicio de sesion,
  cuando faltan datos obligatorios, el correo no es válido o las contraseñas no cumplen las reglas,
  entonces se me indica qué debo corregir y no inicio sesion.

Datos Incorrectos
  Dado que estoy completando el inicio de sesion,
  cuando faltan llene todos los campos obligatorios, pero algunos de estos es incorrecto
  entonces se me indica que hay algo mal en las credenciales proporcionadas

Bloqueo por intentos fallidos de inicio de sesion
  Dado que estoy completando el inicio de sesion,
  cuando intente mas de 20 veces el inicio de sesion,
  entonces el sistema bloquea la cuenta por intentos fallidos.
```

**Qué salió:** entró en plan mode, exploró backend y frontend, preguntó 2 puntos (mecanismo de bloqueo, uso de router) y produjo un plan de 8 archivos, sin aplicarlo (el ejercicio original pedía solo comparar planes).

## Prompt 2

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
continua
```

**Qué salió:** no funcionó como se esperaba — el agente interpretó "continua" como pie para ir a inspeccionar la copia con harness (`../flowsync-ai4devs-...`) y empezó a leer archivos de esa otra copia; el humano tuvo que interrumpirlo a mitad de una tanda de comandos.

## Prompt 3

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
continua
```

**Qué salió:** tras la interrupción, esta vez el agente dejó de inspeccionar la copia con harness y preguntó cómo seguir solo dentro de `flowsync-sin-harness`.

## Prompt 4

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
si solo flowsync-sin-harness
```

**Qué salió:** completó `docs/harness/comparacion.md` y `prompts.md` en esa copia usando solo lo trabajado ahí, dejando la columna "con harness" pendiente.

## Prompt 5

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
no necesito que hagas comparacion con el proyecto con harness simplemente hacer la historia de usuario entregada
```

**Qué salió:** implementó el login directamente (`lib/api.ts`, `auth/AuthContext.tsx`, `auth/validation.ts`, `auth/LoginPage.tsx`, `profile/ProfilePage.tsx`, `App.tsx`, `main.tsx`, `App.css`, `.env.example`), corrió typecheck/lint, levantó ambos servidores, creó un usuario de prueba y quedó a mitad de intentar probar el flujo en el navegador (la transcripción pegada corta ahí, en `Skill(claude-in-chrome) Initializing…`). En algún punto de esta sesión el agente también intentó editar un archivo dentro de `backend/`; el humano denegó el permiso antes de que se aplicara (ver `docs/harness/comparacion.md`).



