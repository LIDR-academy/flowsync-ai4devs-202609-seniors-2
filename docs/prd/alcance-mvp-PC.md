# Alcance del MVP — FlowSync

## 1. Problema

La daily de sincronización pierde la mitad de sus 15 minutos en la ronda "¿en qué estás?", y fuera de esa ventana nadie ve el estado del equipo sin interrumpir a alguien por Slack. El costo es concreto, no hipotético: dos personas tocaron el mismo módulo la misma semana porque una empezó sin que la otra lo supiera — dos días perdidos. Quien paga el costo son los pares (el que interrumpe y el que descubre tarde el solape), no un manager que necesite reportes.

## 2. Usuarios

Equipos remotos pequeños (3–10 personas), roles planos — todos ven y editan lo mismo, sin jerarquía. Caso de estudio de referencia: equipo de producto SaaS de 6 personas en 3 husos horarios, hoy con un gestor de tareas pesado + daily de 15 min por videollamada. Es un caso de estudio para diseñar, no un cliente confirmado.

## 3. Propuesta de valor

Ver de un vistazo en qué está cada uno y qué está libre, sin interrumpir y sin esperar a la daily. La decisión que cambia: no empezar algo que otro ya está tocando, y elegir la siguiente tarea sabiendo qué está disponible. Se sostiene porque actualizar cuesta dos clics sobre una lista que la propia persona ya usa como su cola de trabajo — el que escribe el estado cobra valor en el momento (deja de recibir interrupciones), no solo lo hace por los demás.

## 4. Alcance (qué entra)

- Un espacio único compartido para todo el equipo (sin entidad "equipo", sin multi-equipo).
- Tareas con cuatro atributos: título, responsable, estado, fecha de vencimiento.
- Crear una tarea y asignar responsable — cualquier miembro a cualquier miembro (roles planos).
- Cambiar el estado de una tarea en segundos, sin campos obligatorios ni flujos de configuración.

## 5. NO-alcance (qué queda fuera y por qué)

- **Notificaciones push** — el producto es "resumen que espera", no "aviso que interrumpe"; una notificación reintroduce exactamente la interrupción que se busca eliminar.
- **Integración con Slack** — evita la doble actualización (escribir en dos sitios es cómo muere esta categoría de producto); FlowSync es donde se hace el trabajo, no donde se cuenta.
- **Roles y permisos avanzados** — el usuario objetivo es un equipo plano de 3–10 personas; una jerarquía de permisos resuelve un problema que este usuario no tiene.
- **Analítica / Reporting** — nadie cobra ese reporte (no hay manager consumiéndolo); el valor está en el estado presente, no en la historia.
- **Comentarios en tareas** — reintroduce la discusión síncrona que el producto reemplaza por "dos clics y seguir"; si hace falta discutir, ya existe el chat del equipo.
- **Multi-equipo / entidad "equipo"** — el MVP asume un espacio único; varios equipos o gente en más de uno queda fuera, anotado como límite conocido, no como carencia a resolver ahora.
- **Presencia / "quién está conectado ahora"** — rechazado a propósito: el estado es de la tarea, no de la persona; un indicador de actividad es vigilancia, no frescura.
- **Derivar estado desde Git/PRs/CI/calendario** — es otro producto, con integraciones y OAuth de terceros; el estado se teclea a mano porque cuesta segundos y no requiere infraestructura externa.
- **Sprints, estimaciones, épicas, backlog priorizado** — renuncia explícita de negocio: un equipo que necesite eso no es el usuario de este MVP.
- **Resolución de bloqueos** — la daily no desaparece entera; este MVP solo ataca la ronda de "¿en qué estás?", no la parte de bloqueos, para poder validar una cosa a la vez.
- **Convivencia con otro gestor de tareas (import/sync)** — FlowSync crea las tareas, no lee las de otro sitio; convivir exige doble actualización, el mismo riesgo que mata la integración con Slack.
- **Lista filtrable por estado** — con un equipo de 3–10 personas la cantidad de tareas es manejable en una lista plana; el filtro es comodidad, no necesidad.
- **Señal visual de tareas vencidas** — la fecha de vencimiento ya está como atributo de la tarea; resaltar visualmente es una mejora iterativa, no necesaria para validar la hipótesis.
- **Tiempo real sin refrescar (WebSockets/SSE)** — mantener conexiones abiertas permanentes es caro en recursos e infraestructura; un refresh manual o auto-polling cada pocos minutos da el mismo valor de "frescura" para un equipo que consulta el board unas pocas veces al día.

---

## Parte B — Tres líneas

1. **Números:** la IA propuso 7 cosas dentro del alcance; después de mi recorte quedaron 4.
2. **Tres cosas que dejé fuera:**
   - *Filtro por estado* fuera, porque es una feature de comodidad (could/should), no un must — no aporta beneficio real al equipo con 3–10 personas donde la lista plana es manejable
   - *Señal visual de vencidas* fuera, porque es un adicional visual (could) — la fecha de vencimiento ya está como atributo de la tarea, el dato es visible
   - *Tiempo real sin refrescar* fuera, porque no ayuda a validar que la gente mira el board en vez de preguntar por Slack — un F5 o auto-refresh cada 5 minutos da la misma respuesta sin el costo de conexiones abiertas
3. **La exclusión que menos seguro estoy:** tiempo real sin refrescar. Si los usuarios esperan instant refresh y el polling se siente lento o falla, la adopción podría caer. Entraría si en las primeras pruebas de uso vemos que la gente abre el board y no se logra adopción.