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

**Modelo:** Opus 5
**Herramienta:** Claude Code

```
resume las capalitites del proyecto y el modelo en menos de 5 líneas nivel de product owner
```

**Qué salió:** bien; antes lancé `/context all`, que no aportó nada al ejercicio. Se le fueron 4 bullets en vez de 5 líneas y metió endpoints, que no tocaban.

## Prompt 2

**Modelo:** Opus 5
**Herramienta:** Claude Code

```
Crea el archivo docs/prd/alcance-mvp-mvl.md para crear el PRD de Flowsync - el primer apartado es contexto, y resume en el estado actual con menos lineas sin mecionar endpoints explicitamente
```

**Qué salió:** bien; corrigió lo de los endpoints y creó rama nueva por su cuenta, siguiendo CLAUDE.md.

## Prompt 3

**Modelo:** Opus 5
**Herramienta:** Claude Code

```
para acotar el alcance haz 5 preguntas concisas para precisarlo
```

**Qué salió:** las cinco preguntas se quedaron en producto, sin bajar a modelo de datos. Las escribió también en el documento sin que se lo pidiera.

## Prompt 4

**Modelo:** Opus 5
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
```

**Qué salió:** es la ficha de hechos pegada entera, sin instrucción adicional. Escribió los cinco bloques directamente, con 7 cosas dentro del alcance y 11 exclusiones.

## Prompt 5

**Modelo:** Opus 5
**Herramienta:** Claude Code

```
vale recorta lo que creas sobrante justificandndo
```

**Qué salió:** recortó 7 → 5, pero se cargó el filtro por estado, que venía decidido en la ficha de hechos. Tuve que devolverlo.

## Prompt 6

**Modelo:** Opus 5
**Herramienta:** Claude Code

```
si devuelvalo , el recorte tambien es en entodos los cinco bloques para reducir el tamaño del documenot
```

**Qué salió:** devolvió el filtro y comprimió el documento de ~130 a 68 líneas sin perder hechos.

## Prompt 7

**Modelo:** Opus 5
**Herramienta:** Claude Code

```
resume la parte usuarios quita adjetivos de la propuesta que no sean medibles
```

**Qué salió:** bien; fuera "de un vistazo", "gestor pesado", "en segundos", y en su lugar "dos clics" y "sin refrescar la página".

## Prompt 8

**Modelo:** Opus 5
**Herramienta:** Claude Code

```
pasar a no alcance que se actualize sola
```

**Qué salió:** lo movió y ajustó la propuesta de valor, que prometía lo que acababa de salir del alcance. Avisó de que con eso el "tiempo real" del brief se queda fuera del MVP.

## Prompt 9

**Modelo:** Opus 5
**Herramienta:** Claude Code

```
el alcance 1 y 4 en realidad es el mismo
```

**Qué salió:** fusionó las dos piezas en una. Alcance final: 4.

## Prompt 10

**Modelo:** Opus 5
**Herramienta:** Claude Code

```
@docs/prd/alcance-mvp-mvl.md añade una nueva sección al final "las tres líneas" 1. he excluido 2 de 6 2. He excluido que se actualice sola porque veo poco prioritario solo se consulta una vez al dia y ya refrescado creo y luego he unificado vision rápida en pantalla 3. estoy poco seguro lo de destacar lo vencido - quizas en equipos grandes y si hay modo revisión tiene sentido
```

**Qué salió:** la Parte B con mis números y mis motivos; como solo di dos exclusiones y hacen falta tres, añadió las notificaciones push y lo avisó.

## Prompt 11

**Modelo:** Opus 5
**Herramienta:** Claude Code

```
@prompts.md anexas los prompts de la sesion como se indica en el ejemplo
```

**Qué salió:** este archivo.
