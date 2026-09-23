### Parte A
## 1. El terreno que ya existe:

Backend AdonisJS con auth por access tokens (signup, login, profile, logout) bajo /api/v1, protegido con guard api. Frontend React con 3 páginas (login, register, profile) y guards de ruta según autenticación. 
Modelo de datos: solo users (id, full_name, email, password) y la tabla técnica auth_access_tokens de Adonis Auth. No hay tablas ni endpoints de tareas, proyectos o equipos. Es decir: el andamiaje de autenticación está completo, pero la funcionalidad de gestión de tareas (el objetivo real de FlowSync) aún no existe.

## 2. El interrogatorio, con las respuestas ya decididas.
 
1. ¿Cuál es la frecuencia real del dolor, no solo su intensidad? Solo hay un episodio concreto (2 días perdidos). ¿Es algo que pasa cada semana o fue una excepción? Si es raro, el problema a resolver puede ser otro (p. ej. la incomodidad de la ronda en sí, no el trabajo duplicado).
2. ¿Por qué el gestor de tareas pesado que ya usan no resuelve esto hoy? Si ya tiene un campo de estado, ¿por qué no lo miran? ¿Es fricción de la herramienta, hábito, o nadie lo actualiza igual? Si la causa es cultural (nadie actualiza estado en ningún lado), cambiar de herramienta no lo arregla.
3. ¿Está validado que la gente actualizará su estado sin que nadie se lo pida, o es un supuesto de comportamiento sin probar? Está marcado como "riesgo #1" pero la mitigación descrita (dos clics) es una hipótesis de fricción, no de motivación. ¿Qué pasa si el estado se queda desactualizado no por fricción sino porque a nadie le importa avisar hasta que se lo preguntan?
4. Si el equipo cancela la ronda de la daily, ¿cómo se distingue que fue por FlowSync y no por otra causa? (cambio de proyecto, menos gente, verano, etc.) El criterio de éxito necesita algo que descarte explicaciones alternativas, o el resultado a una semana no será interpretable.
5. ¿Hay una barrera de confianza o cultura que haga que la gente no quiera exponer su estado real, aunque sea barato hacerlo? El documento rechaza explícitamente la vigilancia de presencia, pero no aborda si mostrar el estado de la tarea (p. ej. "bloqueado", "sin avanzar") genera la misma incomodidad social que responder en la daily — solo que por escrito y visible para todos.

## 3. El alcance en cinco bloques

Uso el alcance y los límites ya acordados (memoria del MVP de FlowSync) para esta propuesta.

Problema

Los pares de un equipo remoto pequeño pierden tiempo y coordinación porque no hay forma de ver en qué está trabajando cada uno sin preguntar. Eso produce dos síntomas: trabajo duplicado por desconocimiento (el episodio de los 2 días perdidos) y una ronda de "¿en qué estás?" en la daily que consume la mitad de los 15 minutos sin aportar decisión, solo información.

Usuarios

Equipos remotos de 3–10 personas, roles planos, sin jerarquía de permisos. Caso de estudio: equipo de producto SaaS de 6 personas en 3 husos horarios que hoy usa un gestor de tareas pesado y una daily por videollamada. No hay manager ni reporte hacia arriba como beneficiario — el valor lo cobran los propios pares.

Propuesta de valor

Ver el estado del equipo de un vistazo, sin interrumpir a nadie y sin esperar a la daily. La misma lista donde alguien marca su estado es su cola de trabajo — el beneficio es inmediato para quien la actualiza, no solo para quien la consulta. Esto permite dos decisiones concretas: no empezar algo que otro ya está tocando, y elegir qué coger sabiendo qué está libre.

Alcance (funcionalidades completas del MVP)

1. Cuenta y acceso — registro, login, logout. Ya constrido
2. Espacio de equipo único — todos los usuarios registrados comparten el mismo espacio de tareas. Sin invitaciones, sin  configuración: entrar ya es estar dentro.
3. Gestión de tareas — crear, editar y eliminar tareas con título, responsable, estado y fecha de vencimiento. Sin campos  opcionales ni obligatorios adicionales.
4. Cambio de estado en dos clics — cambiar el estado de una tarea desde la propia lista, sin abrir un formulario ni pantalla de detalle.
5. Lista filtrable por estado — vista única de todas las tareas del equipo, filtrable por estado, para centrarse en lo pendienteVisibilidad de vencidas — señal visual (no notificará para tareas que pasaron su fecha de vencimiento).
7. Actualización sin refresco — los cambios de estado de otros se reflejan solos en la lista abierta, sin recargar la página ni preguntar.

Esto es la vertical completa: entrar, ver qué hacepio, y que se note sin acción de nadie más.
Cualquier funcionalidad que no sirva directamente a "ver el estado sin preguntar" queda fuera. 
No-alcance y el porqué.
- Notificaciones push — el diseño es "resumen que espera", no "aviso que interrumpe". Añadir push reintroduce la interrupción el producto existe para evitar.
- Integración con Slack — es otra vía de interrupción y una integración de terceros que no aporta a la propuesta de valor centademás diluye "FlowSync crea las tareas"
- Roles y permisos avanzados — el equipo objetivo es plano por diseño. Construir jerarquía de permisos es trabajo para un probque este equipo no tiene.
- Analítica y reporting — no hay beneficiario que lo consuma: el valor es para pares, no para un manager. Construirlo sería resolver un problema de otro usuario que no es este.
- Comentarios en tareas — abre la puerta a que la herramienta se convierta en canal de conversación, compitiendo con el chat qusan y añadiendo carga de moderación/lectura quección".
- Sprints, estimaciones, épicas, backlog priorizado — pertenecen a la categoría de gestor de tareas pesado que este producto  sustituye, no imita. Un equipo que los necesite
- Múltiples equipos / entidad "equipo" — el modelo de espacio único es una decisión de alcance, no un olvido; soportar varios equipos multiplica la complejidad de permisos siecesite.
- Estado derivado de Git/PRs/CI/calendario — exigiría integraciones OAuth de terceros y es, en la práctica, otro producto. El estado lo teclea la persona, en segundos, porquentener honesta.
- Indicadores de presencia ("quién está conectado ahora") — rechazado explícitamente: es vigilancia, no frescura de la tarea. Mostrar esto rompería la confianza que el product owner actualice su estado sin sentirse observada.

### Parte B

## 1. Los dos números.

IA: 7 - Yo: 5

## 2. Tres cosas que dejaste fuera, y por qué cada una.

Solo dejé fuera dos puntos, el punt 4 y el 7.
4. porque es una mejora de usabilidad que no es necesaria para el mvp.
7. porque para implementar esta feature hay que implementar algún mecanismo similar al de las notificaciones push.

## 3. La exclusión de la que menos seguro estás

- Comentarios en tareas — abre la puerta a que la herramienta se convierta en canal de conversación, compitiendo con el chat que usan y añadiendo carga de moderación/lectura quección.

Esta funcionalidad ayudaría a ver el estado.