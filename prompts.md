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

**Modelo:** Opus 5.5 Extra
**Herramienta:** Claude Code

```
analiza todo el contenido del repositorio y analiza desde el punto de vista funcional de la aplicación que contiene  qué capabilities hay ya construidas y cómo es el modelo de datos actual. Genera un resumen no mayor a 5 líneas. Debe servir para qué sepas que está ya construido
```

**Qué salió:** dio un resumen más técnico que funcional, sin respetar el máximo de 5 líneas. Mencionando los endpoints del backend, las 2 tablas y sus columnas en el Modelo de datos, las pantallas que están en el Frontend y una sección Por construir mencionando el Readme y prompts.md

## Prompt 2

**Modelo:** Opus 5.5 Extra
**Herramienta:** Claude Code

```
Quiero que FlowSync sea una herramienta para que los equipos remotos sepan en qué está trabajando cada uno sin tener que hacer reuniones de sincronización. Algo tipo tareas compartidas pero más en tiempo real y menos rollo que Jira.
Teniendo en consideración lo anterior, has cinco preguntas que más reducirían la incertidumbre sobre el problema, los usuarios y el alcance. Preguntas extrictamente funcionales que sirvan para definir un MVP, sin contemplar detalles técnicos (en una fase posterior se hará ese análisis)
```

**Qué salió:** 
Estas son las cinco preguntas, ordenadas por cuánta incertidumbre despejan. Cada una va con el motivo.

**¿Qué reunión quieres eliminar exactamente (daily, sync semanal…) y qué información sale hoy de ella que el equipo usa luego para actuar?**
Así sabemos cuál es el problema real, y además da el criterio de éxito: el MVP funciona si esa reunión se puede cancelar.
**¿Quién escribe la información y quién la lee? ¿Cuántas personas tiene un equipo, hay uno o varios, y existe un rol (lead o manager) que lee mucho más de lo que escribe?**
Si quien actualiza no saca nada a cambio, deja de actualizar y la herramienta muere. Esta pregunta define el usuario principal y sus permisos.
**¿Lo que se comparte es una tarea con ciclo de vida (se crea, se asigna, está en curso, se termina) o un estado personal ("ahora estoy con X", "estoy bloqueado por Y")? Si son tareas, ¿cada uno crea las suyas o alguien las reparte?**
Es donde más se separan los posibles alcances: un tablero de tareas y un muro de estados son productos distintos. La frase "Tareas compartidas pero más en tiempo real" admite las dos lecturas.
**¿Cuándo tiene que enterarse alguien de un cambio: al momento y con aviso, cuando abre la herramienta, o con un resumen diario? ¿Qué cambios justifican interrumpir a alguien (un bloqueo, una petición de ayuda, una tarea terminada)? ¿El equipo trabaja en varias zonas horarias?**
"Tiempo real" puede significar tres cosas funcionalmente distintas. En equipos remotos, lo asíncrono suele pesar más que la inmediatez.
**¿Qué es lo mínimo que alguien está dispuesto a registrar, y cada cuánto? ¿Qué cosas de Jira quedan fuera expresamente (estimaciones, sprints, flujos configurables, campos personalizados, jerarquías, comentarios)?**
Pone límite a "menos rollo que Jira" y da una lista cerrada de lo que no entra en el MVP.


## Prompt 3

**Modelo:** Opus 5.5 Extra
**Herramienta:** Claude Code

```
A continuación, las decisiones tomadas para FlowSync, si acá no está la respuesta a alguna de tus preguntas, responde por tu cuenta aclarando que son suposiciones:
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

```

**Qué salió:** 
Lo que ha supuesto va marcado como [Supuesto].

1. Qué reunión desaparece y para qué sirve la información
Sin supuestos

2. Quién escribe, quién lee, tamaño y roles

[Supuesto] Toda persona que se registra entra en ese espacio único y puede ser responsable de cualquier tarea. No hay invitaciones ni aprobación de altas. Vale para un caso de estudio, no para clientes reales.

3. Tarea o estado personal; quién crea y quién asigna

[Supuesto] Cualquier miembro puede crear tareas, para sí o para otro.
[Supuesto] Una tarea puede quedar sin responsable, y eso es estar "libre". Coger una tarea es asignársela uno mismo.
[Supuesto] Hay tres estados fijos y no configurables: Por hacer → En curso → Hecha. No hay estado "Bloqueada", porque los bloqueos quedan fuera del MVP.
[Supuesto] Hay una contradicción entre "sin campos obligatorios" y los cuatro campos de la tarea. La resuelvo así: solo el título es obligatorio, responsable y fecha son opcionales, y el estado empieza en Por hacer.
[Supuesto] Una tarea está vencida si su fecha ya pasó y no está en Hecha, y se marca en la lista.

4. Cuándo enterarse de un cambio

[Supuesto] El resumen es la propia lista, no una vista aparte de novedades. Cada tarea muestra cuándo cambió de estado por última vez ("hace 3 h"). Con eso se ve qué se ha movido y se detecta la información que se ha quedado vieja, que es el riesgo nº 1.
[Supuesto] No hay historial de cambios ni registro de actividad por tarea.

5. Lo mínimo que hay que registrar y lo que queda fuera

[Supuesto] Tampoco entran descripción larga, prioridad, etiquetas, subtareas ni adjuntos.
[Supuesto] Se pueden editar el título, el responsable y la fecha, y borrar tareas. No hay archivado.

## Prompt 4

**Modelo:** Opus 5.5 Extra
**Herramienta:** Claude Code

```
Ahora, haremos un borrador del documento del MVP, escribelo en "docs/prd/alcance-mvp-MGS.md", incluye las siguientes secciones:
Problema, usuarios, propuesta de valor, alcance, NO-alcance

Con las 2 últimas secciones, saca de alcance lo que consideres no esencial en esta primera versión del MVP
```

**Qué salió:** 
Alcance: 6 cosas. Crear una tarea escribiendo solo el título, asignarla (o cogerla uno mismo), cambiar el estado en dos clics entre tres estados fijos (Por hacer, En curso, Hecha), ver la lista de un vistazo, ver los cambios sin refrescar y filtrar por estado. Es el número que pide la Parte B.
NO-alcance: 16 exclusiones, cada una justificada. 11 son las que tu ficha ya dejaba fuera. Las otras 5 las he recortado yo.
El recorte que choca con tu ficha es la fecha de vencimiento. La ficha la pedía expresamente, pero no ayuda a validar que el equipo deja de preguntar "¿en qué estás?". Mis otros recortes quitan cosas que yo mismo había propuesto como supuestos: editar el título y borrar tareas, y el "actualizada hace X".

## Prompt 5

**Modelo:** Opus 5.5 Extra
**Herramienta:** Claude Code

```
añade los tramos 1 y 2 por favor
```

**Qué salió:**  documento actualizado acorde a como lo solicita la tarea :)
