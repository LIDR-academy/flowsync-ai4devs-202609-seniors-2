# Prompts

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
  entonces el sistema bloquea la cuenta por intentos fallidos
```
