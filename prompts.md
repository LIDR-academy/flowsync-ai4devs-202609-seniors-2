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

**Modelo:** GPT
**Herramienta:** Claude Code

```
analiza el proyecto y devuelveme que capabilities hay construidas y como es el modelo dedatos actual
```

**Qué salió:**
Modelo de datos actual
Solo existen dos tablas, definidas en las migraciones:

users
En create_users_table:

id: clave primaria autoincremental.
full_name: texto nullable.
email: texto obligatorio, único, máximo 254 caracteres.
password: texto obligatorio, almacenado mediante el sistema de hash de AdonisJS.
created_at: obligatorio.
updated_at: nullable.
El modelo añade:

Autenticación mediante withAuthFinder.
Cálculo derivado de initials.
Ocultación de password al serializar.
Transformación pública limitada a id, nombre, email, fechas e iniciales.
Ver: user.ts y user_transformer.ts.

auth_access_tokens
En create_access_tokens_table:

id: clave primaria.
tokenable_id: FK hacia users.id.
Borrado en cascada al eliminar el usuario.
type: tipo de token.
name: nullable.
hash: hash del token.
abilities: permisos del token, actualmente sin uso funcional visible.
created_at, updated_at.
last_used_at: nullable.
expires_at: nullable.
La relación con usuarios se gestiona mediante DbAccessTokensProvider; no existen otras entidades ni relaciones de negocio.

Resumen
El estado actual es:


Es una base funcional de cuentas y autenticación, pero todavía no existe el modelo de datos necesario para la gestión colaborativa de tareas. Concebiblemente, las próximas entidades serían equipos/proyectos y tareas, pero ninguna está implementada actualmente.



## Prompt 2

pregunta antes de  proponer alguna solición , las  5 preguntas que reducirian , sobre el problema, los usuario y el alcance,  solo una ronda, no bajes a los modelos de datos  o a los endpoints 

**Qué salió:**

¿Quiénes son los usuarios principales de FlowSync y qué tipo de equipo o contexto de trabajo tienen?

¿Qué resultado observable demostraría que FlowSync está aportando valor a esos usuarios?

¿Cuál es el flujo de trabajo mínimo que debe poder completar un usuario para que el producto sea útil?

¿Qué funcionalidades o escenarios quedan explícitamente fuera del primer MVP, aunque puedan ser importantes más adelante?


## Prompt 3

propon el alcance a 5 bloques :   Problema · usuarios · propuesta de valor · alcance · NO-alcance. siendo agresiva y recortando  y justifica cada exclusion  

**Qué salió:**

Problema
Los equipos remotos pierden visibilidad sobre quién está haciendo qué. La información se dispersa entre reuniones, mensajes y herramientas demasiado complejas, por lo que detectar bloqueos y avances requiere coordinación manual.

El MVP se centrará en validar una única hipótesis: si un equipo comparte un tablero mínimo de tareas, puede saber rápidamente en qué está trabajando cada persona sin reunirse para sincronizarse.

Usuarios
Equipos remotos pequeños, de aproximadamente 3 a 10 personas.
Personas que ejecutan y actualizan tareas diariamente.
Una persona responsable de coordinar el trabajo del equipo.
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
NO-alcance
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