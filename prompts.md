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

**Modelo:** Opus 5.5 (1M), esfuerzo medium
**Herramienta:** Claude Code CLI

```
Antes de especificar nada, quiero saber qué hay construido en este proyecto.

Recorre el repositorio y devuélveme dos cosas:

1. Las capabilities que YA están construidas y funcionando, en lenguaje de producto
   (qué puede hacer hoy un usuario), no en lenguaje técnico.
2. El modelo de datos actual: qué entidades existen y qué relación tienen entre ellas.

Reglas:
- No propongas nada, no sugieras mejoras y no escribas código.
- Si algo parece a medias o solo esbozado, dilo explícitamente en vez de darlo por hecho.
- Máximo 10 líneas en total.
```

**Qué salió:** 
 Ran 2 shell commands

Capabilities que ya funcionan (solo gestión de cuenta):
1. Un usuario se registra c completo (el nombre es

Capabilities que ya funcionan (solo gestión de cuenta):
1. Un usuario se registra c completo (el nombre es. El email no se puede repetir.
2. Inicia sesión con email y contraseña, y la sesión sigue abierta al recargar el navegador.
3. Ve su perfil: iniciales, nombre (o "Sin nombre"), email y "Miembro desde".
4. Cierra sesión.
5. No existe nada de gestión de tareas ni de equipos: ni en la API, ni en las pantallas, ni en la base de datos. Solo aparece en la descripción del proyecto y en el borrador sin versionar docs/prd/alcance-mvp-jmm.md.
6. Sin construir: no se puerar la contraseña, y no haytests escritos.

Modelo de datos:
7. User: id, full_name (opcional), email (único), password (hasheada), created_at y updated_at.
8. AccessToken (auth_access_tokens): las sesiones de login, cada una con tipo, hash, permisos, último uso y caducidad.
9. Relación: un User tiene  tokenable_id → users.id). No hay más entidades.


---

## Prompt 2

**Modelo:** Opus 5 (1M)
**Herramienta:** Claude Code CLI

```
Vamos a definir el alcance del MVP de FlowSync a partir de este encargo, que viene
tal cual me lo han dado:

«Quiero que FlowSync sea una herramienta para que los equipos remotos sepan en qué está
trabajando cada uno sin tener que hacer reuniones de sincronización. Algo tipo tareas
compartidas pero más en tiempo real y menos rollo que Jira.»

Antes de proponer nada, pregunta. Hazme las 5 preguntas que más reducirían tu
incertidumbre sobre el problema, los usuarios y el alcance.

Reglas, y son estrictas:
- UNA SOLA RONDA de preguntas. Exactamente 5, numeradas. Nada más.
- Prohibido preguntar por el modelo de datos, por entidades, por endpoints o por
  cualquier cosa técnica. Solo producto.
- No propongas soluciones, ni features, ni alcance todavía. Solo las preguntas.
---

## Prompt 3

**Modelo:** Opus 5 (1M)
**Herramienta:** Claude Code CLI

```
Estas son las respuestas, ya decididas. Son hechos del producto, no opiniones a debatir:

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
Y lo que ya está decidido que queda fuera del MVP, por si la IA empuja funcionalidades:

- Fuera del MVP: notificaciones push, integración con Slack, roles/permisos avanzados, analítica/reporting, comentarios en tareas.

Si algo que preguntaste no queda cubierto por esta ficha, decídelo tú y márcalo
explícitamente como SUPUESTO, en una lista aparte al final. No me vuelvas a preguntar.

Devuélveme solo dos cosas:
1. Un resumen de una línea por pregunta, con la respuesta que has tomado.
2. La lista de supuestos que has tenido que declarar.
```

**Qué salió:**
1. Respuestas tomadas, una línea por pregunta

1. Usuario y tamaño: equipos remotos pequeños (3–10 personas) con roles planos; el caso de estudio es un equipo SaaS de 6 personas en 3 husos horarios. Los que cobran el valor son los compañeros, no un lead.
2. Qué duele: la ronda de "¿en qué estás?" (media daily más las interrupciones por chat) y el trabajo duplicado que se descubre tarde. FlowSync debe responder de un vistazo quién está en qué y qué queda libre.
3. "Tiempo real": ver los cambios de estado de las tareas sin refrescar ni preguntar, en forma de resumen que do es de la tarea, nunca dela persona: sin presencia, sin chat y sin push.
4. "Rollo de Jira" y lo mínimo: crear una tarea y cambiarle el estado en segundos,
   sin configurar flujos niprints, estimaciones, épicas, Un equipo que necesite eso no es nuestro usuario.
  - "Menos rollo que Jira" = crear una tarea y cambiarle el estado en segundos, sin flujos de configuración ni campos obligatorios. Lo mínimo para saber quién está en
  qué.
 usuario: dejar de hacer la ronda de "¿en qué estás?" de la daily porque el estado del equipo se ve de un vistazo.
  - Criterio a una semana de uso real: que el equipo cancele esa ronda y nadie pida que vuelva. Si la siguen haciendo igual, no funcionó.
  - Cuánto construir: una vertical fina y usable de punta a punta, no el andamiaje amplio de un producto. Prefiero una capability terminada a tres a medias.
  Y lo que ya está decidido que queda fuera del MVP, por si la IA empuja funcionalidades:

  - Fuera del MVP: notificaciones push, integración con Slack, roles/permisos avanzados, analítica/reporting, comentarios en tareas.

  Si algo que preguntaste no , decídelo tú y márcalo
como SUPUESTO, en una lista aparte al final. No me vuelvas a preguntar.

  Devuélveme solo dos cosas:
  1. Un resumen de una línea por pregunta, con la respuesta que has tomado.
  2. La lista de supuestos que has tenido que declarar.

1. Respuestas tomadas, una línea por pregunta

1. Usuario y tamaño: equipos remotos pequeños (3–10 personas) con roles planos; el caso de estudio es un equipo SaaS de 6 personas en 3 husos horarios. Los que
   cobran el valor son los
2. Qué duele: la ronda de "¿en qué estás?" (media daily más las interrupciones por chat) y el trabajo duplicado que se descubre tarde. FlowSync debe responder de un vistazo quién está en qué y qué queda libre.
3. "Tiempo real": ver los cambios de estado de las tareas sin refrescar ni preguntar, en forma de resumen que espera y no de aviso. El estado es de la tarea, nunca de
   la persona: sin presenci
4. "Rollo de Jira" y lo mínimo: crear una tarea y cambiarle el estado en segundos, sin configurar flujos ni campos obligatorios, y sin sprints, estimaciones, épicas,
   backlog ni informes. Unable, estado y vencimiento, y la lista se filtra por estado.
5. Éxito y límites: tras una semana de uso real, el equipo cancela la ronda de "¿en
   qué estás?" y nadie pide vertical fina de punta apunta; el resto está fuera (push, Slack, permisos, analítica, comentarios, integraciones, varios equipos, bloqueos).

2. Supuestos declarados

- SUPUESTO — adopción: la decide el propio equipo, sin comprador ni aprobación de un responsable.
- SUPUESTO — plazo: no hay ímite de tamaño lo marca la"vertical fina", no el calendario.                                          SUPUESTO — pertenencia: ten el único espaciocompartido, sin invitaciones ni aprobación. Consecuencia: el MVP solo vale para una instancia por equipo.
- SUPUESTO — estados: tres estados fijos y no configurables: Pendiente, En curso y Hecha. Toda tarea nueva nace en Pendiente.                                  SUPUESTO — campos obligat "sin campos obligatorios" yque la tarea tiene cuatro datos. Lo resuelvo así: solo el título es obligatorio; responsable y fecha son opcionales, y una tarea sin responsable se lee como "libre".
- SUPUESTO — responsable: una tarea tiene como mucho un responsable, y cualquiera puede asignársela o reasignarla (roles planos).
- SUPUESTO — "qué se ha mova tarea cuándo cambió porúltima vez, pero no hay un "novedades desde tu última visita" personalizado por
  usuario.
- SUPUESTO — edición: cualquier miembro puede editar y borrar cualquier tarea, sin historial de cambios.
- SUPUESTO — medición del éxito: el criterio se comprueba de forma cualitativa con el equipo piloto, sin instrumentar métricas en el producto (la analítica está fuera).
- SUPUESTO — plataforma e iitorio, solo en castellano ysin versión móvil específica.

✻ Sautéed for 18s · done 19:55

## Prompt 4

**Modelo:** Opus 5.5 (1M), esfuerzo medium
**Herramienta:** Claude Code CLI

```
Estas son las respuestas, ya decididas. Son hechos del producto, no opiniones a debatir:

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
Y lo que ya está decidido que queda fuera del MVP, por si la IA empuja funcionalidades:

- Fuera del MVP: notificaciones push, integración con Slack, roles/permisos avanzados, analítica/reporting, comentarios en tareas.

Si algo que preguntaste no queda cubierto por esta ficha, decídelo tú y márcalo
explícitamente como SUPUESTO, en una lista aparte al final. No me vuelvas a preguntar.

Devuélveme solo dos cosas:
1. Un resumen de una línea por pregunta, con la respuesta que has tomado.
2. La lista de supuestos que has tenido que declarar.
```

**Qué salió:** bien. Resumió una línea por pregunta y declaró 10 supuestos, que era lo que
interesaba. Uno de ellos («qué se ha movido»: sin novedades desde la última visita) dejaba
fuera el caso de uso que la propia ficha describe como central; lo detecté al leerlos y
acabó argumentado en el NO-alcance.

---

**Qué salió:** 
1. ¿Quién es el usuario principal y qué tamaño tiene su equipo? Por ejemplo, un equipo de producto o desarrollo de 5 a 10 personas repartidas en distintas zonas horarias, o equipos más grandes y de otros perfiles. ¿Quién decide adoptar la herramienta: el propio equipo o su responsable?
2. ¿Qué duele hoy exactamente de las reuniones de sincronización, y para quién? ¿Es el tiempo que se pierde, la información que llega tarde, los bloqueos que nadie ve o la necesidad del responsable de saber cómo va todo? ¿Qué pregunta concreta debería responder FlowSync con solo abrirlo?
3. ¿Qué quiere decir "más en tiempo real"? ¿Ver al instante el cambio de otra persona, que el estado de cada uno se actualice solo, o simplemente información siempre al día sin tener que preguntar? ¿Y qué actividad hay que reflejar: tareas formales o también "ahora mismo estoy con X"?
4. ¿Qué partes concretas de Jira son el "rollo" que hay que evitar? ¿Los flujos configurables, la cantidad de campos, las estimaciones y los sprints, la jerarquía de épicas, los permisos? ¿Y qué es lo mínimo imprescindible que tiene que seguir haciendo una herramienta de tareas compartidas?
5. ¿Cómo sabremos que el MVP funciona, y con qué límites se entrega? ¿Qué resultado lo daría por válido, por ejemplo cancelar la reunión diaria o que lo usen a diario X equipos? ¿Hay fecha, un equipo piloto o algo que ya se haya decidido dejar fuera?

✻ Baked for 8s · done 19:46

## Prompt 5

**Modelo:** Opus 5 (1M)
**Herramienta:** Claude Code CLI

```
Ahora escribe el alcance del MVP en el archivo docs/prd/alcance-mvp-jmm.md, en los
huecos que ya tiene preparados. No lo escribas en el chat.

Cinco bloques, en este orden: problema, usuarios, propuesta de valor, alcance y
NO-alcance.

Cómo quiero que lo hagas:
- Sé AGRESIVO recortando. Prefiero una vertical fina y terminada a tres a medias.
- NUMERA cada elemento del alcance y cada elemento del no-alcance.
- Cada exclusión lleva su porqué al lado, en la forma «esto fuera, porque no ayuda a
  validar que...». No vale «no da tiempo»: eso es calendario, no producto.
- El NO-alcance tiene que ocupar tanto como el alcance, o más.

Lo que NO puede aparecer, y es lo que más me importa:
- Ni una tabla de base de datos, ni un endpoint, ni nombres de campo, ni arquitectura,
  ni casos de uso, ni requisitos numerados tipo RF-1. Esto es un documento de producto:
  dice QUÉ y POR QUÉ, no CÓMO.
- Si sientes la necesidad de añadir algo de eso, no lo añadas: dímelo al final, aparte.

Tiene que caber en una pantalla larga.
```

**Qué salió:**

1. Respuestas tomadas, una línea por pregunta

1. Usuario y tamaño: equipos remotos pequeños (3–10 personas) con roles planos; el caso de estudio es un equipo SaaS de 6 personas en 3 husos horarios. Los que cobran el valor son los compañeros, no un lead.
2. Qué duele: la ronda de "¿en qué estás?" (media daily más las interrupciones por chat) y el trabajo duplicado que se descubre tarde. FlowSync debe responder de un vistazo quién está en qué y qué queda libre.
3. "Tiempo real": ver los cambios de estado de las tareas sin refrescar ni preguntar, en forma de resumen que espera y no de aviso. El estado es de la tarea, nunca de la persona: sin presencia, sin chat y sin push.
4. "Rollo de Jira" y lo mínimo: crear una tarea y cambiarle el estado en segundos, sin configurar flujos ni campos obligatorios, y sin sprints, estimaciones, épicas, backlog ni informes. Una tarea tiene título, responsable, estado y vencimiento, y la lista se filtra por estado.
5. Éxito y límites: tras una semana de uso real, el equipo cancela la ronda de "¿en qué estás?" y nadie pide que vuelva. Se construye una vertical fina de punta a punta; el resto está fuera (push, Slack, permisos, analítica, comentarios, integraciones, varios equipos, bloqueos).

2. Supuestos declarados

- SUPUESTO — adopción: la decide el propio equipo, sin comprador ni aprobación de un responsable.
- SUPUESTO — plazo: no hay fecha de entrega fijada; el límite de tamaño lo marca la "vertical fina", no el calendario.
- SUPUESTO — pertenencia: todo el que se registra entra en el único espacio compartido, sin invitaciones ni aprobación. Consecuencia: el MVP solo vale para una instancia por equipo.
- SUPUESTO — estados: tres estados fijos y no configurables: Pendiente, En curso y Hecha. Toda tarea nueva nace en Pendiente.
- SUPUESTO — campos obligatorios: la ficha dice a la vez "sin campos obligatorios" y que la tarea tiene cuatro datos. Lo resuelvo así: solo el título es obligatorio; responsable y fecha son opcionales, y una tarea sin responsable se lee como "libre".
- SUPUESTO — responsable: una tarea tiene como mucho un responsable, y cualquiera puede asignársela o reasignarla (roles planos).
- SUPUESTO — "qué se ha movido": la lista muestra en cada tarea cuándo cambió por última vez, pero no hay un "novedades desde tu última visita" personalizado por usuario.
- SUPUESTO — edición: cualquier miembro puede editar y borrar cualquier tarea, sin historial de cambios.
- SUPUESTO — medición del éxito: el criterio se comprueba de forma cualitativa con el equipo piloto, sin instrumentar métricas en el producto (la analítica está fuera).
- SUPUESTO — plataforma e idioma: aplicación web de escritorio, solo en castellano y sin versión móvil específica.

✻ Sautéed for 18s · done 19:55

> Ahora escribe el alcance del MVP en el archivo docs/prd/alcance-mvp-jmm.md, en los
  huecos que ya tiene preparados. No lo escribas en el chat.

  Cinco bloques, en este orden: problema, usuarios, propuesta de valor, alcance y
  NO-alcance.

  Cómo quiero que lo hagas:
  - Sé AGRESIVO recortando. Prefiero una vertical fina y termina
  - El NO-alcance tiene que ocupar tanto como el alcance, o más.

  Lo que NO puede aparecer, y es lo que más me importa:
  - Ni una tabla de base de datos, ni un endpoint, ni nombres de
    ni casos de uso, ni requisitos numerados tipo RF-1. Esto es un documento de producto:
    dice QUÉ y POR QUÉ, no CÓMO.
  - Si sientes la necesidad de añadir algo de eso, no lo añadas: dímelo al final, aparte.

  Tiene que caber en una pantalla larga.

  Read 1 file

● Update(~\Documents\Lidr_IA4Devs\flowsync-m2\docs\prd\alcance-mvp-jmm.md)
Added 65 lines, removed 6 lines

### Problema

En un equipo remoto nadie ve en qué está cada uno sin interrumpir a alguien. Se paga dos
veces: la mitad de la daily se va en la ronda de «¿en qué estás?», y el resto del día en
preguntas por chat. Cuando falla, falla caro: dos per la
misma semana sin saberlo y se perdieron dos días. La  es un
problema real, pero es otro: este MVP no la ataca.

### Usuarios

Equipos remotos pequeños (3–10 personas), sin jerarquía: todos ven y tocan lo mismo. El
valor lo cobran los propios compañeros, no un responsable; aquí no hay reporte hacia
arriba. Caso de estudio (no es un cliente): un equipo de producto SaaS de 6 personas,
repartido en 3 husos horarios, con un gestor de tareas pesado y una daily de 15 minutos.

### Propuesta de valor

Una lista de tareas compartida, que es a la vez la cola de trabajo de cada uno y el
estado del equipo, siempre al día sin preguntar. Quien actualiza cobra en el momento:
decide qué coge sobre esa lista y deja de recibir interrupciones. Sustituye al gestor de
tareas, no convive con él.

Hipótesis a validar:
- **H1 (riesgo #1).** Si actualizar cuesta dos clics,al día
  sin que nadie la obligue.
- **H2.** Con el estado del equipo visible de un vistazo, el equipo cancela la ronda de
  «¿en qué estás?» y nadie pide que vuelva (se mide tras una semana de uso real).

### Alcance

<!-- Lo que SÍ entra. Después del recorte, el tuyo, no el suyo. -->
1. Crear una tarea escribiendo solo qué hay que hacer. Quién la lleva y para cuándo son
   opcionales, y una tarea sin nadie asignado se lee como «libre».
2. Cambiar el estado de una tarea (pendiente, en curso, hecha) y quién la lleva desde la
   propia lista, en dos clics.
3. Ver una única lista compartida con quién está en qué, qué está libre, qué se ha pasado
   de plazo y cuándo se movió cada tarea por última vez.
4. Ver los cambios de los demás aparecer en esa lista
5. Filtrar la lista por estado para centrarse en lo pendiente.

-
Se apoya en lo ya construido (registro, acceso y cierre de sesión). Todo el que tenga
cuenta forma parte del único espacio compartido.

### NO-alcance

<!-- Debe ocupar tanto como el "Alcance" o más. Cada do,
     en la forma: "<cosa> fuera, porque no ayuda a validar que <hipótesis>". -->
1. Notificaciones push y avisos: fuera, porque no ayudan a validar H2. La señal es un
   resumen que espera, no algo que interrumpe.
2. Integración con Slack o chat: fuera, porque no ayuda a validar H2. Además devuelve la
   conversación al sitio del que queremos sacar las preguntas.
3. Derivar el estado de Git, PRs, CI o calendario: fur H1 (y
   la invalida). La hipótesis es que la persona teclea su estado; esto sería otro producto.
4. Presencia, «quién está conectado» e indicadores deayudan a
   validar ni H1 ni H2. El estado es de la tarea, no de la persona, y lo otro es vigilancia.
5. Comentarios y conversación dentro de la tarea: fuera, porque no ayudan a validar que el
   estado se mantenga al día. Se convierten en otro canal de «¿cómo va?».
6. Sprints, estimaciones, épicas y backlog priorizado: fuera, porque no ayudan a validar
   H1, que depende de no tener que decidir nada de esto. Quien lo necesite no es el usuario.
7. Informes y analítica: fuera, porque no ayudan a va
   compañeros, no hacia arriba. El éxito se comprueba hablando con el equipo piloto.
8. Roles y permisos: fuera, porque no ayudan a validar H1 ni H2 en un equipo plano.
9. Varios equipos, varios espacios o gente en más de a validar
   H2, que se prueba dentro de un único equipo.
10. Estados o flujos configurables: fuera, porque no ayudan a validar H1. Tres estados
    fijos son precisamente el «menos rollo».
11. Descripción larga, etiquetas, adjuntos, subtareaso ayudan
    a validar que se sepa quién está en qué. Cada campo más resta velocidad y va contra H1.
12. Editar el texto y borrar tareas: fuera, porque no ayudan a validar H1 ni H2. Una tarea
    equivocada se marca como hecha.
13. Varios responsables por tarea: fuera, porque no ayudan a validar H2. «Quién está en
    qué» necesita una respuesta, no una lista.
14. «Novedades desde tu última visita» personalizadas: fuera, porque no ayudan a validar
    H2 más de lo que ya hace ver cuándo se movió cada tarea.
15. Marcar y gestionar bloqueos: fuera, porque no ayudan a validar H2. La parte de
    bloqueos de la daily se queda como está, a propósito.
16. Importar tareas de otro gestor: fuera, porque no ayuda a validar H1 ni H2, que se
    prueban empezando de cero. Convivir o migrar es otro problema.
17. Aplicación móvil y otros idiomas: fuera, porque no es
    «llego o vuelvo de una reunión y miro la lista» en web.

-

---

## Parte B — las tres líneas

I wrote the five blocks into docs/prd/alcance-mvp-jmm.md, under section 3. Scope has 5 items and NO-scope has 17, each with its reason.

What I held back, kept here as you asked:
- Real-time mechanism: how the list updates without refreshing (push from the server vs. polling). The doc only promises what the user sees.
- "Last changed" per task: item 3 promises it, and today no task records it. That belongs in the data model, so it isn't in the doc.
- Edge-case rules: what happens to a task whose assignee delet "overdue" counts days or hours. Both are use-case detail.
- Access to the shared space: anyone who registers joins it. I left it as a single product line and didn't specify how access to that space is protected.

Two decisions in the doc that go against assumptions I stated in the previous turn:
- Editing and deleting: I had assumed anyone could edit and delete any task. For the cut I moved both to NO-scope (item 12), and a mistaken task just gets marked done.
- Required fields: only the task text is required. That settles the clash between "no required fields" and "a task has four pieces of data".

Per CLAUDE.md I haven't committed or opened a PR yet, because the exercise isn't closed: Parte B and Hallazgos are still empty.

✻ Brewed for 45s · done 19:57

## Prompt 6

**Modelo:** Opus 5 (1M)
**Herramienta:** Claude Code CLI

```
Relee el documento entero que acabas de escribir y responde, sin reescribirlo:

1. ¿Qué supuestos has dado por ciertos sin evidencia ni en la ficha ni en el código?
2. ¿Dónde se ha colado alcance que no está justificado por el problema?
3. ¿Hay alguna incoherencia interna? Es decir: ¿el documento pide en algún sitio algo
   que él mismo prohíbe en otro, o promete algo que su propio alcance impide cumplir?

Solo la lista. No toques el archivo.
