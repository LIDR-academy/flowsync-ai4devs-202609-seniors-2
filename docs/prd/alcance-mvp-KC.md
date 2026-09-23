## MVP Defendible

- Qué duele hoy: la daily de sincronización y el "¿en qué estás?" constante por Slack/chat. Nadie ve el estado del equipo sin interrumpir a alguien.
- Quién cobra el valor: los pares, no un lead. No hay reporte hacia arriba y a un manager le daría igual. Duele a los dos devs que descubren tarde que iban a lo mismo, y al que interrumpe a otro para preguntar.
- Episodio concreto: dos personas del equipo tocaron el mismo módulo la misma semana porque una empezó sin que la otra lo supiera. Dos días perdidos.
- Qué reunión desaparece (respuesta honesta, no la vendas de más): la daily NO desaparece entera. Desaparece la ronda de "¿en qué estás?", que hoy se come la mitad de los 15 minutos. La parte de bloqueos sigue, y este MVP no la resuelve.
- Usuarios / equipo: equipos remotos pequeños, 3–10 personas. Roles planos: en el MVP todos ven y editan lo mismo, sin jerarquía de permisos.
- Primer usuario concreto: equipo de 6 personas de producto SaaS, en 3 husos horarios, que hoy usa un gestor de tareas pesado y una daily de 15 minutos por videollamada. Es un CASO DE ESTUDIO, no un cliente real.
- Fronteras: un espacio único compartido, sin entidad "equipo". Varios equipos separados, o gente en más de uno, queda FUERA del MVP: se anota como supuesto en el PRD, no se construye.
- "Tiempo real" = ver los cambios de estado de las tareas sin refrescar ni preguntar. NO es chat, NO es videollamada, NO es colaboración simultánea sobre el mismo documento.
- Es frescura, no presencia: el estado es de la TAREA, no de la persona. Nada de "quién está conectado ahora" ni indicadores de actividad; eso es vigilancia y lo rechazamos a propósito.
- Forma de la señal: resumen que espera, no aviso que interrumpe. El caso es "llego por la mañana o vuelvo de una reunión y veo qué se ha movido". Sin notificaciones push.
- Qué decisión cambia: no empezar algo que otra persona ya está tocando, y elegir lo siguiente sabiendo qué está libre. Si la única respuesta fuera "sentirse informado", el tiempo real no valdría lo que cuesta.
- De dónde sale el estado: lo teclea la persona que hace la tarea, en segundos. Derivarlo de señales externas (Git/PRs, CI, calendario) está FUERA del MVP: es otro producto, con integraciones y OAuth de terceros.
- Por qué se sostiene: no porque sea más agradable, sino porque son dos clics sobre una lista ya abierta, sin campos obligatorios, sin decidir sprint ni estimación. Y quien lo escribe cobra en el momento: esa misma lista es su cola de trabajo, la mira para decidir qué coge, y de paso deja de recibir interrupciones preguntándole cómo va. Si el beneficio fuera solo para los demás, no lo escribiría.
- Si la información se queda vieja: el producto pierde el sentido, y lo asumo. Es el riesgo #1 a validar, no un detalle. La mitigación es que actualizar cueste dos clics, no obligar a nadie.
- Es donde se hace el trabajo, no donde se cuenta: sustituye al gestor de tareas, no convive con él. FlowSync crea las tareas, no lee las de otro sitio. Convivir exigiría doble actualización, que es como muere esta categoría.
- Renuncia explícita a sprints, estimaciones, épicas, backlog priorizado e informes. Un equipo que necesite eso no es nuestro usuario.
- "Menos rollo que Jira" = crear una tarea y cambiarle el estado en segundos, sin flujos de configuración ni campos obligatorios. Lo mínimo para saber quién está en qué.
- Qué necesita una tarea en el MVP: título, responsable, estado y fecha de vencimiento. La fecha, para ver de un vistazo qué se ha pasado de plazo.
- Cómo se consume la lista: filtrando por estado, para centrarse en lo pendiente.
- Éxito para el usuario: dejar de hacer la ronda de "¿en qué estás?" de la daily porque el estado del equipo se ve de un vistazo.
- Criterio a una semana de uso real: que el equipo cancele esa ronda y nadie pida que vuelva. Si la siguen haciendo igual, no funcionó.
- Cuánto construir: una vertical fina y usable de punta a punta, no el andamiaje amplio de un producto. Prefiero una capability terminada a tres a medias.
- Fuera del MVP: notificaciones push, integración con Slack, roles/permisos avanzados, analítica/reporting, comentarios en tareas.

