## Problema

En un equipo remoto pequeño, nadie ve en qué está cada tarea sin interrumpir. La daily de 15 minutos se deja la mitad en la ronda de «¿en qué estás?», y entre reunión y reunión la misma pregunta sigue por el chat. El daño es concreto: dos personas tocan el mismo módulo la misma semana y pierden dos días. No es un problema de reporte hacia arriba.

## Usuarios

Pares de un equipo remoto de 3 a 10 personas, con roles planos: todos ven y editan lo mismo. El caso de estudio es un equipo de 6 personas de producto SaaS, en 3 husos horarios, con un gestor de tareas pesado y una daily de 15 minutos. No es un cliente real. Un equipo que necesite sprints, estimaciones, épicas, un backlog priorizado o informes no es usuario de esto.

## Propuesta de valor

Un solo lugar donde se crean las tareas y se ve, sin preguntar y sin refrescar, quién está en qué. Al llegar por la mañana o al volver de una reunión, el resumen ya está: no empiezas algo que otra persona está tocando y eliges lo siguiente entre lo que está libre. Quien actualiza lo hace en dos clics porque esa lista es su propia cola, y de paso deja de recibir interrupciones. La daily sigue; desaparece solo la ronda de estado. A la semana, el equipo cancela esa ronda y nadie pide que vuelva.

## Alcance

Una sola capability, usable de punta a punta, en un único espacio compartido:

- Crear una tarea con título, responsable, estado y fecha de vencimiento.
- Cambiar el estado en dos clics, sin sprint, sin estimación y sin más campos.
- Ver esos cambios sin refrescar la página.
- Al entrar, ver qué se ha movido y qué se ha pasado de plazo.
- Filtrar por estado para quedarse con lo pendiente.
- Cualquier persona del espacio ve y edita lo mismo.

## NO-alcance

- La ronda de bloqueos de la daily queda fuera, porque no ayuda a validar que ver el estado de las tareas basta para cancelar el «¿en qué estás?».
- Varios equipos, o una persona en más de uno, queda fuera: el supuesto del MVP es un único espacio, y no hace falta para el caso de las 6 personas.
- Chat, videollamada y editar a la vez el mismo documento quedan fuera, porque el valor es la frescura del estado, no otro canal.
- «Quién está conectado» y cualquier indicador de actividad quedan fuera, porque el estado es de la tarea y eso no ayuda a decidir si un trabajo está libre.
- Las notificaciones push quedan fuera, porque el caso es un resumen que espera al abrirlo; un aviso no demuestra que la lista se use para no pisarse.
- Traer el estado desde Git, pull requests, integración continua o calendario queda fuera, porque hay que validar que la persona lo actualiza en dos clics, no que una integración lo adivine.
- Leer las tareas de otro gestor queda fuera, porque convivir obligaría a actualizar en dos sitios, y lo que hay que validar es que el trabajo se hace aquí.
- Sprints, estimaciones, épicas, backlog priorizado e informes quedan fuera, porque no cambian la decisión de no empezar lo que otro ya toca.
- Permisos y jerarquía quedan fuera, porque con roles planos ya se puede ver y actualizar la misma lista.
- Que desaparezca la daily entera queda fuera, porque la promesa es solo la ronda de estado.
