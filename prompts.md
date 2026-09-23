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

## Incidencia de herramienta

El MCP de Atlassian estaba configurado, pero la autenticación no pudo completarse porque la
cuenta no mostraba ningún sitio Jira/Confluence compatible. No se usó Jira ni Confluence en el
ejercicio y no se creó ningún ticket.

---

## Prompt 1

**Modelo:** Opus 5.5
**Herramienta:** Claude Code 2.1.280

```
Antes de especificar nada, inspecciona el repositorio FlowSync actual y lee las instrucciones persistentes del proyecto (CLAUDE.md / AGENTS.md y el harness disponible).

Devuélveme únicamente 3–5 líneas, en lenguaje de producto, que resuman:
1. qué capacidades ya están construidas actualmente;
2. cómo es el modelo de datos actual.

No propongas funcionalidades nuevas. No bajes a endpoints, arquitectura ni detalles de implementación. No modifiques ningún archivo todavía.
```

## Prompt 2

**Modelo:** Opus 5.5
**Herramienta:** Claude Code 2.1.280

```
Partimos de este brief de producto:

«Quiero que FlowSync sea una herramienta para que los equipos remotos sepan en qué está trabajando cada uno sin tener que hacer reuniones de sincronización. Algo tipo tareas compartidas pero más en tiempo real y menos rollo que Jira.»

Antes de proponer cualquier alcance, hazme exactamente las cinco preguntas que más reducirían la incertidumbre de producto.

Haz las cinco preguntas en una sola ronda. No inventes respuestas, no propongas funcionalidades todavía y no bajes al modelo de datos, endpoints, arquitectura ni detalles técnicos. No modifiques ningún archivo. Espera mis respuestas antes de continuar.
```

## Prompt 3

**Modelo:** Opus 5.5
**Herramienta:** Claude Code 2.1.280

```
Estas son las respuestas de producto ya decididas para FlowSync. Úsalas para responder las cinco preguntas que acabas de hacer.

No inventes información adicional. Si alguna de tus cinco preguntas no queda completamente respondida por estos hechos, toma la decisión más conservadora necesaria para poder continuar y márcala explícitamente como SUPUESTO. No propongas todavía el alcance final, no bajes a modelo de datos, endpoints, arquitectura ni detalles técnicos y no modifiques archivos.

Ficha de hechos:

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

También está decidido que queda fuera del MVP:

- Fuera del MVP: notificaciones push, integración con Slack, roles/permisos avanzados, analítica/reporting, comentarios en tareas.

Ahora responde únicamente a tus cinco preguntas anteriores basándote en esta ficha. Si necesitas algún SUPUESTO, indícalo al final.
```

## Prompt 4

**Modelo:** Opus 5.5
**Herramienta:** Claude Code 2.1.280

```
Acepto los supuestos S1, S3 y S4.

No acepto S2: la ficha de hechos dice que una tarea en el MVP necesita título, responsable, estado y fecha de vencimiento. No asumas que el responsable puede quedar vacío; limítate a decir que esos cuatro datos forman parte de la tarea, sin inventar reglas adicionales sobre obligatoriedad.

Ahora propón el MVP en exactamente estos cinco bloques:

1. Problema
2. Usuarios
3. Propuesta de valor
4. Alcance
5. NO-alcance

Recorta de forma agresiva. En "Alcance", enumera claramente cada capability que propones incluir para que podamos contarlas después. En "NO-alcance", justifica cada exclusión explicando por qué no ayuda a validar la hipótesis principal del producto.

Mantén el documento en lenguaje de producto. No incluyas tablas, endpoints, arquitectura, modelo de datos ni detalles técnicos. Debe caber aproximadamente en una pantalla larga.

No modifiques archivos todavía. Al final indica únicamente cuántas cosas propusiste dentro del alcance.
```

## Prompt 5

**Modelo:** Opus 5.5
**Herramienta:** Claude Code 2.1.280