---

# Requerimientos de producto — MVP de FlowSync

## Estado del documento

Propuesta de alcance para revisión de producto e implementación. El contenido anterior se conserva como punto de partida y registro de las decisiones iniciales.

## 1. Resumen

FlowSync es una lista compartida de trabajo para equipos remotos pequeños. Permite que cualquier integrante vea rápidamente qué tareas existen, quién está trabajando en cada una y cuál es su estado actual, sin interrumpir a otra persona ni recorrer un gestor de proyectos complejo.

El MVP comprobará si una vista común, rápida de consultar y fácil de mantener puede eliminar la ronda informativa de “¿en qué estás?” de la reunión diaria. No pretende eliminar la conversación sobre bloqueos ni cubrir la planificación completa de un equipo.

El alcance está dimensionado para una persona desarrolladora durante dos semanas. La prioridad es entregar un único recorrido funcional de punta a punta: crear una tarea, tomarla o asignarla, actualizar su estado y consultar el trabajo vigente del equipo.

## 2. Problema

Los integrantes de equipos remotos carecen de una señal sencilla y actualizada sobre el trabajo de sus pares. Para saber quién está haciendo qué, preguntan por chat o dedican parte de la reunión diaria a repetir estados. Esto provoca interrupciones y puede hacer que dos personas empiecen trabajo similar sin saberlo.

Las herramientas de gestión más amplias pueden contener esa información, pero su configuración, número de campos y flujos hacen que mantenerla al día se perciba como trabajo adicional. Cuando el estado se desactualiza, el equipo deja de confiar en la herramienta y vuelve a preguntar.

## 3. Público objetivo

El usuario objetivo es integrante de un equipo remoto de entre 3 y 10 personas, con responsabilidades relativamente planas y distribuido entre varios husos horarios. Consulta la herramienta para decidir qué tomar, evitar trabajo duplicado y entender qué cambió mientras no estaba disponible.

El caso de referencia es un equipo de producto SaaS de seis personas en tres husos horarios que actualmente usa un gestor de tareas pesado y realiza una reunión diaria de 15 minutos. Es una referencia para tomar decisiones, no evidencia de un cliente validado.

El MVP no está dirigido a organizaciones que necesitan sprints, estimaciones, épicas, permisos diferenciados, reportes de gestión o coordinación entre varios equipos.

## 4. Propuesta de valor

Una persona puede abrir FlowSync y responder de un vistazo:

- qué trabajo está pendiente, en curso o terminado;
- quién es responsable de cada tarea;
- qué tareas siguen libres para ser tomadas;
- cuáles han superado su fecha de vencimiento.

Quien actualiza una tarea obtiene valor inmediato porque la misma lista funciona como su cola de trabajo y reduce las preguntas de sus compañeros. La interacción debe ser suficientemente breve para que mantener el estado resulte más fácil que explicarlo por chat.

## 5. Objetivo del MVP

Validar que un equipo remoto pequeño puede mantener una lista compartida con suficiente vigencia como para dejar de hacer la ronda de actualización de estados en su reunión diaria.

La hipótesis principal es: si crear y actualizar una tarea requiere pocos pasos y la vista compartida permite entender el trabajo actual al entrar, el equipo consultará FlowSync antes de preguntar y dejará de repetir esos estados verbalmente.

## 6. Principios y restricciones

- El producto representa el estado del trabajo, no la presencia de las personas.
- Todos los usuarios tienen las mismas capacidades dentro de un único espacio compartido.
- La información proviene de actualizaciones manuales hechas por el equipo.
- La vista muestra la información vigente al entrar o recargar la página. La sincronización automática mientras la página permanece abierta no forma parte de este MVP.
- No habrá alertas que interrumpan al usuario. FlowSync es un lugar que la persona consulta cuando necesita ponerse al día.
- FlowSync será el lugar donde el equipo registra estas tareas. El MVP no sincroniza información con otro gestor.
- La implementación debe caber en dos semanas de trabajo de una sola persona desarrolladora, aprovechando la autenticación existente.
- El alcance describe comportamiento de producto. Las decisiones de arquitectura y el diseño detallado del modelo de datos se resolverán durante la implementación.

## 7. Recorrido principal

Una persona autenticada entra a FlowSync y ve la lista compartida del equipo. Puede identificar las tareas libres y las que ya tienen responsable, así como su estado y vencimiento. Desde esa vista crea una tarea escribiendo su título. Puede asignársela a sí misma o a otra persona y añadir una fecha de vencimiento en el mismo momento o posteriormente.

