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

---

## Prompt 1

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Quiero que FlowSync sea una herramienta para que los equipos remotos sepan en qué está trabajando cada uno sin tener que hacer reuniones de sincronización. Algo tipo tareas compartidas pero más en tiempo real y menos rollo que Jira.
```

**Qué salió:** en vez de asumir, preguntó qué hacer con la visión (guardarla como contexto, crear tickets, redactar un PRD, o empezar a implementar).

## Prompt 2

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Vamos a redactar el PDR, para ellos es importante acotar bien el alcance del MVP pero tambien tener en cuenta lo que ya esta construido. Por lo que primero quiero que me ayudes a indtificar las capacidades que ya se encuentran a nivel de producto. No ncesito detalles tecnicos, solo habla como si fueras una persona de negocio. Luego actualiza el documento y comenzamos por ahi.
```

**Qué salió:** exploró el repo, resumió las capacidades actuales (solo autenticación) en lenguaje de negocio y creó el documento del PRD.

## Prompt 3

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Antes de completar el resto del documento, quiero que preguntes antes de proponer. Realiza las cinco preguntas con las que reducimos la incertidumbre sobre el problema, usuarios y el alcance. Las preguntas las realizaras en uns sola ronda, luego en te dare una respuesta con todos los detalles.
```

**Qué salió:** lanzó las 5 preguntas en una sola ronda, en texto abierto (sin forzarlas a opciones cerradas).

## Prompt 4

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Aqui las respuestas:
```

**Qué salió:** el mensaje llegó sin el contenido de las respuestas; pidió que lo reenviara.

## Prompt 5

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
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

Ademas fuera del alcance quedara:

- Fuera del MVP: notificaciones push, integración con Slack, roles/permisos avanzados, analítica/reporting, comentarios en tareas.
```

**Qué salió:** con estas respuestas se rellenaron las secciones de Problema y usuarios, Alcance del MVP, Fuera de alcance y Métricas de éxito del PRD.

## Prompt 6

**Modelo:** no visible desde esta sesión (asistente embebido del documento)
**Herramienta:** Claude Docs — comentario en el documento (claude.ai)

```
@Claude Efectivamente los estados serán valores predeterminados como To DO, In progress y Done.
```

**Qué salió:** respondiendo a un comentario dejado en el documento sobre qué necesita una tarea; se añadió que el estado es un conjunto fijo de tres valores (To Do, In Progress, Done) y se resolvió el hilo.

## Prompt 7

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Vamos sobre cada seccion relevante, que mas necesitamos detallar en la seccion de Problema y usuario? Quedo claro? Es claro del texto el dolor que estamos resolviendo y porque se hace? Es claro de igual forma el usuario, para quien es? Y que hace el sin esto ahora. Realiza comentarios si ves algo que deba evaluar y antes de suponer preguntame.
```

**Qué salió:** dejó dos comentarios anclados en el documento señalando ambigüedades (si el problema es solo de equipos de desarrollo, y si separar "qué hacen hoy sin FlowSync" en su propia frase), sin tocar el texto.

## Prompt 8

**Modelo:** no visible desde esta sesión (asistente embebido del documento)
**Herramienta:** Claude Docs — comentario en el documento (claude.ai)

```
@Claude Veo que puede ser por separado, no es necesario que sea literal como las respuestas que te pase. La idea es consolidar y que sea conciso, claro y sin ambigüedades.
```

**Qué salió:** se separó "qué hacen hoy sin FlowSync" en un apartado propio ("Cómo lo resuelven hoy") y el problema quedó en una sola frase; hilo resuelto.

## Prompt 9

**Modelo:** no visible desde esta sesión (asistente embebido del documento)
**Herramienta:** Claude Docs — comentario en el documento (claude.ai)

```
@Claude Vamos a asumir que nosotros equipos son de desarrolladores.
```

**Qué salió:** se actualizó el usuario objetivo a "Equipos remotos de desarrolladores, pequeños, de 3 a 10 personas"; hilo resuelto.

## Prompt 10

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Continuemos con la session de propuesta de valor, esta no esta definida en el PDR actual pero es relevante para conocer el valor y el cambio para el usuario condo exista FlowSync. Crea una descripcion clara, indicando el valor a nivel de negocio. Realizame preguntas si vez algo ambiguo.
```

**Qué salió:** dejó un bloque pendiente en el documento y lanzó 3 preguntas (qué se entiende por "negocio", si cuantificar o no, formato) antes de escribir nada.

## Prompt 11

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
1.

el valor para el equipo/usuario dentro de su organización (menos fricción, más foco, decisiones más rápidas)
```

**Qué salió:** respondía solo la pregunta 1; Claude anotó eso y recordó que faltaban las respuestas 2 y 3 antes de escribir.

## Prompt 12

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
2. Dejaria eso para la seccion de metricas de exito. Por ahora que sea cualitativo el valor. 3. Un desarro del parrafos pero que quede consciso el valor. Prefiero que no inventes ni te extiendas. El otro formato no lo veo viable pues vuelve a duplicar datos del documento.
```

**Qué salió:** con las 3 respuestas completas, escribió la sección "Propuesta de valor" en el documento.

## Prompt 13

**Modelo:** no visible desde esta sesión (asistente embebido del documento)
**Herramienta:** Claude Docs — comentario en el documento (claude.ai)

```
@Claude Esto ya es parte del problema, solo nos queremos centrar en el valor
```

**Qué salió:** se quitó de "Propuesta de valor" la frase que repetía el planteamiento del problema; la sección quedó abriendo directo con el valor; hilo resuelto.

## Prompt 14

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Siguiente seccion, es importante definir que vamos a incluir en nuestro primer alcance MVP. No es necesario incluirlo todo, pero si es importante agregar en el no-alcance porque se decide no hacer. Por ejemplo, el alcance a demas debe ser claro y que nos permita luego identificar epicas.
```

**Qué salió:** antes de escribir, preguntó el motivo de dos exclusiones (Slack, comentarios) y propuso una lista de "en alcance" para confirmar.

## Prompt 15

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
1. Queremos simplificar el producto y evitar integraciones en nuestra primera iteracion. Por ello no nos vamos a complicar. 2. Porque convertiria en un hilo de conversacion y nos queremos centrar en el estado. 3. Tambien filtrar el responsable me parece apropiado. Igualmente un indicador en las tareas que ya se han vencido. Todo lo demas justificalo en el No-alcance/ Fuera de alcance
```

**Qué salió:** agregó la lista "En alcance (MVP)" y reescribió "Fuera de alcance" con el motivo de cada exclusión.

## Prompt 16

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Si, en esta incluye las metricas con valores que luego nos permiten ver si funciono
```

**Qué salió:** en vez de inventar números, propuso 4 métricas candidatas y pidió que definiera los umbrales de cada una.

## Prompt 17

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
El prd lo vamos a dejar en: docs/prd/alcance-mvp-vpss.md
```

**Qué salió:** creó una rama nueva (`docs/prd-flowsync-mvp`, para no commitear directo en `s2/start`) y guardó el PRD ahí como archivo markdown.
