# Alcance MVP — FlowSync

## 1. Terreno existente

Hoy FlowSync es únicamente un esqueleto de autenticación completo: registro, login, logout y una pantalla de perfil, de punta a punta entre backend y frontend, con una sola entidad de dominio (usuario). No existe ninguna funcionalidad de gestión de trabajo en equipo: ni tareas, ni tableros, ni estado compartido. No hay tests todavía. En otras palabras: hay una base sólida para autenticar personas, pero cero del problema que da nombre al producto.

## 2. Las cinco preguntas

1. **¿Qué hace la gente hoy en vez de esto?** La daily de sincronización y el "¿en qué estás?" constante por chat; nadie ve el estado del equipo sin interrumpir a alguien. Episodio real: dos personas tocaron el mismo módulo la misma semana sin saberlo — dos días perdidos.
2. **¿Quién actualiza el estado y cuándo?** Lo teclea la propia persona que hace la tarea, en segundos, sobre una lista que además es su propia cola de trabajo. *Supuesto:* el conjunto de estados posibles es pequeño y fijo (p. ej. pendiente / en curso / hecho), no configurable.
3. **¿Qué tamaño y tipo de equipo es el usuario objetivo?** Equipos remotos de 3–10 personas, roles planos, un único espacio compartido. Piloto concreto: equipo de 6 personas de producto SaaS en 3 husos horarios (caso de estudio). *Supuesto:* el perfil es de equipo técnico/producto; no está validado para equipos no técnicos.
4. **¿Qué significa "tiempo real" en la práctica?** Ver cambios de estado sin refrescar ni preguntar; es frescura de la tarea, no presencia de la persona. Es un resumen que espera (al llegar o volver de una reunión), no un aviso que interrumpe — sin notificaciones push.
5. **¿Qué es lo mínimo que alguien necesita ver de otra persona?** Título, responsable, estado y fecha de vencimiento de cada tarea, consumidos filtrando por estado. *Supuesto:* una tarea tiene exactamente un responsable, pero una persona puede tener varias tareas asignadas a la vez — no hay límite de carga por persona.

## 3. Problema, usuarios, propuesta de valor, alcance y no-alcance

### Problema

En equipos remotos pequeños, saber en qué está trabajando cada compañero exige interrumpirlo o esperar a la daily. Eso cuesta tiempo a los dos: a quien pregunta y a quien responde. Cuando nadie lo sabe, pasa lo peor: dos personas trabajan sobre lo mismo sin darse cuenta.

### Usuarios

Equipos remotos de 3 a 10 personas, con roles planos (todos ven y editan igual, sin jerarquía). El piloto de referencia para este MVP es el caso de estudio: un equipo de 6 personas de producto SaaS, repartido en 3 husos horarios, que hoy resuelve esto con una daily de 15 minutos por videollamada.

### Propuesta de valor

Una lista de tareas compartida donde actualizar el propio estado cuesta dos clics — y donde, precisamente por costar tan poco, la gente lo mantiene al día. El resultado: cualquiera puede ver de un vistazo en qué está el equipo, sin preguntar y sin esperar a la daily. FlowSync sustituye al gestor de tareas que el equipo usa hoy, no convive con él: mantener las tareas en dos sitios a la vez obligaría a una doble actualización, que es como muere este tipo de herramienta.

### Alcance

La autenticación (registro, login, logout, perfil) ya existe en el código base tal cual y se reutiliza sin cambios; no cuenta como funcionalidad nueva de este MVP.

