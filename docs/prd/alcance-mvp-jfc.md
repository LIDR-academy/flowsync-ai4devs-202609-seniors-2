# FlowSync — Alcance del MVP

## 1. Terreno existente

FlowSync hoy solo cubre la gestión de cuentas: una persona puede registrarse, iniciar sesión, ver su perfil y cerrar sesión.
No existe todavía nada de tareas, proyectos ni equipos.
El modelo de datos se reduce al usuario (nombre completo opcional, email único y contraseña) y a sus sesiones abiertas, sin relaciones entre usuarios.

## 2. Interrogatorio

**P1. ¿Quién es el usuario principal y cómo es el equipo?**
Equipos remotos pequeños, de 3 a 10 personas, con roles planos: todos ven y editan lo mismo, sin jerarquía ni reporte hacia arriba. El valor lo cobran los pares. Un único espacio compartido; varios equipos o personas en más de uno quedan fuera. Caso de estudio: equipo SaaS de 6 personas en 3 husos horarios.

**P2. ¿Qué debe saber alguien al abrir FlowSync que hoy solo sabe preguntando?**
En qué tarea está cada persona y en qué estado, qué está libre para cogerlo y qué se ha pasado de plazo. Decide dos cosas: no empezar algo que otra persona ya está tocando y elegir lo siguiente sabiendo qué está libre. Los bloqueos siguen en la daily; este MVP no los resuelve. Una tarea tiene título, responsable, estado y fecha de vencimiento.

**P3. ¿Qué significa «tiempo real»?**
Ver los cambios de estado de las tareas sin refrescar ni preguntar. Es frescura, no presencia: el estado es de la tarea, no de la persona. Ni chat, ni videollamada, ni edición simultánea, ni «quién está conectado». La señal es un resumen que espera a que lo mires, no un aviso que interrumpe.

**P4. ¿Qué no debería tener FlowSync nunca?**
Configuración de flujos, campos obligatorios, sprints, estimaciones, épicas, backlog priorizado, informes y cualquier forma de vigilancia. Crear una tarea y cambiarle el estado debe costar segundos. FlowSync sustituye al gestor de tareas: crea las tareas, no lee las de otro sitio.

**P5. ¿Cómo sabremos que funciona?**
A una semana de uso real, el equipo cancela la ronda de «¿en qué estás?» de la daily y nadie pide que vuelva. Si la siguen haciendo igual, no funcionó. El riesgo número uno a validar es que la información se quede vieja.

**Supuestos aceptados**

- **S1:** los estados de una tarea son pendiente, en curso y hecha. No hay estado «bloqueada», porque los bloqueos quedan fuera del MVP.
- **S3:** «ver qué se ha movido» se resuelve con la lista siempre al día, sin historial ni marca de novedades desde la última visita.
- **S4:** el éxito se comprueba observando y preguntando al equipo del caso de estudio, no con métricas dentro del producto.

## 3. Alcance del MVP

### Problema

En un equipo remoto nadie ve el estado del equipo sin interrumpir a alguien. Se paga con interrupciones constantes («¿en qué estás?» por chat y una ronda que se come la mitad de la daily de 15 minutos) y con trabajo duplicado: en el caso de estudio, dos personas tocaron el mismo módulo la misma semana sin saberlo y se perdieron dos días. El gestor de tareas actual no lo resuelve porque mantenerlo al día cuesta demasiado.

### Usuarios

Personas de equipos remotos pequeños (3–10) con roles planos, donde el valor lo cobran los pares, no un responsable. Caso de estudio: equipo SaaS de 6 personas en 3 husos horarios, con un gestor de tareas pesado y una daily por videollamada.

### Propuesta de valor

**Hipótesis principal:** si el equipo ve de un vistazo en qué tarea está cada uno, al día y sin preguntar, deja de hacer la ronda de «¿en qué estás?» y evita empezar lo que otra persona ya está tocando.

Quien escribe el estado lo mantiene porque cobra en el momento: son dos clics sobre una lista que ya tiene abierta, esa lista es su propia cola de trabajo y deja de recibir interrupciones preguntándole cómo va. Criterio de éxito: a una semana de uso real, el equipo cancela esa ronda y nadie pide que vuelva.

### Alcance

Un único espacio compartido, sobre el registro e inicio de sesión que ya existen.

1. Lista compartida de tareas con título, responsable, estado y fecha de vencimiento, distinguiendo lo vencido.
2. Crear y editar una tarea en segundos usando esos cuatro datos y sin flujos de configuración.
3. Cambiar el estado desde la propia lista usando los estados pendiente, en curso y hecha.
4. Lista siempre al día sin recargar, mostrando los cambios de estado realizados por otras personas.

### NO-alcance

Cada exclusión se mide contra la hipótesis: ¿ayuda a validar que el equipo deja la ronda de estado porque la lista basta?

- **Filtrar la lista por estado.** Con 3–10 personas la lista completa se lee de un vistazo; el filtro mejora la comodidad, pero no cambia si el estado del equipo es visible sin preguntar.
- **Notificaciones push.** La señal es un resumen que espera, no un aviso; además reintroducen la interrupción que queremos eliminar.
- **Integración con Slack.** Devolvería el estado al chat, justo donde queremos dejar de preguntarlo; la hipótesis es que la lista basta.
- **Roles y permisos avanzados.** Con roles planos en equipos pequeños, la jerarquía no cambia si el estado del equipo se ve o no.
- **Analítica e informes.** No hay reporte hacia arriba que los consuma y el éxito se observa en el equipo, no en métricas (S4).
- **Comentarios en tareas.** Convierten la tarea en conversación; para saber quién está en qué no hacen falta.
- **Gestión de bloqueos.** La parte de bloqueos de la daily sigue y este MVP no la resuelve a propósito; la hipótesis solo afecta a la ronda de estado.
- **Sprints, estimaciones, épicas y backlog priorizado.** Son el «rollo» que frena las actualizaciones; un equipo que los necesite no es nuestro usuario.
- **Varios equipos o personas en más de uno.** Con un solo equipo ya se valida si la ronda desaparece.
- **Presencia e indicadores de actividad.** Son vigilancia, se rechazan a propósito y no dicen nada del estado de las tareas.
- **Estado derivado de Git, CI o calendario.** Es otro producto con integraciones de terceros; lo que se valida es precisamente que la persona lo escriba ella misma.
- **Importar o sincronizar tareas de otra herramienta.** Convivir con otro gestor exige doble actualización; FlowSync lo sustituye.
- **Historial de cambios y «novedades desde tu última visita».** La lista al día basta para ver qué se ha movido (S3).
- **Borrar o archivar tareas.** Las tareas hechas ya se distinguen por su estado; quitarlas no cambia si el equipo deja de preguntar.

## Parte B — tres líneas

1. IA propuso: 5 capabilities. Después de mi recorte humano: 4 capabilities.
2. Notificaciones push fuera, porque no ayuda a validar que el equipo sepa en qué está cada uno sin que nadie le interrumpa; integración con Slack fuera, porque no ayuda a validar que la lista compartida basta para dejar de preguntar por chat; comentarios en tareas fuera, porque no ayuda a validar que el estado de cada tarea, escrito en dos clics, sustituye a la ronda de «¿en qué estás?».
3. La exclusión de la que menos seguro estoy es «filtrar la lista por estado»: entraría después si, durante el uso real, sin el filtro las personas no localizan con suficiente rapidez el trabajo pendiente o en curso y eso les impide usar la lista como sustituto de la ronda de estado.
