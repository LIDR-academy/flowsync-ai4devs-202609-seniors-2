Parte A

## Tramo 1 — El terreno que ya existe

Capacidades: solo autenticación/cuenta — signup, login, logout y consulta de perfil (/api/v1/auth/*, /api/v1/account/*), con tokens opacos (guard api) y 3 pantallas en el frontend (login, registro, perfil). Aún no hay tareas, proyectos ni equipos.

Modelo de datos: dos tablas SQLite — users (id, full_name, email único, password hasheado, timestamps) y auth_access_tokens (FK a users, hash, abilities, expiración) — sin relaciones de dominio todavía.

## Tramo 2 - El interrogatorio

¿Quién es el usuario que abre FlowSync cada día y qué decisión toma al verlo? ¿Un IC que solo quiere que los demás vean su estado, o un lead que necesita una vista agregada del equipo para decidir si hace falta intervenir?

¿Qué información sustituye realmente al daily/reunión de sync? ¿Basta con "en qué tarea estoy" y su estado, o hace falta también bloqueos, próximos pasos, o disponibilidad/humor del día?

¿"Tiempo real" significa que alguien lo actualiza activamente (push manual) o que se infiere de otra herramienta (commits, calendario, Slack) sin que el usuario tenga que teclear nada? Esto define si el dolor que resuelves es "falta de visibilidad" o "carga de actualizar cosas manualmente".

¿Qué tamaño y tipo de equipo remoto tienes en mente como primer cliente real? (2-8 personas de un mismo squad vs. una org de 50+ con varios equipos) — cambia si el problema es coordinación fina o reporting.

¿Qué se considera éxito a las 2-4 semanas de usarlo? ¿Que dejen de hacer el daily y confíen en la herramienta, que reduzcan mensajes tipo "¿en qué andas?", o algo medible como tiempo ahorrado/reuniones canceladas?

## Tramo 3 - El alcance en 5 bloques

Alcance MVP — FlowSync
1. Problema y quién cobra el valor
Equipos remotos de 3-10 personas, roles planos, pierden tiempo preguntando "¿en qué estás?" y chocan por trabajar sin saberlo sobre lo mismo. El valor lo cobra cada par al ver el estado de los demás sin interrumpir, no un lead que reporta hacia arriba.

2. Unidad central: la Tarea
Una tarea tiene título, responsable, estado y fecha de vencimiento — nada más. Vive en un espacio único compartido por todo el equipo (sin entidad "equipo" separada, sin proyectos, sin backlog priorizado). Se actualiza en segundos, sin campos obligatorios ni flujos de aprobación.

3. Capacidades incluidas (vertical fina, de punta a punta)

Crear, editar y cambiar el estado de una tarea (2 clics, sin fricción).
Ver el estado de todo el equipo de un vistazo.
Autenticación básica (ya existe: signup/login/logout/perfil). Eso es todo el flujo — sin nada adicional que no sirva directamente a "ver en qué está cada uno".

4. Fuera de alcance (explícito)
Sprints, estimaciones, épicas, backlog priorizado, comentarios en tareas, notificaciones push, integración con Slack/Git/calendario, roles y permisos avanzados, analítica/reporting, múltiples equipos/espacios, presencia de persona ("quién está conectado").

5. Criterio de éxito
A una semana de uso: el equipo cancela la ronda de "¿en qué estás?" del daily y nadie pide que vuelva. Se valida con el equipo piloto de 6 personas (SaaS, 3 husos horarios) como caso de estudio.

## Parte B

# Los dos números

4 -> 3

Habia un tema de anális por estado de las tareas e iba a incrementar los tiempos de revisión.

# Tres cosas que deje fuera, y por qué

Presencia de persona ("quién está conectado") — no ayuda a validar que el estado de la tarea sustituye al daily; validaría una hipótesis distinta (vigilancia/disponibilidad) que la ficha rechaza a propósito ("es frescura, no presencia").
Notificaciones push — no ayuda a validar que un resumen que espera basta; meterlas probaría lo contrario, que hace falta interrumpir, y eso contamina el propio experimento que el MVP quiere correr.
Integración con Git/CI/calendario para derivar el estado automáticamente — no ayuda a validar si "cobra en el momento" quien teclea el estado en dos clics; es la hipótesis de otro producto (uno de integraciones y OAuth), no la de este.

# La exclusión de la que menos seguro estás

Filtrar por estado. Es barato (un control de UI, nada de modelo de datos nuevo) y ataca directamente el "ver de un vistazo" que es el corazón del valor — con 6 personas puede que no haga falta, pero si el piloto crece o si al cabo de la semana la gente sigue preguntando "¿quién está libre?" en vez de solo cancelar la ronda del daily, es la señal de que la lista plana no basta. Lo que tendría que pasar para que entrara: que el criterio de éxito se cumpla a medias — cancelan la ronda, pero el ahorro real se demora porque escanear la lista sigue costando tiempo. Ahí lo barato (dos clics de más en la UI) choca con lo que de verdad valida la hipótesis (que basta con verlo, sin filtrar nada).

