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
Identifica y revisa las capabilities con la que ya cuenta este proyecto actualmente y analiza el modelo de datos actual. Con ese contexto dame un resumen de lo que encuentres en no mas de un párrafo.
```

**Qué salió:** Lo que le pedí: un resumen de las capabilities y del modelo de datos.

---

## Prompt 2

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
El equipo de negocio me ha planteado la sgte necesidad "Quiero que FlowSync sea una herramienta para que los equipos remotos sepan en qué está trabajando cada uno sin tener que hacer reuniones de sincronización. Algo tipo tareas compartidas pero más en tiempo real y menos rollo que Jira."
Antes de proponer algo, hazme las 5 preguntas más importantes que consideres (en modo one shot) para reducir la incertidumbre sobre el problema, los usuarios que usaran la solución propuesta y el alcance de lo que vamos a implementar después.
Sólo tienes derecho a realizar una sola ronda de 5 preguntas.
Estas preguntas no pueden bajar a detalle técnico como hablar de modelo de datos, endpoints, HTTP, stack tecnologico. Estas deben acotarse a preguntas de negocio.
```

**Qué salió:** Intento hacerme las preguntas una a una pero le había dicho en ine shot. Me tocó reiterarle esa instrucción en el sgte prompt

---

## Prompt 3

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
dame todas las 5 preguntas de una vez. que yo te las voy a responder juntas.
```

**Qué salió:** Ahora si, me hizo las 5 preguntas de una sola vez.

---

## Prompt 4

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
A continuación trato de dar respuestas a tus preguntas con la información que me compartió el negocio. 
Si alguna de tus preguntas no es respondida, por favor tu asume una posición con respecto a ésta y agregalos a tus supuestos, los cuales por favor necesito que me los informes de vuelta antes de continuar:

«- Qué duele hoy: la daily de sincronización y el "¿en qué estás?" constante por Slack/chat. Nadie ve el estado del equipo sin interrumpir a alguien.
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
- Cuánto construir: una vertical fina y usable de punta a punta, no el andamiaje amplio de un producto. Prefiero una capability terminada a tres a medias.»

El equipo del área de negocio también nos indica que las siguientes funcionalidades estan fuera de alcance de este MVP: "notificaciones push, integración con Slack, roles/permisos avanzados, analítica/reporting, comentarios en tareas."
```

**Qué salió:** Me indicó que todas sus preguntas estaban respondidas pero de igual forma puso 6 supuestos que iba a tomar. Y me pidió confirmación


---

## Prompt 5

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Sí, confirmo los 6 supuestos. No continues aún con el PRD.
```

**Qué salió:** Guardó los supuestos en su memoria


---

## Prompt 6

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Ahora que ya tienes un contexto, resolviste tus preguntas y tienes tus supuestos, ayudame a redactar las siguientes secciones que deben ser parte del documento PRD: Problema · usuarios · propuesta de valor · alcance · NO-alcance. 
```

**Qué salió:** Me creó un documento PRD con mas secciones de las solicitadas ya que agregó documentación de las iteraciones como las capabilities y las preguntas y respuestas dadas.


---

## Prompt 7

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Este PRD muevelo a este nuevo archivo: docs/prd/alcance-mvp-lgg.md. Y por favor quita de este todas secciones iniciales que agregaste que no te pedí.
```

**Qué salió:** Hizo lo que le pedí eliminando las secciones extras.