# FlowSync — PRD

*Fecha: 2026-09-22 · Autor: Viviana Salcedo*

> Documento vivo. La versión colaborativa (con comentarios abiertos) está en el doc de Claude: https://claude.ai/artifact/2bq8p7aKymFKkcS7PHuSeH

## Visión

Herramienta para equipos remotos que permite saber en qué está trabajando cada persona sin depender de reuniones de sincronización: tareas compartidas, en tiempo real, con una experiencia más ligera que Jira.

## Capacidades actuales del producto

Hoy FlowSync solo tiene el andamiaje de cuentas de usuario, construido durante el curso:

- **Alta de cuenta**: cualquier persona puede registrarse con nombre, email y contraseña.
- **Inicio de sesión**: los usuarios entran con email y contraseña y quedan autenticados.
- **Perfil personal**: cada usuario ve su nombre, su email y la fecha en la que se unió.
- **Cierre de sesión**.
- **Áreas protegidas**: las pantallas internas (como el perfil) solo son accesibles si hay sesión iniciada; si no, se redirige al login.

No existe todavía ninguna funcionalidad de tareas, equipos, estados de trabajo o colaboración en tiempo real — ese es exactamente el espacio que este PRD tiene que acotar para el MVP.

## Problema y usuarios objetivo

**El problema, concretamente**

Nadie ve el estado del equipo sin interrumpir a alguien.

**Cómo lo resuelven hoy:** con la ronda de "¿en qué estás?" en la daily (la mitad de sus 15 minutos) y con preguntas sueltas por Slack.

El coste es real: dos personas del equipo tocaron el mismo módulo la misma semana porque una empezó sin que la otra lo supiera — dos días perdidos.

Sin vender de más: la daily no desaparece entera. La parte de bloqueos sigue existiendo; este MVP solo elimina la ronda de "¿en qué estás?".

**Quién sufre esto**

Los pares, no un manager. No hay reporte hacia arriba y a un lead le daría igual. Duele a los dos compañeros que descubren tarde que iban a lo mismo, y a quien tiene que interrumpir a otro para preguntar.

**Usuarios objetivo**

Equipos remotos de desarrolladores, pequeños, de 3 a 10 personas, con roles planos: en el MVP todos ven y editan lo mismo, sin jerarquía de permisos.

**Caso de estudio (no un cliente real)**

Equipo de producto SaaS de 6 personas, repartido en 3 husos horarios, que hoy usa un gestor de tareas pesado y hace una daily de 15 minutos por videollamada.

**Supuesto de frontera**

Un único espacio compartido, sin el concepto de "equipo" como entidad. Varios equipos separados, o gente en más de un equipo, queda fuera del MVP — se deja anotado como supuesto, no se construye.

## Propuesta de valor

Con FlowSync, cualquiera del equipo mira la lista de tareas y ve, sin preguntar, quién está en qué y qué sigue libre.

Ese cambio se traduce en tres cosas para el equipo, no para una capa de gestión por encima de él:

- **Menos fricción**: coordinarse deja de requerir interrumpir a alguien para preguntarle cómo va.
- **Más foco**: quien actualiza su propia tarea usa esa misma lista como su cola de trabajo, y de paso deja de recibir esas interrupciones.
- **Decisiones más rápidas**: elegir qué hacer a continuación, o evitar empezar algo que otro ya está tocando, no requiere esperar a una reunión.

El valor es para el equipo mismo, no para un reporte hacia arriba: no hay un manager que lo necesite, son los propios pares quienes ganan tiempo y evitan choques.

## Alcance del MVP

**En alcance (MVP)**

- Alta de cuenta, login, perfil y cierre de sesión (ya construido)
- Crear una tarea (título, responsable, fecha de vencimiento)
- Cambiar el estado de una tarea
- Ver la lista de tareas del equipo, filtrable por estado y por responsable
- Indicador visual en las tareas que ya vencieron (fecha de vencimiento pasada)
- Ver esos cambios reflejados sin recargar ni preguntar (la parte "en tiempo real")

**Qué significa "tiempo real" aquí**

Ver los cambios de estado de las tareas sin refrescar ni preguntar. No es chat, no es videollamada, no es edición simultánea de un documento.

Es frescura de la tarea, no presencia de la persona: no hay "quién está conectado ahora" ni indicadores de actividad. Es una decisión deliberada — eso es vigilancia y se rechaza a propósito.

**Cómo llega la señal**

Es un resumen que se consulta, no un aviso que interrumpe: el caso de uso es "llego por la mañana, o vuelvo de una reunión, y veo qué se ha movido". Sin notificaciones push.

**Qué decisión habilita**

No empezar algo que otra persona ya está tocando, y elegir la siguiente tarea sabiendo qué está libre.

**De dónde sale el estado**

Lo teclea la propia persona que hace la tarea, en segundos: dos clics sobre una lista ya abierta, sin campos obligatorios, sin sprint ni estimación. Derivarlo de señales externas (Git/PRs, CI, calendario) queda fuera del MVP — es otro producto, con integraciones y OAuth de terceros.

**Por qué se sostiene el hábito**

No es que sea más agradable: la misma lista es la cola de trabajo de quien la actualiza. La mira para decidir qué coge, y de paso deja de recibir interrupciones preguntando cómo va. Si el beneficio fuera solo para los demás, no se sostendría.

**Dónde vive el trabajo**

FlowSync es donde se hace el trabajo, no donde se cuenta: sustituye al gestor de tareas actual, no convive con él. Crea las tareas, no lee las de otro sitio — convivir con otra herramienta exigiría doble actualización, que es como muere esta categoría de producto.

