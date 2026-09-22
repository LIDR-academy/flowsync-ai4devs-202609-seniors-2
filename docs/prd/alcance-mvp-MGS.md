# FlowSync: alcance del MVP

Borrador · MGS · 22/09/2026

## 1. El terreno que ya existe

Hoy FlowSync solo gestiona cuentas: una persona puede registrarse (nombre opcional, email único y contraseña con confirmación), iniciar sesión, ver su perfil (iniciales, nombre, email y fecha de alta) y cerrar sesión.
No existe nada de tareas, equipos ni espacios compartidos. Lo único que guarda la aplicación son las personas usuarias y sus sesiones abiertas.
Todo lo que describe este documento es nuevo, salvo el acceso con cuenta.

## 2. El interrogatorio

Cinco preguntas, en una sola ronda. Las respuestas salen de la ficha de hechos del ejercicio.

1. ¿Qué reunión se quiere eliminar exactamente (daily, sync semanal…) y qué información sale hoy de ella que el equipo usa luego para actuar?
2. ¿Quién escribe la información y quién la lee? ¿Cuántas personas tiene un equipo, hay uno o varios, y existe un rol (lead o manager) que lee mucho más de lo que escribe?
3. ¿Lo que se comparte es una tarea con ciclo de vida (se crea, se asigna, está en curso, se termina) o un estado personal ("ahora estoy con X", "estoy bloqueado por Y")? Si son tareas, ¿cada uno crea las suyas o alguien las reparte?
4. ¿Cuándo tiene que enterarse alguien de un cambio: al momento y con aviso, cuando abre la herramienta, o con un resumen diario? ¿Qué cambios justifican interrumpir a alguien? ¿El equipo trabaja en varias zonas horarias?
5. ¿Qué es lo mínimo que alguien está dispuesto a registrar, y cada cuánto? ¿Qué cosas de Jira quedan fuera expresamente?

La ficha no respondía a todo. Los huecos se cubrieron con supuestos, y los que siguen vivos en el alcance son estos:

- Una tarea sin responsable es una tarea libre; cogerla es asignársela uno mismo.
- Hay tres estados fijos (Por hacer, En curso, Hecha), sin "Bloqueada".
- Solo el título es obligatorio. Así se concilia "sin campos obligatorios" con que la tarea tenga responsable y estado.
- Cualquier persona del espacio puede crear tareas y asignarlas a otra.
- Toda persona con cuenta pertenece al espacio único.

## 3. El alcance

### Problema

En un equipo remoto nadie ve en qué está cada uno sin interrumpir a alguien. Hoy eso se paga de dos maneras:

- **La ronda de "¿en qué estás?" de la daily**, que se come la mitad de sus 15 minutos, y el mismo "¿en qué estás?" repetido por chat a lo largo del día.
- **Trabajo duplicado que se descubre tarde.** En el equipo del caso de estudio, dos personas tocaron el mismo módulo la misma semana porque una empezó sin que la otra lo supiera. Dos días perdidos.

Lo que falta no es información para sentirse al día, sino para decidir: no empezar algo que otra persona ya está tocando, y elegir lo siguiente sabiendo qué está libre.

Este MVP **no** arregla la parte de bloqueos de la daily. Esa parte se mantiene.

### Usuarios

Miembros de equipos remotos pequeños, de 3 a 10 personas, que se reparten el trabajo entre iguales. Escriben y leen los mismos: no hay un lead que consuma un reporte ni nadie por encima a quien informar. A un manager esto le daría igual.

Duele sobre todo en dos situaciones, que le tocan a la misma persona en días distintos:

- cuando descubre tarde que iba a lo mismo que un compañero;
- cuando tiene que interrumpir a otro para preguntarle cómo va, o cuando es ella la interrumpida.

Caso de estudio (no es un cliente real): equipo de producto SaaS de 6 personas repartidas en 3 husos horarios, que hoy usa un gestor de tareas pesado y una daily de 15 minutos por videollamada.

Supuestos:

- Todo el equipo trabaja en un único espacio compartido; no existe la noción de "equipo". No se contemplan varios equipos separados ni gente que esté en más de uno.
- Toda persona con cuenta pertenece a ese espacio. Roles planos: todos ven y editan lo mismo.

### Propuesta de valor

**El estado del equipo se ve de un vistazo, siempre al día y sin preguntar a nadie.**

- **Para quien lee:** al llegar por la mañana o al volver de una reunión, abre la lista y ve quién está en qué y qué está libre. Sin esperar a la daily y sin escribir a alguien que está en otro huso horario.
- **Para quien escribe:** esa misma lista es su cola de trabajo. La mira para decidir qué coge, y mantenerla al día le cuesta dos clics. A cambio, deja de recibir interrupciones preguntándole cómo va. Si el beneficio fuera solo para los demás, no la actualizaría.
- **Frente a un gestor pesado:** crear una tarea y moverla lleva segundos. Sin flujos que configurar, sin más campo obligatorio que el título, sin decidir sprint ni estimación. FlowSync sustituye al gestor de tareas, no convive con él.

"Tiempo real" significa aquí frescura: los cambios de estado de las tareas aparecen sin refrescar y sin preguntar. El estado es de la tarea, nunca de la persona.

**Cómo sabremos que funciona:** tras una semana de uso real, el equipo cancela la ronda de "¿en qué estás?" de la daily y nadie pide que vuelva. Si la siguen haciendo igual, no ha funcionado.