Cuando empieza el trabajo, cambia la tarea a “En curso”. El resto del equipo verá el nuevo estado la próxima vez que entre o recargue la página y podrá evitar tomar el mismo trabajo. Al finalizar, la persona cambia la tarea a “Terminada”. Cualquier integrante puede filtrar la lista por estado para concentrarse en lo que necesita revisar.

## 8. Alcance funcional

### 8.1 Consultar el trabajo compartido

La persona autenticada debe poder ver una única lista compartida con todas las tareas del espacio. Cada elemento debe mostrar, como mínimo, título, responsable o indicación de que está libre, estado y fecha de vencimiento cuando exista.

La vista debe distinguir claramente las tareas vencidas que aún no estén terminadas. La información presentada debe corresponder al estado persistido más reciente en el momento de cargar la vista.

### 8.2 Crear una tarea

Cualquier integrante debe poder crear una tarea proporcionando un título. El título es el único dato que la persona necesita introducir obligatoriamente: el sistema asigna el estado inicial “Por hacer”.

Durante la creación se puede elegir responsable y fecha de vencimiento, pero ambos pueden quedar sin definir para mantener el flujo rápido. Una tarea sin responsable representa trabajo disponible para que alguien lo tome.

Una creación exitosa debe quedar visible en la lista compartida y disponible para el resto del equipo al entrar o recargar.

### 8.3 Tomar o asignar una tarea

Cualquier integrante debe poder asignar una tarea a una de las personas disponibles en el espacio compartido. También debe poder tomar para sí una tarea libre con una acción directa.

El responsable actual debe ser visible desde la lista. El MVP adopta permisos planos: cualquier integrante puede cambiar esta asignación.

### 8.4 Actualizar el estado

Cualquier integrante debe poder cambiar una tarea entre tres estados comprensibles: “Por hacer”, “En curso” y “Terminada”. El cambio debe poder realizarse desde la lista o con una interacción igual de breve, sin abrir un flujo de configuración.

El estado actualizado debe quedar persistido y ser visible para las demás personas cuando carguen nuevamente la vista. Terminar una tarea debe evitar que aparezca como vencida, aunque su fecha ya haya pasado.

### 8.5 Gestionar el vencimiento

Cualquier integrante debe poder añadir, cambiar o retirar la fecha de vencimiento de una tarea. Una tarea se considera vencida cuando su fecha ya pasó y su estado no es “Terminada”. La señal de vencimiento debe poder entenderse sin abrir el detalle de la tarea.

### 8.6 Filtrar por estado

La lista debe permitir mostrar todas las tareas o solo las correspondientes a uno de los tres estados. Cambiar o retirar el filtro debe ser evidente y no debe modificar las tareas.

## 9. Requisitos de experiencia

- Al entrar, una persona debe poder reconocer el estado general del equipo sin navegar por varias pantallas.
- Crear una tarea debe requerir escribir el título y una única confirmación. Asignar responsable o vencimiento no debe impedir una creación rápida.
- Tomar una tarea y cambiar su estado deben requerir como máximo dos interacciones desde la lista ya abierta.
- Los estados, la ausencia de responsable y el vencimiento deben expresarse con texto comprensible; el significado no debe depender únicamente del color.
- Si una acción no puede guardarse, la interfaz debe comunicarlo y no debe presentar el cambio como confirmado.
- Al recargar, el usuario debe ver los cambios guardados previamente y conservar confianza en que la lista representa el estado actual.

## 10. Criterios de aceptación del MVP

El MVP se considera funcional cuando un equipo puede completar, sin herramientas externas, el siguiente ciclo:

1. Una persona crea una tarea escribiendo únicamente un título.
2. La tarea aparece como “Por hacer” y puede permanecer libre.
3. Otra persona carga la lista, identifica que está libre y la toma.
4. Esa persona cambia la tarea a “En curso”.
5. Un integrante carga o recarga la lista y ve el responsable y el nuevo estado.
6. La persona responsable marca la tarea como “Terminada”.
7. El equipo puede filtrar la lista para revisar por separado el trabajo pendiente, en curso y terminado.
8. Una tarea no terminada cuya fecha ya pasó se distingue como vencida.

El ciclo debe funcionar para todos los integrantes con permisos equivalentes en un solo espacio compartido.

## 11. Fuera del alcance