**Qué necesita una tarea**

Título, responsable, estado y fecha de vencimiento (para ver de un vistazo qué se ha pasado de plazo). El estado es un conjunto fijo de tres valores: To Do, In Progress y Done.

**Cómo se consume la lista**

Filtrando por estado, para centrarse en lo pendiente.

**Ambición de alcance**

Una vertical fina y usable de punta a punta, no el andamiaje amplio de un producto: se prefiere una capacidad terminada a tres a medias. Renuncia explícita, por diseño, a sprints, estimaciones, épicas, backlog priorizado e informes — un equipo que necesite eso no es el usuario de este MVP.

"Menos rollo que Jira" significa: crear una tarea y cambiarle el estado en segundos, sin flujos de configuración ni campos obligatorios — lo mínimo para saber quién está en qué.

## Fuera de alcance

- **Múltiples equipos, o personas en más de un equipo** — se asume un único espacio compartido para no complicar el modelo en la primera iteración; es un supuesto explícito, no algo evaluado y descartado.
- **Notificaciones push** — el valor está en consultar un resumen cuando uno quiere verlo, no en recibir avisos que interrumpen; añadir push volvería a convertir a FlowSync en otro canal de interrupción.
- **Integración con Slack** — se prioriza simplificar el producto y evitar integraciones con terceros en esta primera iteración.
- **Roles y permisos avanzados** — el equipo es de pares sin jerarquía; no hay una capa de gestión que necesite ver algo distinto del resto.
- **Analítica o reporting** — el usuario que necesita informes o métricas de gestión no es el usuario de este MVP.
- **Comentarios en las tareas** — convertiría la tarea en un hilo de conversación; el foco del MVP es el estado, no la discusión alrededor de él.
- **Derivar el estado desde señales externas** (Git/PRs, CI, calendario) — implicaría integraciones y OAuth de terceros; es otro producto, no esta primera iteración.
- **Sprints, estimaciones, épicas, backlog priorizado e informes** — son herramientas de gestión que este MVP renuncia a construir; un equipo que las necesite no es el usuario objetivo.
- **Indicadores de presencia o "quién está conectado ahora"** — decisión deliberada: eso es vigilancia, y se rechaza a propósito, no es una función pendiente.

## Métricas de éxito

**Éxito para el usuario**

Dejar de hacer la ronda de "¿en qué estás?" de la daily, porque el estado del equipo se ve de un vistazo.

**Criterio a una semana de uso real**

El equipo cancela esa ronda de la daily y nadie pide que vuelva. Si la siguen haciendo igual, no funcionó.

**Riesgo #1 a validar**

Que la información se quede desactualizada: si el estado envejece, el producto pierde el sentido. No es un detalle, es el riesgo principal. La mitigación de diseño es que actualizar cueste dos clics, nunca obligar a nadie.

> Pendiente: definir valores numéricos objetivo para estas métricas (ver preguntas abiertas en el doc colaborativo).

## Las tres líneas

**Los dos números**

Los dos números que más reflejan lo que pasó son 6 y 2. En la primera ronda de preguntas te propuse considerar 6 ideas para el alcance, la lista de tareas por persona, un estado tipo feed, un tablero por equipo, notificaciones, comentarios e integraciones con Slack, GitHub y calendario. De esas 6, solo 2 sobrevivieron con claridad hasta el final, la tarea como unidad de trabajo y su estado.

Más adelante, cuando ya tocaba definir el alcance del MVP en concreto, te propuse directamente una lista de 5 capacidades para incluir. Ahí no hubo recorte de tu parte, al contrario, la ampliaste a 6 agregando el filtro por responsable y el indicador de tareas vencidas. Así que el patrón real no fue proponer mucho y recortar, fue proponer ideas amplias al principio, descartar la mayoría, y luego, ya con el alcance más claro, terminar sumando en vez de quitando.

**Tres cosas que dejaste fuera, y por qué cada una**

Dejé fuera la integración con Slack porque no ayuda a validar la hipótesis central del producto, que el valor está en ver el estado de la tarea y no en sumar otro canal de avisos. Meterla sería un nice to have que además nos devolvería a la interrupción que queremos evitar.

Dejé fuera los comentarios en las tareas por una razón parecida. Lo que quiero probar es si basta con ver el estado para coordinarse, y convertir la tarea en un hilo de conversación desvía esa validación hacia otra cosa, la discusión, que no es lo que mide esta primera versión.

Y decidí que el estado no fuera texto libre sino un conjunto fijo de tres valores, To Do, In Progress y Done. Un campo abierto no habría probado si la señal es útil, porque cada persona escribiría algo distinto y dejaría de leerse de un vistazo. La hipótesis que quiero validar es que un estado simple y estandarizado ya resuelve el problema, no que hace falta más expresividad.

**La exclusión de la que menos seguro estás**

La exclusión de la que menos seguro estoy no es una exclusión, es lo contrario. Es algo que agregué durante la conversación sin que estuviera en el problema original y del que todavía dudo si debería quedarse. Metí el indicador visual de tareas vencidas porque parecía barato de construir y fácil de justificar, pero el dolor que estamos resolviendo es que nadie ve en qué está trabajando el otro sin preguntar, no que se pierdan fechas límite. Para que esta pieza se gane su lugar con seguridad, tendría que ver, durante la semana de prueba, que el equipo realmente usa la fecha de vencimiento para decidir qué hacer, y no que la ignora porque el valor real está en el estado y no en el plazo.
