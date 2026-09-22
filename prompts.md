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

**Modelo:** Sonnet 5 Medium
**Herramienta:** Claude Code

Dame las capacidades y el modelo de datos actual de este proyecto

**Qué salió:** Devolvio un listado extensivo del proyecto 

## Prompt 2

**Modelo:** Sonnet 5 Medium
**Herramienta:** Claude Code

Dame las capacidades y el modelo de datos actual de este proyecto en 3 a 5 lineas

**Qué salió:** Devolvio un resumen actual del proyecto en capacidades y modelos de datos

## Prompt 3

**Modelo:** Sonnet 5 Medium
**Herramienta:** Claude Code
«Quiero que FlowSync sea una herramienta para que los equipos remotos sepan en qué está trabajando cada uno sin tener que hacer reuniones de sincronización. Algo tipo tareas compartidas pero más en tiempo real y menos rollo que Jira.»

Antes de proponer nada, hazme las 5 preguntas que más reducirían la incertidumbre sobre el problema, los usuarios y el alcance. Una sola ronda. No bajes al modelo de datos ni a los endpoints.

**Qué salió:** Devolvio estas 5 preguntas:

¿Quién es el usuario que abre FlowSync cada día y qué decisión toma al verlo? ¿Un IC que solo quiere que los demás vean su estado, o un lead que necesita una vista agregada del equipo para decidir si hace falta intervenir?

¿Qué información sustituye realmente al daily/reunión de sync? ¿Basta con "en qué tarea estoy" y su estado, o hace falta también bloqueos, próximos pasos, o disponibilidad/humor del día?

¿"Tiempo real" significa que alguien lo actualiza activamente (push manual) o que se infiere de otra herramienta (commits, calendario, Slack) sin que el usuario tenga que teclear nada? Esto define si el dolor que resuelves es "falta de visibilidad" o "carga de actualizar cosas manualmente".

¿Qué tamaño y tipo de equipo remoto tienes en mente como primer cliente real? (2-8 personas de un mismo squad vs. una org de 50+ con varios equipos) — cambia si el problema es coordinación fina o reporting.

¿Qué se considera éxito a las 2-4 semanas de usarlo? ¿Que dejen de hacer el daily y confíen en la herramienta, que reduzcan mensajes tipo "¿en qué andas?", o algo medible como tiempo ahorrado/reuniones canceladas?

Todas las preguntas acorde al listado facilitado y validas en lo referido al problema

## Prompt 4

**Modelo:** Sonnet 5 Medium
**Herramienta:** Claude Code

¿Quién es el usuario que abre FlowSync cada día y qué decisión toma al verlo? ¿Un IC que solo quiere que los demás vean su estado, o un lead que necesita una vista agregada del equipo para decidir si hace falta intervenir?
¿Qué información sustituye realmente al daily/reunión de sync? ¿Basta con "en qué tarea estoy" y su estado, o hace falta también bloqueos, próximos pasos, o disponibilidad/humor del día?

¿"Tiempo real" significa que alguien lo actualiza activamente (push manual) o que se infiere de otra herramienta (commits, calendario, Slack) sin que el usuario tenga que teclear nada? Esto define si el dolor que resuelves es "falta de visibilidad" o "carga de actualizar cosas manualmente".
¿Qué tamaño y tipo de equipo remoto tienes en mente como primer cliente real? (2-8 personas de un mismo squad vs. una org de 50+ con varios equipos) — cambia si el problema es coordinación fina o reporting.
¿Qué se considera éxito a las 2-4 semanas de usarlo? ¿Que dejen de hacer el daily y confíen en la herramienta, que reduzcan mensajes tipo "¿en qué andas?", o algo medible como tiempo ahorrado/reuniones canceladas?

Qué duele hoy: la daily de sincronización y el "¿en qué estás?" constante por Slack/chat. Nadie ve el estado del equipo sin interrumpir a alguien. — Quién cobra el valor: los pares, no un lead. — Episodio: dos personas tocaron el mismo módulo la misma semana sin saberlo, dos días perdidos. — Qué reunión desaparece: solo la ronda de "¿en qué estás?", no la daily entera. — Usuarios: equipos remotos pequeños, 3-10 personas, roles planos. — Primer usuario: equipo de 6, producto SaaS, 3 husos horarios, caso de estudio. — Fronteras: un espacio único compartido, sin entidad "equipo"; varios equipos queda fuera, se anota como supuesto. — "Tiempo real" = ver cambios de estado sin refrescar ni preguntar; NO es chat, NO es videollamada, NO es colaboración simultánea. — Es frescura de la TAREA, no presencia de la persona: nada de "quién está conectado". — Forma de la señal: resumen que espera, no aviso que interrumpe; sin notificaciones push. — Qué decisión cambia: no empezar algo que otro ya toca, elegir lo siguiente sabiendo qué está libre. — De dónde sale el estado: lo teclea la persona, en segundos; derivarlo de Git/CI/calendario queda fuera. — Por qué se sostiene: dos clics sobre una lista ya abierta, sin campos obligatorios; quien lo escribe cobra en el momento (es su propia cola de trabajo). — Riesgo #1: que la info se quede vieja; mitigación, que actualizar cueste dos clics. — Sustituye al gestor de tareas, no convive con él. — Renuncia a sprints, estimaciones, épicas, backlog priorizado, informes. — "Menos rollo que Jira" = crear tarea y cambiar estado en segundos, sin flujos ni campos obligatorios. — Campos de una tarea: título, responsable, estado, fecha de vencimiento. — Se consume filtrando por estado. — Éxito: dejar de hacer la ronda de "¿en qué estás?" porque el estado se ve de un vistazo. — Criterio a una semana: que cancelen esa ronda y nadie pida que vuelva. — Cuánto construir: una vertical fina de punta a punta, no andamiaje amplio.

Fuera del MVP: notificaciones push, integración con Slack, roles/permisos avanzados, analítica/reporting, comentarios en tareas.

Con esto, no hagas más preguntas, pasa directamente al alcance en 5 bloques

**Qué salió:** Devolvio este alcance en 5 bloques:

Alcance MVP — FlowSync
1. Problema y quién cobra el valor
Equipos remotos de 3-10 personas, roles planos, pierden tiempo preguntando "¿en qué estás?" y chocan por trabajar sin saberlo sobre lo mismo. El valor lo cobra cada par al ver el estado de los demás sin interrumpir, no un lead que reporta hacia arriba.

2. Unidad central: la Tarea
Una tarea tiene título, responsable, estado y fecha de vencimiento — nada más. Vive en un espacio único compartido por todo el equipo (sin entidad "equipo" separada, sin proyectos, sin backlog priorizado). Se actualiza en segundos, sin campos obligatorios ni flujos de aprobación.

3. Capacidades incluidas (vertical fina, de punta a punta)

Crear, editar y cambiar el estado de una tarea (2 clics, sin fricción).
Ver el estado de todo el equipo de un vistazo, filtrando por estado.
Autenticación básica (ya existe: signup/login/logout/perfil). Eso es todo el flujo — sin nada adicional que no sirva directamente a "ver en qué está cada uno".
4. Fuera de alcance (explícito)
Sprints, estimaciones, épicas, backlog priorizado, comentarios en tareas, notificaciones push, integración con Slack/Git/calendario, roles y permisos avanzados, analítica/reporting, múltiples equipos/espacios, presencia de persona ("quién está conectado").

5. Criterio de éxito
A una semana de uso: el equipo cancela la ronda de "¿en qué estás?" del daily y nadie pide que vuelva. Se valida con el equipo piloto de 6 personas (SaaS, 3 husos horarios) como caso de estudio.
