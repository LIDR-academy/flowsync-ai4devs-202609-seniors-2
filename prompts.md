# Prompts

Aquí van **todos los prompts que lanzaste** para hacer el ejercicio, en el orden en que los
lanzaste, con el modelo y la herramienta de cada uno.

Esto no es papeleo. Lo que se revisa es **cómo pediste las cosas**, no solo lo que salió: un
resultado flojo con un prompt bueno y un resultado flojo con un prompt vago necesitan feedback
distinto, y sin este archivo no se distinguen.

## Cómo rellenarlo

- Un apartado `## Prompt N` por cada prompt.
- **Pega el prompt tal cual lo lanzaste**, dentro del bloque de código, aunque ocupe diez líneas
  y aunque tenga faltas. No lo reescribas para que quede bien: el que arreglaste mentalmente
  después no es el que lanzaste.
- Incluye también los que **no funcionaron**. Suelen ser los más útiles de leer.
- `Modelo` y `Herramienta` en todos. Si cambiaste de una a otra a mitad, se nota aquí.

Borra el ejemplo de abajo cuando escribas el primero.

---

## Prompt 1

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Quiero entender qué tenemos hoy.

Revisa el código y explícame qué funcionalidades están implementadas, cuáles son solo pantallas o estructuras, y qué entidades y relaciones existen en el modelo de datos.

Termina con un resumen de 3–5 líneas que pueda usar como contexto del alcance.

Por ahora solo analiza: no modifiques archivos ni ejecutes comandos Git. No propongas todavía nuevas funcionalidades.
```

**Qué salió:** (opcional, una línea) funcionó a la primera / tuve que insistir / me inventó una ruta que no existe.


## Prompt 2

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

Partiendo de lo que encontraste, esta es la idea de producto:

“Quiero que FlowSync sea una herramienta para que los equipos remotos sepan en qué está trabajando cada uno sin tener que hacer reuniones de sincronización. Algo tipo tareas compartidas pero más en tiempo real y menos rollo que Jira.”

Hazme las cinco preguntas que más reducirían la incertidumbre sobre el problema, los usuarios y el alcance.

Una sola ronda de preguntas. No preguntes por modelo de datos, endpoints ni arquitectura. No propongas todavía una solución ni modifiques archivos.



## Prompt 3

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

Estas son las respuestas de producto ya decididas para el ejercicio. Úsalas para responder tus cinco preguntas.

Si alguna pregunta no queda cubierta, toma una decisión y márcala explícitamente como supuesto. No hagas otra ronda de preguntas.

Devuélveme las cinco preguntas con sus respuestas y los supuestos que hayas tenido que añadir. No propongas todavía el alcance ni modifiques archivos.

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


## Prompt 4

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

Con lo que encontramos en el código y la ficha de hechos, propón un MVP siendo agresivo al recortar.

Escríbelo en docs/prd/alcance-mvp-jr.md con este orden:
1. Terreno existente, resumido en 3–5 líneas.
2. Las cinco preguntas con sus respuestas y los supuestos, de forma breve.
3. Cinco bloques: problema, usuarios, propuesta de valor, alcance y NO-alcance.

Explicita qué hipótesis buscamos validar y el criterio de éxito a una semana. Numera las funcionalidades que propones incluir para poder contarlas. Justifica cada exclusión indicando qué hipótesis no ayuda a validar.

Mantén el piloto en el equipo SaaS del caso de estudio. Un responsable por tarea no impide que una persona tenga varias tareas. Declara cómo interpretas la tensión entre “sin campos obligatorios” y los cuatro datos indicados para una tarea.

Que sea breve, en lenguaje de producto, sin esquemas de base de datos, endpoints, arquitectura ni backlog técnico. No presentes la autenticación existente como funcionalidad nueva.

Esta es tu propuesta inicial: no inventes mi recorte ni mi reflexión final. Modifica únicamente ese archivo y no ejecutes Git.



## Prompt 5

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

Decido excluir la fucionalidad 3. Para este MVP quiero validar si consultar una lista compartida y actualizar los estados permite eliminar la ronda de “¿en qué estás?”. La edición de los demás datos no es indispensable para esa primera validación. Mantengo el cambio de estado y la posibilidad de elegir responsable al crear la tarea.

La incorporaría a posterior si durante el piloto los errores o las reasignaciones obligan a duplicar tareas o hacen que el equipo deje de confiar en la lista. La idea es simplificar el producto sin perder información confiable.

Corrige además estos puntos:
- Haz explícito que los cambios de estado se vean sin refrescar. Estaba en la ficha, pero lo omitiste en el alcance.
- Explicita que FlowSync sustituye al gestor de tareas actual para evitar la doble actualización.

Actualiza únicamente docs/prd/alcance-mvp-jr.md. Registra mi recorte y mi reflexión, sin inventar otras decisiones mías. Conserva el conteo original de 5 funcionalidades propuestas y distingue la exclusión de la omisión corregida al mostrar el conteo final.

No ejecutes Git.