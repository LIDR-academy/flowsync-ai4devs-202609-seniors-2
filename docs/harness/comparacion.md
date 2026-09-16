# Comparación con harness vs sin harness

Ticket: el login de FlowSync (login exitoso, datos incompletos, datos incorrectos, bloqueo por intentos).

## Parte A

Con harness se tocaron 25 archivos (13 nuevos + 10 de test + 2 modificados). Sin harness fueron 9, y ninguno de test.

Con harness tenía reglas escritas (AGENTS.md) y se siguieron casi todas. Sin harness no tenía nada escrito, así que ahí no hay mucho que juzgar en cuanto a convenciones, hizo lo que le pareció y eso incluyó copiar mal la regla del password (le puso mínimo 8 caracteres en el login, esa regla es solo para el registro) y no escribió ningún test.

Intervenciones: en con harness tuve que responder un par de rondas de preguntas antes de que implementara, y corregir un bug real que encontré probando la app. En sin harness tuve que pararlo cuando se puso a curiosear el otro repo, negarle un cambio cuando intentó tocar el backend, y también modificó el src del frontend sin pedirme permiso primero, aunque se le había dicho que debía pedirlo.

Qué arreglaría a mano: en con harness nada grave del login en sí, pero sí el diseño. En sin harness la regla del password, los tests que faltan, y decidir qué hacer con lo del bloqueo por intentos que quedó sin hacer.

Diseño: sin harness quedó bastante mejor. Tiene estilos propios para el formulario, los campos, los errores y el perfil (`.auth-form`, `.field`, estado de error, botón deshabilitado, avatar). Con harness quedó prácticamente sin estilos, el formulario se ve con el look por defecto del navegador. La diferencia es que yo nunca pedí nada de diseño en las reglas del harness, así que nadie lo tocó.

## Parte B

1. Lo que más me costó de lo esperado: un bug en el login (la respuesta del backend viene envuelta y el frontend no lo esperaba) que pasó las 4 revisiones del pipeline sin que nadie lo viera. Arreglarlo tomó como 10 minutos solo por la cantidad de agentes que hay que volver a pasar.

2. La primera diferencia que noté: el sin harness se perdió en un momento. Como no le quité el README del ejercicio, lo leyó, entendió que tenía que armar él mismo la comparación, y se puso a hacer eso y a curiosear el otro repo en vez de resolver el ticket. Tuve que pararlo y decirle que solo hiciera el login.

3. Algo que dejé escrito y no se cumplió: dije que todo cambio en frontend pasa por el pipeline de subagentes, y esa regla tampoco se cumplió: el agente editó `frontend/.env` a mano él mismo para poder levantar el proyecto, sin pasarlo por ese proceso.
