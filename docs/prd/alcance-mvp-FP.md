# Alcance del MVP de FlowSync

## Parte A

### 1. El terreno que ya existe

FlowSync hoy solo gestiona cuentas: registro, login, perfil de solo lectura y logout.
El modelo de datos son dos tablas: `users` (id, nombre opcional, email único, password, fechas) y `auth_access_tokens` (varios tokens por usuario).
Todo lo de tareas y equipos está por construir; lo que se puede reutilizar son la autenticación y las convenciones que ya siguen backend y frontend.

### 2. El interrogatorio

Las cinco preguntas que planteó la IA, en una sola ronda:

1. ¿Quién usa FlowSync y quién decide adoptarlo? Tamaño del equipo, husos horarios, a qué se dedican, y si lo pide un responsable para tener visibilidad o los propios miembros para coordinarse.
2. ¿Qué información concreta sale hoy de la reunión de sincronización y tendría que salir de FlowSync? Si solo pudiera quedarse una, ¿cuál?
3. ¿Qué usan hoy, FlowSync lo sustituye o convive con ello, y qué es exactamente el "rollo" que no puede repetirse?
4. ¿Qué significa "en tiempo real" en la práctica, y quién mantiene al día el estado de cada persona?
5. ¿Qué tiene que pasar en las primeras semanas para decir que funciona? ¿Hay equipo piloto y fecha límite?

Respuestas: la ficha de hechos de la lección "Ejercicio FlowSync", pegada entera.

### 3. El alcance en cinco bloques

#### Problema

En un equipo remoto pequeño, nadie sabe en qué está cada uno sin interrumpir a alguien. La ronda de "¿en qué estás?" se come la mitad de la daily de 15 minutos, y el resto del día se pregunta por chat. Lo más caro es enterarse tarde: dos personas tocaron el mismo módulo la misma semana sin saberlo y perdieron dos días.

No forman parte del problema:

- **Los bloqueos:** siguen en la daily.
- **Informar a un responsable:** no existe.

#### Usuarios

- **Quién:** equipos remotos de 3 a 10 personas, en varios husos horarios. Todos tienen el mismo rol.
- **Quién se beneficia:** los propios compañeros. Por un lado, quien iba a empezar algo que otro ya tiene. Por otro, quien pregunta y quien recibe la pregunta.
- **Caso de estudio** (no es un cliente real): 6 personas de un producto SaaS, en 3 husos horarios. Hoy usan un gestor de tareas pesado y hacen una daily de 15 minutos por videollamada.
- **Quién no es nuestro usuario:** un equipo que necesite sprints, estimaciones o informes.

#### Propuesta de valor

**Ver quién está en qué y qué está libre, siempre al día y sin preguntar. Mantenerlo cuesta dos clics sobre la misma lista que cada uno usa para decidir qué coger.**

- **Hipótesis:** tras una semana de uso real, el equipo cancela la ronda de "¿en qué estás?" y nadie pide que vuelva.
- **Riesgo n.º 1:** que el estado se quede viejo.
- **Lo que no prometemos:** la daily no desaparece; desaparece la ronda.

#### Alcance (4 cosas)

1. **La lista del equipo.** Todas las tareas en una sola lista. Cada una muestra título, quién la tiene (o "libre") y estado: Pendiente, En curso o Hecha.
2. **Crear una tarea escribiendo solo el título.** Nace libre y pendiente.
3. **Coger, soltar y mover una tarea en dos clics desde la lista, sin abrirla:** "me la quedo", "la suelto" y cambiar el estado.
4. **Siempre al día.** Los cambios de cualquiera aparecen en la lista que los demás tienen abierta, sin refrescar.

Se apoya en lo que ya existe: el registro y el login. Quien se registra entra en el único espacio.

#### NO-alcance

**Recortes nuevos, que van contra lo que pide la ficha**

- **Fecha de vencimiento y marca de vencidas:** fuera, porque no ayudan a validar que el equipo deje de preguntar "¿en qué estás?". Esa pregunta se responde con quién tiene la tarea y en qué estado está; "qué va tarde" es otra pregunta.
- **Filtrar por estado:** fuera, porque en una semana de prueba con 6 personas la lista no crece lo bastante para necesitarlo. Si las tareas hechas empiezan a estorbar, es lo primero que entra.
- **Asignar una tarea a otra persona:** fuera, porque cada uno elige lo que coge. Repartir trabajo es cosa de un responsable, y aquí no lo hay.
- **Editar el título:** fuera, porque un título mejorable no impide saber quién está en qué.

**Cómo llega la señal**

- **Notificaciones (push, email) e integración con Slack:** fuera, porque interrumpen. La señal es una lista que espera a que la mires.
- **Presencia e indicadores de actividad:** fuera a propósito. Es vigilancia, y el estado es de la tarea, no de la persona.
- **Resumen de cambios e historial:** fuera. Supuesto: al volver, basta con ver cómo está todo ahora. Si la gente sigue preguntando "¿qué ha pasado mientras no estaba?", el resumen entra.
- **Comentarios y chat:** fuera, porque FlowSync no es un chat. La conversación sigue donde está hoy.

**De dónde sale el estado**

- **Sacarlo de Git, CI o el calendario:** fuera, porque es otro producto. La hipótesis es justamente que teclearlo en dos clics basta.
- **Convivir con el gestor actual o importar desde él:** fuera, porque FlowSync lo sustituye. Actualizar en dos sitios es como muere esta categoría de producto.

**Organización**

- **Varios equipos o personas en más de uno:** fuera. Supuesto: un equipo, un espacio.
- **Roles, permisos e invitaciones:** fuera, porque todos tienen el mismo rol y registrarse ya es entrar.

**La tarea y la lista**

- **Estado "Bloqueada":** fuera, porque los bloqueos siguen en la daily.
- **Estados configurables y campos extra** (descripción, prioridad, etiquetas, subtareas): fuera, porque son justo el "rollo" que se quiere evitar.
- **Borrar o archivar, vistas alternativas (kanban, por persona) y búsqueda:** fuera, porque una lista corta se lee de un vistazo.
- **Sprints, estimaciones, épicas e informes:** fuera, porque el equipo que los necesita no es nuestro usuario.
- **Recuperar la contraseña, editar el perfil y app móvil:** fuera, porque no ayudan a validar nada de la hipótesis.

## Parte B

1. _Los dos números: cuántas cosas propuso la IA meter dentro, y cuántas quedaron después de tu recorte._ La IA propuso 6 cosas en uan primera iteración, al pedirle que las recortara dejó 4. No pude recortar todo era básico.
2. _Tres cosas que dejaste fuera y por qué cada una ("esto fuera, porque no ayuda a validar que…")._ No exclui nada de los 4 punto que propuso el copiloto.
3. _La exclusión de la que menos seguro estás, y qué tendría que pasar para que entrara._ No pude hacer ninguna exclusión, el producto quedaria cojo, no seria un MVP.
