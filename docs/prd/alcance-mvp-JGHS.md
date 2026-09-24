# Alcance Prouesto por la IA 

## Problema
Los equipos remotos pierden visibilidad sobre quién está haciendo qué. La información se dispersa entre reuniones, mensajes y herramientas demasiado complejas, por lo que detectar bloqueos y avances requiere coordinación manual.

El MVP se centrará en validar una única hipótesis: si un equipo comparte un tablero mínimo de tareas, puede saber rápidamente en qué está trabajando cada persona sin reunirse para sincronizarse.

## Usuarios
- Equipos remotos pequeños, de aproximadamente 3 a 10 personas.
- Personas que ejecutan y actualizan tareas diariamente.
- Una persona responsable de coordinar el trabajo del equipo.
Quedan fuera los equipos grandes, organizaciones con estructuras jerárquicas complejas y usuarios que necesiten una herramienta de gestión de proyectos corporativa.

Propuesta de valor
FlowSync permite que cada miembro:

Vea las tareas activas del equipo.
Sepa quién tiene asignada cada tarea.
Consulte el estado actual del trabajo.
Cree, asigne y actualice tareas rápidamente.
El valor no será “gestionar todo el proyecto”, sino obtener una visión compartida y actualizada del trabajo sin depender de reuniones de seguimiento.

Alcance del MVP
Autenticación básica

Registro, inicio y cierre de sesión.
Acceso protegido para usuarios autenticados.
Un espacio compartido de trabajo

Un único tablero por equipo.
Sin jerarquía de múltiples espacios, carpetas o proyectos.
Gestión mínima de tareas

Crear una tarea.
Editar su título y descripción.
Asignarla a un miembro del equipo.
Marcarla como pendiente, en curso o completada.
Consultar las tareas por estado y responsable.
Visibilidad del equipo

Ver quién participa en el espacio.
Ver las tareas asignadas a cada persona.
Identificar rápidamente tareas sin asignar o no completadas.
Actualización compartida

Los cambios deben reflejarse al volver a consultar el tablero.
La prioridad es que la información común esté actualizada, no construir colaboración avanzada.

# NO-alcance
Notificaciones por email, push o Slack: fuera, porque no ayudan a validar inicialmente si el tablero permite entender el trabajo sin reuniones; primero hay que comprobar que los usuarios consultan y actualizan el tablero.

Chat, comentarios y menciones: fuera, porque añaden comunicación paralela y pueden convertir el producto en otro canal de mensajes; no son necesarios para validar la visibilidad de las tareas.

Tiempo real mediante websockets: fuera, porque la hipótesis inicial puede validarse con actualización al cargar o refrescar; la sincronización instantánea solo entra si los usuarios necesitan esperar demasiado para ver cambios.

Proyectos, carpetas y múltiples tableros: fuera, porque introducen estructura y navegación antes de demostrar que un único espacio compartido resuelve el problema básico.

Dependencias, subtareas y automatizaciones: fuera, porque aumentan la complejidad del flujo y no son necesarias para saber quién está trabajando en qué.

Etiquetas, filtros avanzados y campos personalizados: fuera, porque son optimizaciones de organización; no prueban por sí mismas que exista mejor coordinación del equipo.

Roles, permisos avanzados y administración empresarial: fuera, porque el usuario objetivo es un equipo pequeño y el MVP no necesita resolver gobernanza organizativa.

Calendario, estimaciones, tiempos registrados y métricas: fuera, porque miden planificación o rendimiento, mientras que el problema inicial es la falta de visibilidad cotidiana.

Integraciones con Jira, GitHub, Google Calendar o similares: fuera, porque podrían ocultar si el valor está en FlowSync o en los sistemas externos; primero debe probarse el flujo independiente.

Aplicación móvil nativa: fuera, porque una interfaz web responsive basta para validar el uso principal y evita mantener dos plataformas.

Funciones de IA: fuera, porque recomendar, resumir o priorizar tareas no es necesario hasta demostrar que los datos introducidos son suficientes y fiables.