```
Confirmo mi recorte humano del MVP: saco del alcance la capability "Filtrar la lista por estado".

La IA propuso 5 capabilities y, después de mi recorte, quedan 4.

Quiero que cierres ahora el ejercicio y escribas la entrega. Modifica ÚNICAMENTE estos dos archivos:

1. docs/prd/alcance-mvp-jfc.md
2. prompts.md en la raíz

No modifiques ningún otro archivo.

Para docs/prd/alcance-mvp-jfc.md:

Debe quedar como un documento de producto breve y defendible, sin tablas, endpoints, arquitectura, modelo de datos ni detalles técnicos.

Incluye, en este orden:

## 1. Terreno existente
Resume en 3–5 líneas lo que inspeccionaste al inicio: capacidades ya construidas y estado actual del producto.

## 2. Interrogatorio
Incluye las cinco preguntas que hiciste y una síntesis breve de las respuestas basadas exclusivamente en la ficha de hechos. Conserva los supuestos aceptados S1, S3 y S4. S2 fue rechazado: no inventes que el responsable puede estar vacío.

## 3. Alcance del MVP
Organízalo exactamente en estos cinco bloques:
- Problema
- Usuarios
- Propuesta de valor
- Alcance
- NO-alcance

En Alcance deben quedar exactamente estas 4 capabilities después de mi recorte humano:
1. Lista compartida de tareas con título, responsable, estado y fecha de vencimiento, distinguiendo lo vencido.
2. Crear y editar una tarea en segundos usando esos cuatro datos y sin flujos de configuración.
3. Cambiar el estado desde la propia lista usando los estados pendiente, en curso y hecha.
4. Lista siempre al día sin recargar, mostrando los cambios de estado realizados por otras personas.

"Filtrar la lista por estado" debe pasar al NO-alcance porque no es necesario para validar la hipótesis principal.

El NO-alcance debe ser agresivo y ocupar al menos tanto espacio como el alcance. Conserva las exclusiones justificadas que propusiste anteriormente y añade el filtro por estado como exclusión. Cada exclusión debe explicar por qué no ayuda a validar la hipótesis principal.

Después añade una sección:

## Parte B — tres líneas

Debe contener exactamente tres puntos:

1. IA propuso: 5 capabilities. Después de mi recorte humano: 4 capabilities.

2. Escoge tres exclusiones concretas y exprésalas usando exactamente el patrón:
"X fuera, porque no ayuda a validar que..."
No uses "no da tiempo" como justificación.

3. La exclusión de la que menos seguro estoy es "filtrar la lista por estado". Explica brevemente qué tendría que ocurrir durante el uso real para justificar que entrara después: que sin el filtro las personas no puedan localizar con suficiente rapidez el trabajo pendiente/en curso y eso impida usar la lista como sustituto de la ronda de estado.

Para prompts.md:

- Conserva la plantilla existente si la hay.
- Registra TODOS los prompts de esta sesión de ejercicio exactamente como fueron enviados, sin reconstruirlos ni resumirlos.
- Usa el historial de esta conversación de Claude Code para copiar literalmente los Prompts 1, 2, 3 y 4 que recibiste.
- Incluye también ESTE mensaje completo y literal como Prompt 5.
- Para cada uno indica:
  - Tool: Claude Code 2.1.280
  - Model: Opus 5.5
- Añade una nota breve de incidencia de herramienta indicando que el MCP de Atlassian estaba configurado pero la autenticación no pudo completarse porque la cuenta no mostraba ningún sitio Jira/Confluence compatible. No inventes que Jira funcionó ni que se crearon tickets.

Antes de terminar verifica que:
- sólo hayas modificado docs/prd/alcance-mvp-jfc.md y prompts.md;
- el documento no contenga tablas, endpoints ni arquitectura;
- el recorte final sea 5 → 4;
- prompts.md contenga los prompts literales de la sesión.

Haz los cambios ahora.
```
