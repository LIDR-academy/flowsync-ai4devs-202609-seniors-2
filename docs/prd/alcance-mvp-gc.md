# PRD

## Problema/contexto
Los equipos remotos pequeños pierden tiempo y coordinación por falta de visibilidad pasiva del trabajo del resto:

- **Lo que duele hoy:** la ronda de "¿en qué estás?" dentro de la daily (se come la mitad de los 15 minutos) y el "¿cómo vas?" suelto por Slack. Nadie ve el estado del equipo sin interrumpir a alguien.
- **Quién paga el costo:** los pares entre sí — no hay un manager esperando un reporte. Duele tanto a quien pregunta como a quien es interrumpido.
- **Episodio que lo hace concreto:** dos personas tocaron el mismo módulo la misma semana porque una empezó sin que la otra se enterara. Dos días perdidos.
- **Qué NO resuelve:** la daily no desaparece — sigue existiendo para hablar de bloqueos. Solo se elimina la ronda informativa de "en qué está cada uno", porque esa parte pasa a verse sola.

## Usuarios
- **Perfil:** equipos remotos de 3–10 personas, sin jerarquía — roles planos, todos ven y editan lo mismo.
- **Caso de estudio (no cliente real):** equipo de producto SaaS, 6 personas, 3 husos horarios, hoy usa un gestor de tareas pesado + daily de 15' por videollamada.
- **Frontera de modelo:** un único espacio de trabajo compartido por todos los usuarios registrados — **no existe la entidad "equipo"**. Multi-equipo / pertenecer a varios equipos queda fuera del MVP y se documenta como supuesto, no se construye.

## Propuesta de valor
**"Tiempo real" definido con precisión:**

- Es **frescura del estado de la tarea**, no presencia de la persona. Ver cambios sin refrescar ni preguntar.
- Explícitamente NO es: chat, videollamada, edición colaborativa simultánea, ni indicador de "quién está conectado" (se rechaza a propósito por ser vigilancia).
- Forma de la señal: **resumen que espera, no aviso que interrumpe** — el caso de uso es "llego a la mañana o vuelvo de una reunión y veo qué se movió". Sin notificaciones push.
- **Decisión que habilita:** no arrancar algo que otro ya está tocando, y elegir la próxima tarea sabiendo qué está libre. Si el único beneficio fuera "sentirse informado", no justificaría el costo de construirlo.

**Por qué el dato se mantiene fresco (el riesgo central del producto):**

- El estado lo teclea quien hace la tarea, en segundos — nunca se deriva de señales externas (Git/PRs/CI/calendario: eso es otro producto, con OAuth de terceros, fuera del MVP).
- Se sostiene porque actualizar son dos clics sobre una lista ya abierta, sin campos obligatorios, sin sprint ni estimación — y quien lo actualiza cobra el beneficio en el momento (esa misma lista es su cola de trabajo, y de paso deja de recibir interrupciones preguntándole cómo va).
- **Riesgo #1 a validar:** que la información se quede vieja y el producto pierda sentido. La mitigación de diseño es reducir la fricción de actualizar a dos clics, no obligar a nadie a hacerlo.
- FlowSync **reemplaza** al gestor de tareas, no convive con uno externo — crea las tareas, no las lee de otro lado. Convivir exigiría doble actualización, que es como muere esta categoría de producto.

## Alcance
Una tarea tiene: **título, responsable (opcional), estado, fecha de vencimiento** (la fecha es solo para ver de un vistazo qué se pasó de plazo, no para planificar).

**Asignación: solo autoasignación.** Cada quien crea tareas para sí mismo o las deja sin responsable para que alguien las tome; nadie crea ni asigna una tarea a otra persona. Es lo que sostiene el incentivo de frescura: quien escribe el estado es siempre quien hace el trabajo.

Funcionalidades:
1. Crear una tarea (título, en segundos, sin flujo de configuración) — para uno mismo o sin asignar.
2. Autoasignarse una tarea que está sin responsable.
3. Cambiar el estado de una tarea propia.
4. Ver la lista de tareas del espacio compartido, con sus cambios de estado reflejados sin recargar la página. Cada tarea muestra su responsable (o "sin asignar") — es el mecanismo que evita que dos personas empiecen lo mismo sin saberlo.
5. Filtrar la lista: por estado, por "sin asignar" y por "asignadas a mí".

## No-alcance
- Múltiples equipos/proyectos o entidad "equipo". El caso de estudio es un único grupo de 6-10 personas. Meter la entidad "equipo" implica invitaciones, selección de espacio y aislar datos entre espacios — complejidad que no ataca la ronda de "¿en qué estás?", solo la pospone.
- Roles y permisos diferenciados. El problema mismo excluye al manager como interesado ("le daría igual"). No hay ningún actor descrito que necesite ver o hacer menos que otro, así que no hay un caso de uso real que justifique la complejidad — serían permisos especulativos.
- Delegación: asignar una tarea a otra persona. Solo autoasignación — quien registra el trabajo es siempre quien lo hace. El incentivo que describiste ("quien lo escribe cobra en el momento, por eso lo actualiza") asume autoreporte: cada uno anota lo suyo. Pero no dijiste si alguien puede crear una tarea y asignársela a un compañero (delegar) — en un equipo flat eso puede pasar ("che, alguien tiene que hacer X"). Si lo permitimos, ese caso rompe el incentivo de "cobra quien escribe", porque quien la crea no es quien la hace.
- Notificaciones push e integraciones externas (Slack, etc.). Contradice directamente la propuesta de valor: dijiste "resumen que espera, no aviso que interrumpe". Una notificación push es la misma interrupción que se quiere eliminar, solo que con otro canal — incluirla sería resolver el problema y volver a crearlo.
- Indicadores de presencia ("quién está conectado ahora"). Lo descartaste vos mismo como vigilancia. Además es irrelevante para la decisión que el producto habilita ("qué está libre / qué no empezar"), que se resuelve enteramente con el estado de la tarea, no con la presencia de la persona.
- Comentarios o discusión por tarea. La daily no desaparece — la parte de bloqueos y conversación sigue viva ahí. Meter comentarios sería reconstruir un canal de discusión síncrona dentro de la herramienta, compitiendo con la reunión que decidiste conservar, y rompe el "dos clics, sin campos obligatorios" que sostiene la frescura del dato.
- Derivar estado desde señales externas (Git/PRs/CI/calendario). Es otro producto: exige OAuth de terceros, mapear eventos ambiguos a un estado y mantenimiento de integraciones. Además contradice el mecanismo de frescura que elegiste — el estado lo teclea la persona en segundos, no se infiere de otro sistema.
- Sprints, estimaciones, épicas, backlog priorizado, analítica/reporting. Nadie pidió reportar hacia arriba (no hay manager interesado) y el problema no es de planificación sino de visibilidad momentánea. Son justo las features que vuelven "pesado" al gestor de tareas que se quiere reemplazar — incluirlas sería reconstruir el "rollo de Jira" que motivó el proyecto.
- Filtrar la lista por un responsable específico que no sea uno mismo (evita vigilancia dirigida a una persona; la visibilidad general ya la da el punto 4 de Alcance)

## Las 3 líneas

- **Cantidad de cosas propuestas por la IA:** 4 funciones/3 épicas. **Cantidad de cosas aceptadas por mí:** 5 funciones.
- **3 cosas que dejé fuera, justificadas:**
    - Ninguna. De hecho me pareció que faltaba algo así que terminé convenciéndola de agregar una quinta (ver prompt #6).
- **Exclusión que meás dudas me da:** no aplicable