## Problema
Los equipos remotos pierden visibilidad sobre quién está haciendo qué. La información se dispersa entre reuniones, mensajes y herramientas demasiado complejas, por lo que detectar bloqueos y avances requiere coordinación manual.

El MVP se centrará en validar una única hipótesis: si un equipo comparte un tablero mínimo de tareas, puede saber rápidamente en qué está trabajando cada persona sin reunirse para sincronizarse.

Usuarios
-Equipos remotos pequeños, de aproximadamente 3 a 10 personas.
-Personas que ejecutan y actualizan tareas diariamente.
-Una persona responsable de coordinar el trabajo del equipo.
Quedan fuera los equipos grandes, organizaciones con estructuras jerárquicas complejas y usuarios que necesiten una herramienta de gestión de proyectos corporativa.

Propuesta de valor
FlowSync permite que cada miembro:

Vea las tareas activas del equipo.
Sepa quién tiene asignada cada tarea.
Consulte el estado actual del trabajo.
Cree, asigne y actualice tareas rápidamente.
El valor no será “gestionar todo el proyecto”, sino obtener una visión compartida y actualizada del trabajo sin depender de reuniones de seguimiento.

Alcance del MVP
Autenticación básica

Registro, inicio y cierre de sesión.
Acceso protegido para usuarios autenticados.
Un espacio compartido de trabajo

Un único tablero por equipo.
Sin jerarquía de múltiples espacios, carpetas o proyectos.
Gestión mínima de tareas

Crear una tarea.
Editar su título y descripción.
Asignarla a un miembro del equipo.
Marcarla como pendiente, en curso o completada.
Consultar las tareas por estado y responsable.
Visibilidad del equipo

Ver quién participa en el espacio.
Ver las tareas asignadas a cada persona.
Identificar rápidamente tareas sin asignar o no completadas.
Actualización compartida

Los cambios deben reflejarse al volver a consultar el tablero.
La prioridad es que la información común esté actualizada, no construir colaboración avanzada.

## NO-alcance
Notificaciones por email, push o Slack: fuera, porque no ayudan a validar inicialmente si el tablero permite entender el trabajo sin reuniones; primero hay que comprobar que los usuarios consultan y actualizan el tablero.

Chat, comentarios y menciones: fuera, porque añaden comunicación paralela y pueden convertir el producto en otro canal de mensajes; no son necesarios para validar la visibilidad de las tareas.

Tiempo real mediante websockets: fuera, porque la hipótesis inicial puede validarse con actualización al cargar o refrescar; la sincronización instantánea solo entra si los usuarios necesitan esperar demasiado para ver cambios.

Proyectos, carpetas y múltiples tableros: fuera, porque introducen estructura y navegación antes de demostrar que un único espacio compartido resuelve el problema básico.

Dependencias, subtareas y automatizaciones: fuera, porque aumentan la complejidad del flujo y no son necesarias para saber quién está trabajando en qué.

Etiquetas, filtros avanzados y campos personalizados: fuera, porque son optimizaciones de organización; no prueban por sí mismas que exista mejor coordinación del equipo.

Roles, permisos avanzados y administración empresarial: fuera, porque el usuario objetivo es un equipo pequeño y el MVP no necesita resolver gobernanza organizativa.

Calendario, estimaciones, tiempos registrados y métricas: fuera, porque miden planificación o rendimiento, mientras que el problema inicial es la falta de visibilidad cotidiana.

Integraciones con Jira, GitHub, Google Calendar o similares: fuera, porque podrían ocultar si el valor está en FlowSync o en los sistemas externos; primero debe probarse el flujo independiente.

Aplicación móvil nativa: fuera, porque una interfaz web responsive basta para validar el uso principal y evita mantener dos plataformas.

Funciones de IA: fuera, porque recomendar, resumir o priorizar tareas no es necesario hasta demostrar que los datos introducidos son suficientes y fiables.