Quedan fuera de este MVP:

- actualización automática de la vista mientras permanece abierta;
- presencia, estado de conexión o indicadores de actividad de personas;
- chat, comentarios, videollamadas o gestión de bloqueos;
- notificaciones push, correo o avisos por Slack;
- integraciones con Git, proveedores de código, CI, calendarios o gestores externos;
- varios equipos o espacios, pertenencia a más de un equipo e invitaciones;
- roles, jerarquías y permisos diferenciados;
- sprints, estimaciones, épicas, dependencias y backlog priorizado;
- archivos adjuntos, subtareas y descripciones enriquecidas;
- analítica, informes y paneles para managers;
- historial detallado de actividad y auditoría;
- personalización de estados o flujos;
- definición de una arquitectura objetivo o de un modelo de datos preparado para escalamiento futuro.

## 12. Métricas e hipótesis de éxito

La señal principal se medirá después de una semana de uso por un equipo piloto:

- La ronda de “¿en qué estás?” deja de realizarse en la reunión diaria y el equipo no pide recuperarla.

Se proponen como señales de apoyo:

- Al menos el 80 % de las tareas activas muestra un responsable y un estado que el equipo reconoce como vigente al final de la semana.
- Al menos el 80 % de los integrantes consulta FlowSync en cuatro de los cinco días laborables del piloto.
- No se registra ningún caso de dos personas iniciando la misma tarea por desconocer que ya tenía responsable.
- Al menos cuatro de cada cinco participantes afirma que puede entender en menos de un minuto qué está haciendo el equipo.
- La mayoría de las tareas cambia a “En curso” o “Terminada” sin que otra persona tenga que pedir la actualización por chat.

Estas métricas son umbrales iniciales para aprender, no compromisos comerciales. Para el piloto pueden medirse mediante observación, una encuesta breve y revisión manual de la lista; construir analítica dentro del producto queda fuera del alcance.

## 13. Riesgos y validaciones

### La información pierde vigencia

Es el riesgo principal. Si las personas no actualizan las tareas, el equipo dejará de confiar en FlowSync. El MVP reduce el coste de actualización y comprobará si el beneficio inmediato basta para formar el hábito. No añadirá recordatorios ni mecanismos de control durante esta prueba.

### La recarga manual resulta insuficiente

El concepto inicial proponía cambios visibles sin refrescar, pero el alcance de esta iteración acepta información vigente al entrar o recargar. El piloto debe observar si esto permite tomar decisiones sin generar confusión. Si varios usuarios actúan sobre la misma tarea por ver información antigua, la sincronización automática será candidata para una iteración posterior.

### El equipo continúa usando dos herramientas

La duplicación de registros puede destruir la adopción. El piloto debe acordar que FlowSync sea la fuente de trabajo para las tareas incluidas en la prueba. No se construirán importadores ni sincronizaciones para compensar un piloto que mantenga el mismo trabajo en otro gestor.

### El producto informa, pero no cambia decisiones

Ver actividad solo tiene valor si evita interrupciones o trabajo duplicado. Durante el piloto se debe comprobar si las personas consultan la lista antes de preguntar o tomar una tarea. Una sensación general de visibilidad, sin cambios observables en esas conductas, no valida la propuesta.

## 14. Supuestos que deben validarse

- Un único espacio compartido es suficiente para el equipo piloto.
- Los permisos planos son aceptables para equipos de 3 a 10 personas.
- Tres estados bastan para representar el trabajo del piloto.
- El título, el responsable, el estado y el vencimiento aportan suficiente contexto sin comentarios ni descripciones extensas.
- Las personas aceptarán actualizar manualmente sus tareas porque el flujo es breve y la lista también les ayuda a elegir su siguiente trabajo.
- Consultar al entrar o recargar ofrece suficiente frescura durante la primera iteración.
- El equipo está dispuesto a usar FlowSync como fuente principal de las tareas incluidas en el piloto.

## 15. Condición de cierre y decisión posterior

Al terminar las dos semanas, el entregable esperado es una vertical usable que cubra el recorrido principal y los criterios de aceptación, no una plataforma extensible con capacidades incompletas.

Después de una semana de piloto, el equipo revisará la señal principal, las métricas de apoyo y los riesgos observados. Si la ronda informativa desaparece y la lista conserva vigencia, se podrá evaluar la siguiente necesidad con evidencia. Si la ronda continúa igual o la información se abandona, se considerará que la hipótesis del MVP no fue validada antes de ampliar funcionalidad.
