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
Revisa el repo (backend y frontend) y resume en 3-5 líneas: qué capabilities hay ya construidas y cómo es el modelo de datos actual. Organízalo en tablas o bullets si ayuda a la claridad, pero el resumen en sí debe ser corto.
```

**Qué salió:** funcionó a la primera. Hallazgo: no hay ninguna capability de tareas construida, solo auth (signup/login/logout/perfil) y las tablas `users` y `access_tokens`.

---

## Prompt 2

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Antes de realizar cualquier propuesta, hazme las 5 preguntas que más reducirán la incertidumbre sobre el problema, los usuarios y el alcance, en una sola ronda (no abras más rondas después de mis respuestas). No bajes al modelo de datos ni a endpoints.
```

**Qué salió:** hizo 5 preguntas (dolor/episodio concreto, quién cobra el valor, qué significa "tiempo real", si la daily desaparece entera, tamaño/forma del equipo objetivo) y se quedó en una sola ronda como se le pidió.

---

## Prompt 3

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
```

**Qué salió:** las 5 preguntas quedaron cubiertas por la ficha sin ningún supuesto necesario.

---

## Prompt 4

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Propon el alcance en 5 bloques (problema, usuarios, propusta de valor, alcance y el no-alcance (fuera del scope)), se agresiva y recorta  y justifica cada exclusion.
```

**Qué salió:** propuso 10 ítems dentro del alcance y 11 exclusiones justificadas. No bajó a modelo de datos ni a endpoints. Pendiente el recorte del autor.

---

## Prompt 5

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
consulta el alcance-mvp-acr.md es el PRD o q viene siendo?
```

**Qué salió:** aclaró que el archivo es el documento de alcance/recorte del MVP, no el PRD completo (que llevaría requisitos numerados y métricas, y se construye después en el módulo).

---

## Prompt 6

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
veo detalles tecnicos de endpoitns y tablas en terreno q ya existe, esto esta ok?
```

**Qué salió:** confirmó que sí está bien: la prohibición de detalle técnico aplica a la propuesta de alcance nuevo, no al inventario de lo que ya existe.

---

## Prompt 7

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Borrar el titulo y editar la tarea no enceuntro q estuviera especificado, de donde lo tomaste?
```

**Qué salió:** admitió que "editar" y "borrar" tarea fueron inferencia propia (completitud de CRUD), sin base en la ficha de hechos. Primer ítem de sobre-propuesta detectado por el autor.

---

## Prompt 8

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
revisemos lo del responsable de la tarea el cambio del punto 8, no lo encontre en el prompt de producto
```

**Qué salió:** confirmó que "reasignar responsable" tampoco tiene base en la ficha; mismo patrón de sobre-propuesta. Van 3 ítems sin respaldo.

---

## Prompt 9

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
SOlo para validar el punto 7 si se ve reflejado o no en lo de producto?
```

**Qué salió:** confirmó que el punto 7 sí está respaldado (cita literal de la ficha sobre "tiempo real"), pero señaló una ambigüedad interna en la ficha entre actualización en vivo vs. al recargar.

---

## Prompt 10

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
entonces creeeria q los unicos puintos son los 3 de los q hablamos y esos son los q deberiamos eliminar
```

**Qué salió:** confirmó el criterio de recorte (todo lo que tenía respaldo en la ficha se queda, lo que no, se cae) y dejó pendiente la decisión sobre el punto 7.

---

## Prompt 11

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Muestrame la version barata
```

**Qué salió:** mostró la redacción propuesta para el punto 7 (versión "al recargar") más el supuesto declarado y una versión lista para usar en la Parte B #3.

---

## Prompt 12

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
dejemos esta redaccion para la parte A y con lo fuera del scope q ya hablamos y asi cerramos la parte A
```

**Qué salió:** cierre de la Parte A con la redacción del punto 7 y las 3 exclusiones acordadas.

---

## Prompt 13

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Espera lo q mencionas del webhook no es muy tecnico?
```

**Qué salió:** confirmó que la respuesta anterior había nombrado una tecnología concreta (no "webhook", que fue lo que preguntó el autor) al describir el punto 7, y lo reescribió describiendo el comportamiento en vez de nombrar cualquier mecanismo. Segundo hallazgo de sobre-especificación técnica detectado por el autor.

---

## Prompt 14

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Si aplica los ajustes al punto 2 de la parte B
```

**Qué salió:** recortó el punto 2 de la Parte B, que repetía palabra por palabra las justificaciones ya escritas en el NO-alcance (#12-14), a una sola línea que remite ahí en vez de duplicarlas.

---

## Prompt 15

**Modelo:** Sonnet 5
**Herramienta:** Claude Code

```
Si hagamos todo y la descripcion del PR
```

**Qué salió:** aplicó los 3 ajustes que salieron de la revisión adversarial del PR #39: reetiquetó las 3 exclusiones mal atribuidas a la ficha, reagrupó el ítem #15 fuera de "recortadas por el autor", ajustó la frase de Propuesta de valor que contradecía el punto 7, y corrigió la mención de "WebSockets/polling" en el documento y en la descripción del PR.
