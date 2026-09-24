# FlowSync — Alcance del MVP

## 1. Contexto

FlowSync quiere ser la forma en que un equipo remoto sabe en qué está trabajando cada quien sin reunirse a contarlo.

Hoy solo está construida la puerta de entrada: alta de cuenta, inicio y cierre de sesión y perfil propio, con la sesión recordada. El modelo no conoce más que personas usuarias y sus credenciales: no hay tarea, proyecto ni equipo. El dominio funcional está entero por decidir, así que el MVP arranca sobre lienzo limpio.

## 2. El interrogatorio

Cinco preguntas, una sola ronda, las que más incertidumbre quitan antes de recortar:

1. ¿Qué ritual concreto desaparece si FlowSync funciona?
2. ¿Cómo es el equipo tipo: tamaño, jerarquía, husos horarios?
3. ¿Quién alimenta la información y cuánto esfuerzo acepta poner?
4. ¿Qué significa "más en tiempo real" para el usuario?
5. ¿Sustituye a la herramienta de tareas actual o convive con ella?

## 3. El alcance en cinco bloques

### 3.1 Problema

Nadie ve en qué trabaja el resto sin interrumpir a alguien. Se paga en la ronda de "¿en qué estás?" —la mitad de una daily de 15 minutos— y en el goteo de preguntas por chat. Cuando esa sincronización falla, se duplica trabajo: dos personas tocaron el mismo módulo la misma semana y se perdieron dos días. Falta un sitio donde mirar, no un informe.

### 3.2 Usuarios

Equipos remotos de 3 a 10 personas, sin jerarquía de permisos: todos ven y editan lo mismo. El valor lo cobran los **pares**, no un lead; no hay reporte hacia arriba. Referencia: 6 personas de producto SaaS en 3 husos horarios, hoy con un gestor de tareas y una daily de 15 minutos por videollamada (caso de estudio, no cliente real). Quien actualiza el estado es quien hace la tarea: esa misma lista es su cola de trabajo y le ahorra las interrupciones.

### 3.3 Propuesta de valor

Una lista compartida del equipo, abierta a cualquiera del equipo cuando quiera saber en qué anda el resto. Crear una tarea y cambiarle el estado cuesta dos clics: sin sprints, sin estimación, sin campos obligatorios. Consultarla no requiere interrumpir a nadie ni esperar a la daily.

Es **frescura de la tarea, no presencia de la persona**: no existe "quién está conectado". Eso es vigilancia y se rechaza a propósito.

La decisión que debe cambiar es concreta: no empezar algo que otra persona ya toca, y elegir lo siguiente sabiendo qué está libre.

**Éxito:** a una semana de uso real, el equipo cancela la ronda de "¿en qué estás?" y nadie pide que vuelva. La parte de bloqueos de la daily sigue; este MVP no la resuelve.

### 3.4 Alcance

Una vertical fina y usable de punta a punta. Cuatro piezas:

1. **Una lista única compartida, en una pantalla**, a la que se entra con la cuenta que ya existe: el mismo sitio es el tablero del equipo y la cola de trabajo de cada quien.
2. **Crear una tarea en segundos**: título, responsable, estado y fecha de vencimiento.
3. **Cambiar el estado desde la propia lista**, sin abrir nada.
4. **Filtrar por estado**, para centrarse en lo pendiente.

La señal es un resumen que espera, no un aviso que interrumpe: "llego por la mañana y veo qué se ha movido".

### 3.5 NO-alcance

- **Que la lista se actualice sola, sin refrescar.** *Recortado del alcance inicial:* la hipótesis que hay que probar es que exista un sitio donde mirar sin preguntar, y abrirlo al empezar el día ya la pone a prueba. La actualización en vivo cuesta transporte en tiempo real antes de saber si la gente mantiene el estado al día, que es el riesgo #1. Entra en cuanto se vea a alguien decidiendo sobre una lista abierta hace horas.
- **Destacar lo vencido** (marca, orden o aviso). *Recortado del alcance inicial:* la fecha se ve en la fila; gestionar plazos es otro problema que el de saber quién está en qué.
- **Entidad "equipo", varios espacios, invitaciones.** No cambia en nada si un equipo cancela o no su ronda de daily; añade modelo y pantallas antes de saberlo.
- **Notificaciones push o email.** Un aviso que interrumpe es justo lo que venimos a eliminar, y taparía si la lista por sí sola basta.
- **Presencia e indicadores de actividad.** Va contra la propuesta: el estado es de la tarea, no de la persona.
- **Derivar el estado de Git, CI o calendario.** Otro producto, con integraciones de terceros; además falsea el riesgo que queremos medir: si la gente mantiene el estado al día cuando cuesta dos clics.
- **Convivir con el gestor actual o importar de fuera.** Exige doble actualización, que es como muere esta categoría.
- **Sprints, estimaciones, épicas, backlog e informes.** Quien los necesita no es nuestro usuario; convierten FlowSync en el gestor pesado del que huye.
- **Comentarios, chat, adjuntos y descripciones ricas.** Discutir una tarea no es lo mismo que ver el estado del equipo.
- **Subtareas, dependencias, etiquetas y prioridades.** Cada campo extra encarece el "dos clics" del que depende todo.
- **Roles y permisos.** Con 3-10 personas planas no hay a quién proteger de quién.
- **Historial, auditoría y métricas de uso.** Explican el pasado, no ayudan a decidir qué coger ahora.
- **Móvil y offline.** El uso es delante del ordenador, al empezar el día o al salir de una reunión.

**Supuesto asumido:** un solo espacio compartido; nadie pertenece a dos equipos.
**Riesgo #1:** que la información se quede vieja. Si pasa, el producto pierde el sentido. La mitigación es que actualizar cueste dos clics, no obligar a nadie.

## 4. Las tres líneas

**1. Los dos números.** La IA propuso **6** cosas dentro del alcance; después de mi recorte quedan **4**. (Una séptima, destacar lo vencido, ya había caído en la revisión anterior.)

**2. Tres cosas que dejé fuera, y por qué:**

- **Que la lista se actualice sola**, fuera, porque no ayuda a validar que el equipo deje de hacer la ronda de "¿en qué estás?": la lista se consulta una vez al día, al empezar, y en ese momento ya está recién cargada. El tiempo real solo importaría si alguien decidiera sobre una pantalla abierta hace horas, y eso todavía no lo he visto pasar.
- **La pantalla de espacio compartido aparte de la lista**, fuera, porque no ayuda a validar nada que la lista no valide ya: era la misma capability contada dos veces. Unificarlas quita una pantalla sin quitar producto.
- **Las notificaciones push o por email**, fuera, porque no ayudan a validar que un sitio donde mirar basta: si el equipo cancela la ronda porque le llega un aviso, no habré aprendido si la lista funciona por sí sola.

**3. La exclusión de la que menos seguro estoy:** destacar lo vencido. Con 6 personas la fecha en la fila se lee sin ayuda, pero en equipos más grandes, o si aparece un modo revisión donde alguien repasa el conjunto, lo vencido deja de saltar a la vista. Entraría en cuanto la lista no quepa en una pantalla, o en cuanto alguien en uso real descubra tarde un vencimiento.