**Hipótesis a validar** (dos, y la segunda es la que más riesgo tiene):
- **H1 — valor:** si el equipo puede ver el estado de las tareas de sus compañeros sin preguntar, deja de necesitar la ronda de "¿en qué estás?" de la daily.
- **H2 — adopción (riesgo #1):** si actualizar el estado cuesta dos clics y no exige campos obligatorios extra, la gente lo hace sin que nadie se lo pida, y la información se mantiene fresca en vez de quedarse vieja.

**Criterio de éxito a una semana de uso real:** el equipo piloto cancela la ronda de "¿en qué estás?" de la daily y nadie pide que vuelva. Si la siguen haciendo igual, el MVP no funcionó.

**Conteo:** de las 5 funcionalidades propuestas originalmente, 1 queda **excluida** por decisión del autor (la edición de una tarea ya creada) y pasa a NO-alcance. Quedan 4 incluidas. Aparte, se corrige una **omisión de redacción** (no un cambio de alcance): la visibilidad sin refrescar ya estaba en la ficha de hechos y debía quedar explícita en la funcionalidad de ver la lista; no es una funcionalidad nueva ni resta del conteo.

**Funcionalidades incluidas:**

1. Crear una tarea con título, responsable, estado y fecha de vencimiento.
2. Cambiar el estado de una tarea existente en dos clics — es la interacción que sostiene todo lo demás.
3. Ver la lista compartida de todas las tareas del equipo, en un único espacio sin noción de "equipos" separados, con los cambios de estado visibles al instante y sin necesidad de refrescar la página.
4. Filtrar la lista por estado, para poder centrarse en lo pendiente.

**Cómo interpreto la tensión entre "sin campos obligatorios" y los cuatro datos de una tarea:** los cuatro datos (título, responsable, estado, fecha) son el techo del modelo — no hay un quinto campo que añadir, ni configuración posible. Pero dentro de esos cuatro, no todos se exigen para guardar la tarea: el único dato que de verdad hace falta escribir es el título; el responsable por defecto es quien la crea (autoasignación), el estado por defecto es "pendiente", y la fecha puede quedar vacía (sin plazo definido). Así se cumplen las dos cosas a la vez: el modelo de datos es fijo y mínimo, y crear una tarea sigue siendo un gesto de segundos, no un formulario.

### NO-alcance

Cada exclusión se justifica por qué hipótesis (H1 o H2) no ayuda a validar:

- **Editar el título, el responsable o la fecha de una tarea ya creada.** Recorte decidido por el autor tras revisar la propuesta inicial: este MVP quiere validar primero si consultar la lista compartida y actualizar el estado basta para eliminar la ronda de "¿en qué estás?" (H1); la edición de los demás datos no es indispensable para esa primera validación. Se mantienen el cambio de estado y la posibilidad de elegir responsable al crear la tarea. Se incorporaría a posteriori si, durante el piloto, los errores o las reasignaciones obligan a duplicar tareas o hacen que el equipo deje de confiar en la lista — la idea es simplificar el producto sin perder información confiable.
- **Notificaciones push.** Contradice directamente H1 tal como está definida: el valor es un resumen que se consulta cuando se quiere, no un aviso que interrumpe. Meterlo mediría otra cosa, no si la lista compartida basta.
- **Integración con Slack.** No hace falta para comprobar si el equipo deja de preguntar en la daily (H1); añade un canal más sin evidencia de que se necesite para el piloto.
- **Roles y permisos avanzados.** El equipo objetivo es plano por definición; no hay jerarquía que validar en H1 ni en H2.
- **Analítica y reporting.** El valor de este producto es entre pares, no hacia un manager; un reporte no ayuda a saber si dos compañeros dejaron de interrumpirse.
- **Comentarios en tareas.** Reintroduce el "rollo" que se quiere quitar y compite con el propio chat que ya existe; no aporta nada a si el estado se ve de un vistazo (H1).
- **Derivar el estado de señales externas (Git/PRs, CI, calendario).** Es justo lo contrario de lo que hay que probar en H2: si el tecleo manual de dos clics es suficiente para mantener el estado fresco. Automatizarlo evitaría medir el riesgo real.
- **Entidad "equipo" / múltiples espacios.** El piloto es un único equipo real; no hace falta modelar varios para validar el problema en ese equipo.
- **Sprints, estimaciones, épicas, backlog priorizado, informes.** El equipo objetivo declara explícitamente no necesitarlos; incluirlos reintroduce el peso de Jira que el producto existe para evitar, sin ayudar a H1 ni H2.
- **Borrar tareas.** No es necesario para validar ninguna de las dos hipótesis; una tarea que ya no aplica puede quedar en estado "hecho" sin que eso afecte lo que se está midiendo.
- **Indicadores de presencia ("quién está conectado ahora").** Contradice a propósito la premisa de frescura-no-vigilancia; mediría otra cosa distinta de H1 y generaría el efecto opuesto al buscado.



## Parte B — Reflexión

1. **Los dos números:** 5 propuestas / 4 incluidas.

2. **Tres cosas que dejo fuera y por qué:** edición de título, responsable y fecha, porque para probar si desaparece la ronda de “¿en qué estás?” no los veo del todo requeridos como MVP, considero suficiente con crearlos y actualizar el estado; notificaciones push, porque quiero validar si consultar la lista basta sin añadir interrupciones; integración con Slack, porque quiero comprobar el valor de FlowSync como lugar de trabajo sin depender de otro canal. El recorte de la edición fue mi recorte a la propuesta de la IA; las otras dos exclusiones ya venían de la ficha.

3. **La exclusión de la que menos seguro estoy:** la edición. Quiero simplificar el producto sin perder información confiable. La incorporaría si durante el piloto los errores o las reasignaciones obligan a duplicar tareas o hacen que el equipo deje de confiar en la lista.