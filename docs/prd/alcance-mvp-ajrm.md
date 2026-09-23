# FlowSync — PRD: Alcance del MVP

## Problema

Los equipos remotos pequeños pierden tiempo y cometen errores de coordinación evitables porque no tienen una forma pasiva de saber en qué está trabajando cada persona. Hoy esa información solo existe en dos sitios: la ronda de "¿en qué estás?" dentro de la daily, y las interrupciones puntuales por chat. Ninguna de las dos escala bien: la ronda consume la mitad de los 15 minutos de la daily, y las interrupciones cuestan foco a quien las recibe.

El costo no es hipotético: dos personas del equipo llegaron a tocar el mismo módulo la misma semana porque una empezó sin que la otra lo supiera, perdiendo dos días de trabajo. El problema no es "no hay reuniones suficientes", es que la única forma de enterarse de qué está haciendo un par es preguntando, en vivo, a una persona concreta.

Importante: la daily no desaparece como ritual completo. El bloque de bloqueos/impedimentos sigue existiendo y este MVP no lo resuelve — el problema que ataca este producto es específicamente la ronda de "¿en qué estás?", no la reunión entera.

## Usuarios

- **Perfil objetivo**: equipos remotos pequeños, de 3 a 10 personas, sin jerarquía de permisos — todos ven y editan lo mismo.
- **Caso de estudio de referencia** (no cliente real): equipo de 6 personas de producto SaaS, distribuido en 3 husos horarios, que hoy usa un gestor de tareas pesado más una daily de 15 minutos por videollamada.
- **Quién obtiene el valor**: los pares entre sí, no un manager. No existe reporte "hacia arriba" en este producto — a un rol de liderazgo el estado agregado le sería indiferente en este alcance.
- **Por qué la propia persona lo alimenta**: quien escribe su estado lo hace porque esa misma lista es su cola de trabajo — la usa para decidir qué toma a continuación — y de paso deja de recibir interrupciones. Si el beneficio fuera solo para los demás, no lo mantendría actualizado.

## Propuesta de Valor

FlowSync reemplaza la ronda de "¿en qué estás?" por un vistazo a una lista de tareas compartida y siempre vigente, sin necesidad de preguntar ni interrumpir a nadie.

- **Frescura, no presencia**: se muestra el estado de la *tarea*, no si la persona está conectada. No hay indicadores de actividad ni de "quién está en línea" — eso es vigilancia, y se descarta a propósito.
- **Señal que se consulta, no que interrumpe**: el patrón de uso es "llego por la mañana o vuelvo de una reunión y miro qué se movió", no un aviso que empuja notificaciones.
- **Decisión que cambia**: con esta información alguien evita empezar algo que otro ya está tocando, y elige lo siguiente sabiendo qué está libre. Si el único beneficio fuera "sentirse informado", el producto no justificaría su costo.
- **Menos rollo que Jira**: crear una tarea y cambiarle el estado toma segundos, sin flujos de configuración ni campos obligatorios más allá de lo mínimo.
- **Criterio de éxito**: a una semana de uso real, el equipo cancela la ronda de "¿en qué estás?" de la daily y nadie pide que vuelva.

## Alcance

Una vertical fina y completa de punta a punta — se prioriza una capability terminada sobre varias a medias.

1. **Autenticación de usuarios** (ya existente en el proyecto): signup, login, logout, perfil — sirve de base para identificar quién es el "responsable" de cada tarea.
2. **Gestión de tareas propia** (FlowSync es la fuente de la tarea, no un espejo de otro sistema):
   - Crear una tarea con: **título** (obligatorio), **responsable** (por defecto quien la crea), **estado** (por defecto "por hacer") y **fecha de vencimiento** (opcional).
   - Editar cualquiera de esos cuatro campos, incluido reasignar el responsable.
   - Cambiar el estado de una tarea en dos clics, sin pasos intermedios.