**Riesgo principal:** que la información se quede vieja. Si la lista no refleja la realidad, el producto pierde el sentido. No se mitiga obligando a nadie, sino haciendo que actualizar cueste dos clics, y es lo primero que hay que observar en la semana de prueba.

### Alcance

Una sola vertical fina, usable de principio a fin: la lista de tareas compartida del equipo. Se parte de lo que ya existe (registro, inicio de sesión y perfil).

1. **Crear una tarea escribiendo solo el título**, desde la propia lista. Nace en "Por hacer" y sin responsable, es decir, libre.
2. **Asignar la tarea:** cogerla uno mismo, dársela a otra persona del espacio, cambiar el responsable o dejarla libre de nuevo.
3. **Cambiar el estado en dos clics desde la lista**, entre tres estados fijos: Por hacer, En curso y Hecha. No se pueden configurar ni añadir estados.
4. **Ver la lista del equipo de un vistazo:** cada tarea con su título, su responsable (o "libre") y su estado.
5. **Ver los cambios sin refrescar:** si alguien crea, coge o mueve una tarea, la lista que otra persona tiene abierta lo refleja sola.
6. **Filtrar la lista por estado**, para centrarse en lo pendiente y apartar lo ya hecho.

### NO-alcance

Cada exclusión se mide contra lo único que este MVP tiene que validar: que, con el estado de las tareas visible y al día, el equipo deja de preguntar "¿en qué estás?".

#### Recortado en esta primera versión

Piezas que estaban en la ficha de producto o que serían candidatas naturales, y que se quedan fuera:

- **Fecha de vencimiento y marca de "vencida".** Fuera, porque no ayuda a validar que el equipo deja de preguntar en qué está cada uno: responde a otra pregunta ("¿llegamos a tiempo?") y añade un campo más a cada alta. Contradice la ficha de producto, que la incluía: es el recorte más discutible de esta lista.
- **Editar el título y borrar tareas.** Fuera, porque no ayudan a validar que la lista sustituye a la pregunta. Una tarea mal creada se da por hecha y se crea otra; durante una semana de prueba ese ruido es asumible.
- **"Actualizada hace X", historial de cambios y resumen de novedades desde la última visita.** Fuera, porque las dos decisiones que queremos cambiar (no pisar a nadie y elegir qué coger) se toman con el estado actual, no con su historia.
- **Estado "Bloqueada".** Fuera, porque los bloqueos se siguen tratando en la daily y el MVP no pretende resolverlos. Un estado a medias crearía la expectativa contraria.
- **Descripción, prioridad, etiquetas, subtareas, adjuntos y orden manual.** Fuera, porque ninguno ayuda a saber quién está en qué, y cada campo extra encarece crear una tarea, que tiene que costar segundos.

#### Excluido por decisión de producto

- **Sprints, estimaciones, épicas y backlog priorizado.** Fuera, porque son justo el "rollo" que se quiere quitar. Un equipo que los necesite no es nuestro usuario.
- **Informes, analítica y reporting.** Fuera, porque nadie reporta hacia arriba y no cambian ninguna decisión entre iguales.
- **Notificaciones push.** Fuera, porque la señal que buscamos espera a que la mires. Un aviso que interrumpe es justo lo que se quiere eliminar.
- **Integración con Slack.** Fuera, porque no ayuda a validar que la lista sustituye a la pregunta, y devolvería el estado al canal de las interrupciones.
- **Deducir el estado de fuentes externas** (repositorio de código y pull requests, integración continua, calendario). Fuera, porque es otro producto. Aquí el estado lo escribe quien hace la tarea.
- **Importar o sincronizar tareas con otro gestor.** Fuera, porque FlowSync sustituye al gestor, no convive con él: la doble actualización es lo que mata esta categoría.
- **Comentarios en las tareas.** Fuera, porque convierten la tarea en una conversación y no ayudan a saber quién está en qué.
- **Presencia: quién está conectado, indicadores de actividad.** Fuera a propósito, porque es vigilancia. El estado es de la tarea, no de la persona.
- **Chat, videollamada y edición simultánea de un mismo contenido.** Fuera, porque no es lo que "tiempo real" significa aquí.
- **Roles y permisos.** Fuera, porque en equipos de 3 a 10 personas entre iguales todos ven y editan lo mismo.
- **Varios equipos o espacios, e invitaciones.** Fuera, porque el caso de estudio es un solo equipo. Queda anotado como supuesto en Usuarios.


# Parte B: las tres líneas

## 1 Los dos números:
Cuántas cosas propuso la IA meter dentro del alcance: 6
Cuántas quedaron dentro después de tu recorte: 6

## 2 Tres cosas que dejaste fuera, y por qué cada una:
No quité ninguna del alcance, creo que la IA hizo muy bien trabajo, quitar cualquiera de las 6 resultantes dejaría practicamente no funcional el MVP.

## 3 La exclusión de la que menos seguro estás
Si bien, fue al revés, no quité ninguna, la que más cerca valoré eliminar fue el punto 5. **Ver los cambios sin refrescar:**. Ya que podría decirse que es más usabilidad del producto, sin embargo, si no se ofrece un mecanismo que permita actualizar el estado de las tareas, el MVP igualmente será no funcional, de ahí que lo dejé en la lista.
