# Alcance MVP — FlowSync

### Problema

En equipos remotos pequeños, la única forma de saber en qué está cada quien es preguntando: la ronda de "¿en qué estás?" que se come media daily, o la pregunta por chat. No es solo incómodo: para cuando se contesta, la información ya está desactualizada. Consecuencia real y ya ocurrida: dos personas del equipo tocaron el mismo módulo la misma semana porque una empezó sin que la otra lo supiera — dos días de trabajo perdidos. El problema no es "hacer menos reuniones"; es que nadie ve el estado del trabajo sin interrumpir a alguien.

### Usuarios

Equipos remotos pequeños (3–10 personas), con roles planos: sin lead que reciba reportes ni permisos diferenciados, todos ven y editan lo mismo. Quien cobra el valor son los pares entre sí, no una jerarquía — la misma persona que actualiza su estado es quien consulta el de los demás para decidir qué coger a continuación.

### Propuesta de valor

Ver el estado de las tareas del equipo de un vistazo — al llegar por la mañana o volver de una reunión — sin preguntar y sin que nadie tenga que anunciarlo. No es presencia ("quién está conectado"): es frescura del estado de la tarea. La decisión que cambia con esto: no empezar algo que otra persona ya está tocando, y elegir lo siguiente sabiendo qué está libre. Se sostiene porque actualizar cuesta dos clics sobre una lista que la propia persona ya usa como su cola de trabajo, y quien la actualiza deja de recibir interrupciones preguntándole cómo va.

### Alcance

- Un espacio único y compartido de tareas, visible para cualquier persona autenticada.
- Cada tarea tiene: título, responsable (una persona), estado y fecha de vencimiento.
- Crear una tarea y cambiar su estado en segundos, sin campos obligatorios adicionales ni flujo de configuración.
- Cualquier usuario autenticado puede crear, editar o cambiar el estado de cualquier tarea (permisos planos, sin jerarquía).
- Ver la lista de tareas filtrada por estado, para centrarse en lo pendiente y detectar de un vistazo lo que se pasó de fecha.

### NO-alcance

- **Entidad "equipo" / espacios separados**: fuera. El caso de estudio es un único equipo compartido; resolver aislamiento multi-equipo no ayuda a validar si dejar de preguntar "¿en qué estás?" funciona.
- **Notificaciones push**: fuera. El valor es un resumen que se consulta cuando la persona quiere, no un aviso que interrumpe.
- **Integración con Slack**: fuera. Añade superficie de integración antes de validar si el hábito base (teclear el estado, mirar la lista) se sostiene por sí solo.
- **Roles y permisos avanzados**: fuera. El equipo objetivo es plano por definición; construir jerarquía de permisos resuelve un problema que este usuario no tiene.
- **Analítica / reporting**: fuera. Nadie en este equipo cobra valor reportando hacia arriba — no hay quien consuma ese reporte.
- **Comentarios en tareas**: fuera. El objetivo es frescura de estado, no conversación sobre la tarea; eso reintroduce parte del ruido que se quiere quitar.
- **Derivar el estado de Git, PRs, CI o calendario**: fuera. Exige integraciones y OAuth de terceros — es otro producto, y rompe la premisa de que el estado lo teclea la persona en segundos.
- **Sprints, estimaciones, épicas, backlog priorizado, informes**: fuera explícitamente. Un equipo que necesite eso no es el usuario de este MVP.

# Parte B
## 1. Cuántas cosas propuso la IA meter dentro, y cuántas quedaron después de tu recorte:
Ninguna
## 2. Tres cosas que dejaste fuera y por qué (forma "esto fuera, porque no ayuda a validar que…"):
Texto redundante, que explica lo que ya se dijo en el punto de manera concisa.
Items de la sección de No alcance que son casos muy extremos.
## 3. La exclusión de la que menos seguro estás, y qué tendría que pasar para que entrara:
El no crear la entidad equipo. Pienso que aunque sea ahora un equipo pequeño trae valor para mayor organización y menos ruido entre los devs que mirarian solo información relacionada a su equipo.