3. **Estados de tarea mínimos**: *Por hacer / En curso / Bloqueado / Hecho* — suficientes para saber en qué punto está algo, sin resolver el bloqueo en sí.
4. **Listado compartido y único** de todas las tareas del equipo, visible para cualquier miembro autenticado, con **filtro por estado** para centrarse en lo pendiente y ver de un vistazo qué se pasó de fecha.
5. **Frescura de datos sin recarga manual**: cualquier usuario que abra o vuelva a mirar la lista ve el estado vigente, sin necesitar refrescar la página a propósito.

## NO-Alcance

Cada exclusión responde a una razón de producto verificada contra la ficha de negocio, no a una limitación técnica.

- **Notificaciones push** — el patrón de uso deseado es "consulto cuando vuelvo", no "me interrumpen cuando cambia algo". Meter push reintroduce exactamente el tipo de interrupción que el producto busca eliminar.
- **Integración con Slack** — el dolor actual *es* Slack como lugar disperso de estado; traer FlowSync a Slack diluiría la propuesta de "un solo lugar" y reabre la fragmentación que se quiere cerrar.
- **Roles y permisos avanzados** — el equipo objetivo tiene roles planos por decisión de negocio: todos ven y editan lo mismo. No hay manager que consuma una vista distinta en este alcance, así que construir jerarquía de permisos no tiene comprador dentro del MVP.
- **Analítica / Reporting** — el éxito se valida de forma cualitativa (el equipo deja de hacer la ronda y nadie la reclama), no con un dashboard. No hay reporte "hacia arriba" que alimentar, y no hay owner de negocio que use esos números en este alcance.
- **Comentarios en tareas** — el valor está en decidir qué tomar y evitar choques, no en discutir sobre una tarea dentro de la herramienta; eso es terreno de colaboración/conversación que el producto excluye explícitamente (no es chat).
- **Presencia / indicadores de "conectado ahora"** — rechazado a propósito: el estado es de la tarea, no de la persona. Un indicador de actividad convierte la herramienta en vigilancia, que es lo opuesto a lo que valida el caso de negocio.
- **Derivar el estado de señales externas (Git/PRs, CI, calendario)** — la señal la teclea la persona en segundos; automatizarla es otro producto, con integraciones y OAuth de terceros que no aportan al problema puntual de esta ronda.
- **Sprints, estimaciones, épicas, backlog priorizado** — un equipo que necesite planificación de ese tipo no es el usuario objetivo de este MVP; añadir estos conceptos vuelve a convertir a FlowSync en "otro Jira", justo lo que se quiere evitar.
- **Multi-equipo / múltiples espacios de trabajo / pertenencia a más de un equipo** — el MVP asume un espacio único compartido sin entidad "equipo"; soportar varios equipos es una frontera explícita marcada como fuera de alcance en la ficha de negocio, no un supuesto.
- **Resolución de bloqueos dentro de la daily** — el bloque de "bloqueos" de la reunión sigue existiendo tal cual; el producto marca que algo está bloqueado, pero no gestiona su desbloqueo ni sustituye esa conversación.
- **Convivencia con otro gestor de tareas** — FlowSync crea las tareas, no lee las de otro sistema; soportar ambos a la vez exigiría doble actualización, que es la causa de muerte que la ficha identifica para esta categoría de producto.


# Parte B
- Cuántas cosas propuso la IA meter dentro del alcance, y cuántas quedaron dentro después de tu recorte. Tal cual salieron, sin redondear ni explicar.

   No se recortó ninguna.

- Tres cosas que dejaste fuera, y por qué cada una.

   El alcance propuesto por la IA identificó con precisión el núcleo del producto, por lo que reducir alguna más dejaría el MVP no funcional.

- La exclusión de la que menos seguro estás: 
   **Comentarios en tareas**

   ¿Qué tendría que pasar para meterlo?: Que la primera semana el equipo ignore la herramienta y vuelva a interrumpirse por Slack porque el estado 'Bloqueado', sin mayor detalle, no les brinda la información que necesitan.