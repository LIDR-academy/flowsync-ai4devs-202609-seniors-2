# FlowSync — Alcance MVP (PRD)

## Estado actual del proyecto

Hoy FlowSync solo ofrece la gestión de cuenta: registro, inicio de sesión, consulta del perfil y cierre de sesión. La autenticación se basa en access tokens opacos (backend AdonisJS 7, frontend React 19).
El modelo de datos se limita a dos tablas: `users` (`id`, `full_name`, `email` único, `password` hasheado, timestamps) y `auth_access_tokens`, que depende de `users` en relación 1‑N con borrado en cascada.
El dominio de negocio (equipos, proyectos, tareas, asignaciones) todavía no existe. Tampoco hay edición de perfil, restablecimiento de contraseña, expiración de tokens ni tests.

## Decisiones de producto

### Problema

- **Qué duele hoy**: la daily de sincronización y el «¿en qué estás?» constante por Slack o por chat. Nadie ve el estado del equipo sin interrumpir a alguien.
- **Episodio concreto**: dos personas tocaron el mismo módulo la misma semana, porque una empezó sin que la otra lo supiera. Resultado: dos días perdidos.
- **Qué desaparece de la reunión (sin venderlo de más)**: la daily **no** desaparece entera. Solo desaparece la ronda de «¿en qué estás?», que hoy se come la mitad de los 15 minutos. La parte de bloqueos sigue, y este MVP no la resuelve.
- **Decisión que cambia el producto**: no empezar una tarea que otra persona ya está tocando, y elegir la siguiente sabiendo qué está libre. Si el único beneficio fuera «sentirse informado», el tiempo real no valdría lo que cuesta.

### Usuarios

- **Quién cobra el valor**: los pares, no un lead. No hay reporte hacia arriba, y a un manager le daría igual. El problema afecta a los dos devs que descubren tarde que iban a lo mismo, y al que interrumpe a un compañero para preguntar.
- **Público objetivo**: equipos remotos pequeños, de 3 a 10 personas. Roles planos: en el MVP todos ven y editan lo mismo, sin jerarquía de permisos.
- **Primer usuario (caso de estudio, no un cliente real)**: un equipo de producto SaaS de 6 personas, repartido en 3 husos horarios. Hoy usa un gestor de tareas pesado y hace una daily de 15 minutos por videollamada.

### Propuesta de valor y principios

- **«Tiempo real»**: ver los cambios de estado de las tareas sin refrescar la página ni preguntar a nadie. **No** es chat, **no** es videollamada, **no** es edición simultánea de un mismo documento.
- **Frescura, no presencia**: el estado pertenece a la **tarea**, no a la persona. Nada de «quién está conectado» ni indicadores de actividad. Eso es vigilancia, y lo rechazamos a propósito.
- **Forma de la señal**: un resumen que espera a que lo consulten, no un aviso que interrumpe. El caso de uso: «llego por la mañana o salgo de una reunión, y veo qué se ha movido». Sin notificaciones push.
- **Origen del estado**: lo introduce la persona que hace la tarea, en segundos.
- **Por qué se sostiene el uso**: no porque sea más agradable, sino porque cuesta dos clics sobre una lista ya abierta, sin campos obligatorios ni sprint o estimación que decidir. Y quien actualiza se beneficia en el momento: esa lista es su propia cola de trabajo, la consulta para elegir qué coger y, de paso, dejan de interrumpirle para saber cómo va. Si el beneficio fuera solo para los demás, nadie actualizaría.
- **Es donde se hace el trabajo, no donde se cuenta**: FlowSync sustituye al gestor de tareas en lugar de convivir con él. FlowSync crea las tareas y no lee las de otra herramienta. Convivir obligaría a una doble actualización, y eso es lo que mata a las herramientas de esta categoría.
- **«Menos rollo que Jira»**: crear una tarea y cambiar su estado en segundos, sin configuración de flujos ni campos obligatorios. Lo mínimo para saber quién está en qué.

### Alcance del MVP

- **Un espacio único compartido**, sin entidad «equipo».
- **Una tarea contiene**: un título, un responsable, un estado y una fecha de vencimiento. La fecha sirve para detectar de un vistazo qué se ha pasado de plazo.
- **Consulta de la lista**: filtro por estado, para centrarse en lo pendiente.
- **Cuánto construir**: una vertical fina, usable de punta a punta, y no el andamiaje amplio de un producto completo. Mejor una funcionalidad terminada que tres a medias.

### Fuera de alcance

- Varios equipos separados, o personas que pertenecen a varios equipos. Queda anotado como **supuesto** y no se construye.
- La presencia (quién está conectado) y los indicadores de actividad.
- Las notificaciones push.
- El chat, la videollamada, la edición colaborativa simultánea.
- El estado derivado de señales externas (Git/PR, CI, calendario): sería otro producto, con integraciones y OAuth de terceros.
- La sincronización o la importación desde otro gestor de tareas.
- Los sprints, estimaciones, épicas, backlog priorizado e informes. Un equipo que los necesite no es nuestro usuario.
- La resolución de bloqueos (que sigue en la daily).

### Supuestos y riesgos

- **Supuesto**: un espacio único basta, porque el usuario objetivo solo pertenece a un equipo.
- **Riesgo n.º 1, a validar con prioridad**: que los estados no se mantengan al día. Si la información se queda vieja, el producto pierde el sentido, y este riesgo se asume. La mitigación consiste en que actualizar cueste tan poco como dos clics, en lugar de obligar a nadie.

### Criterios de éxito

- **Para el usuario**: dejar de hacer la ronda de «¿en qué estás?» de la daily, porque el estado del equipo se ve de un vistazo.
- **Criterio tras una semana de uso real**: el equipo cancela esa ronda y nadie pide que vuelva. Si la siguen haciendo igual que antes, el MVP ha fracasado.

## Preguntas abiertas (problema, usuarios, alcance)

Las cinco preguntas iniciales han quedado respondidas por las decisiones anteriores:

1. **Problema**: ¿qué problema concreto, con qué herramienta hoy, y qué haría cambiar? → *Resuelta* (ver Problema, y Propuesta de valor y principios).
2. **Usuarios**: ¿qué tipo de equipo, qué roles? → *Resuelta* (ver Usuarios: de 3 a 10 personas en remoto, roles planos).
3. **Valor central**: ¿qué recorrido principal, qué indicador de éxito? → *Resuelta* (ver Alcance del MVP y Criterios de éxito).
4. **Colaboración**: ¿un usuario solo, un equipo, varios equipos? → *Resuelta* (un espacio único compartido; el multiequipo queda fuera de alcance).
5. **Fuera de alcance**: ¿qué queda excluido? → *Resuelta* (ver Fuera de alcance). No se ha expresado ninguna restricción de plazo ni de recursos, salvo la regla «una vertical terminada».
