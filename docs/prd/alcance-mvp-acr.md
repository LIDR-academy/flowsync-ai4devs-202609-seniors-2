# Alcance MVP — FlowSync

## 1. Terreno que ya existe

FlowSync hoy es únicamente un esqueleto de autenticación: no hay ninguna capability de gestión de tareas construida todavía.

| | Backend | Frontend |
|---|---|---|
| **Capabilities** | `POST /auth/signup`, `POST /auth/login`, `GET /account/profile`, `POST /account/logout` (tokens de acceso opacos vía AdonisJS Auth) | Páginas de login, registro y perfil; rutas protegidas/públicas ya montadas |
| **Modelo de datos** | Tablas `users` (id, full_name, email, password, timestamps) y `access_tokens` | — |

No existe ninguna entidad de tarea, equipo, estado o fecha de vencimiento: todo el alcance de producto de abajo hay que construirlo desde cero sobre el usuario ya existente.

## 2. El interrogatorio

Antes de proponer nada, se pidieron las 5 preguntas que más reducirían la incertidumbre sobre el problema, los usuarios y el alcance, en una sola ronda y sin bajar a modelo de datos ni endpoints:

1. ¿Cuál es el dolor concreto y el episodio real que lo dispara?
2. ¿Quién cobra el valor directamente: los pares del equipo, o un lead/manager que busca visibilidad hacia arriba?
3. ¿Qué significa exactamente "más en tiempo real"?
4. ¿La daily de sincronización desaparece entera, o solo una parte de ella?
5. ¿Qué tamaño y forma tiene el equipo objetivo, y hay un caso de uso concreto en mente?

Las 5 se respondieron pegando entera la ficha de hechos del enunciado (prompt completo en `prompts.md`, Prompt 3). Las 5 quedaron cubiertas por la ficha sin necesidad de declarar ningún supuesto adicional en este paso.

## 3. El alcance del MVP

### Problema

Los equipos remotos pequeños pierden visibilidad de en qué está trabajando cada persona sin interrumpirla, y hoy resuelven eso con una ronda de "¿en qué estás?" que se come la mitad de la daily. El coste real no es la reunión: es que dos personas pueden tocar el mismo módulo la misma semana sin saberlo (episodio de referencia: 2 días perdidos).

### Usuarios

Equipos remotos pequeños de 3 a 10 personas, con roles planos (sin jerarquía de permisos). Quien cobra el valor son los pares entre sí, no un lead o manager — no hay reporte hacia arriba en este MVP. Caso de estudio de referencia: equipo de producto SaaS de 6 personas en 3 husos horarios, que hoy usa un gestor de tareas pesado y una daily de 15 minutos por videollamada.

**Supuesto declarado (viene de la ficha, no inventado):** un único espacio de trabajo compartido para todo el equipo. Varios equipos separados, o personas en más de un equipo, queda fuera del MVP.

### Propuesta de valor

Ver el estado de las tareas del equipo de un vistazo, sin preguntar y viendo lo último cada vez que abre o recarga la lista, actualizado por quien hace el trabajo en dos clics sobre una lista que ya es su propia cola de trabajo. Es frescura de la tarea, no presencia de la persona: nadie ve "quién está conectado". FlowSync sustituye al gestor de tareas actual, no convive con él.

### Alcance

1. Espacio de trabajo único compartido por todo el equipo (sin entidad "equipo").
2. Crear una tarea con título, responsable, estado y fecha de vencimiento.
3. Cambiar el estado de una tarea en dos clics, sin campos obligatorios adicionales.
4. Ver la lista de tareas del equipo con su estado y responsable.
5. Filtrar la lista por estado para centrarse en lo pendiente.
6. Ver de un vistazo qué tareas están vencidas (fecha de vencimiento pasada).
7. Al abrir o recargar la lista, ver el estado más reciente de las tareas de todo el equipo — incluidos los cambios hechos por otras personas — sin tener que preguntarle a nadie.

**Supuesto declarado (punto 7):** "sin refrescar ni preguntar" se interpreta como "no hace falta preguntarle a nadie ni ir a otra herramienta para ver el estado actualizado", no como que la pantalla se actualice sola mientras la persona ya la tiene abierta, sin que haga nada. Esa segunda versión queda fuera de este MVP — ver NO-alcance.

### NO-alcance

**Declaradas explícitamente en la ficha de hechos (Prompt 3):**

1. **Notificaciones push** — la señal es "resumen que espera", no "aviso que interrumpe"; una notificación push reintroduce la interrupción que el producto existe para evitar.
2. **Roles y permisos avanzados** — los usuarios objetivo son pares en un equipo plano; no hay hipótesis que valide una jerarquía en el MVP.
3. **Entidad "equipo" / múltiples espacios separados** — declarado como supuesto fuera del MVP en la ficha; construirlo antes de validar el espacio único es resolver un problema que todavía no se sabe si existe.
4. **Derivar el estado desde señales externas (Git/PRs, CI, calendario)** — la hipótesis a validar es si el coste de teclear dos clics se sostiene; automatizarlo de entrada impide medir si el coste manual es realmente el problema.
5. **Chat, videollamada o edición simultánea del mismo documento** — "tiempo real" en este MVP es frescura de estado, no comunicación síncrona; construir esto valida una hipótesis distinta (comunicación), no la de este producto (visibilidad de estado).
6. **Indicadores de presencia ("quién está conectado", actividad)** — rechazado a propósito: el producto valida frescura de la tarea, no vigilancia de la persona; incluirlo contradice la propuesta de valor declarada.
7. **Sprints, estimaciones, épicas, backlog priorizado, informes** — el equipo objetivo renuncia explícitamente a esto; construirlo sirve a un usuario que no es el nuestro y no ayuda a validar si "dos clics" basta.
8. **Sincronización o convivencia con otro gestor de tareas** — el riesgo #1 a validar es que la información no se quede vieja; convivir con otra herramienta duplica la actualización y garantiza que sí se quede vieja, justo lo que hay que evitar.

**Declaradas en el bloque "Fuera del MVP" del enunciado del ejercicio** (no en la ficha de hechos: la IA ya había leído el `README.md` completo al principio de la conversación, y este bloque nunca se pegó como prompt — ver nota de transparencia en la Parte B):

9. **Integración con Slack** — el estado se teclea dentro de FlowSync, no se deriva ni se sincroniza con otra herramienta; integrarlo no ayuda a validar si el estado tecleado a mano se mantiene fresco.
10. **Analítica / reporting** — nadie "de arriba" consume este producto; construirlo respondería a una pregunta (¿cómo reporto?) que este MVP no se hace.
11. **Comentarios en tareas** — el valor a validar es "cambiar estado en dos clics", no conversar sobre la tarea; añadir comentarios no ayuda a probar esa hipótesis y sí abre otra superficie (moderación, notificaciones de comentario).

**Recortadas sobre la propuesta inicial de la IA, por el autor:**

12. **Editar una tarea (título o fecha)** — ninguna hipótesis del MVP depende de poder editar; el flujo que se valida es crear + cambiar estado. La IA lo propuso por completitud de CRUD, sin base en la ficha.
13. **Borrar una tarea** — no borrar una tarea que sobra no rompe la validación de "veo el estado del equipo de un vistazo". Mismo origen: completitud de CRUD sin respaldo.
14. **Reasignar el responsable de una tarea ya creada** — la ficha habla de elegir qué tarea coger, no de reasignar una ya asignada a otra persona; sin hipótesis que lo respalde.

**Precisión sobre el mecanismo del punto 7 del Alcance** (no es uno de los 10 ítems originales propuestos por la IA — el punto 7 se mantiene, esto solo aclara cómo se construye):

15. **Que la pantalla se actualice sola mientras la persona ya la tiene abierta, sin que haga nada** — se prioriza la versión barata (al recargar) sobre la lectura literal de "sin refrescar"; ver el supuesto declarado en el punto 7 del Alcance.

## Parte B — las tres líneas

1. **Los dos números:** 10 → 7.

2. **Tres cosas que dejé fuera, y por qué** (detalle completo en NO-alcance #12-14): editar una tarea y reasignar su responsable no ayudan a validar "crear + cambiar estado en dos clics"; borrar una tarea no ayuda a validar "ver el estado del equipo de un vistazo".

3. **La exclusión de la que menos seguro estoy:** que la pantalla se actualice sola mientras ya la tengo abierta (sin recargar), frente a que solo se actualice al abrir o recargar la lista. Lo que se contradice: la ficha dice literalmente "sin refrescar" (suena a actualización en vivo), pero el caso de uso que ella misma da — "llego por la mañana y veo qué se ha movido" — y el criterio de "vertical fina, no andamiaje amplio" apuntan a que basta con actualizar al recargar. Elegí lo barato sobre la lectura literal. **Tendría que pasar** que, en el uso real de una semana, el equipo siga interrumpiéndose porque alguien tiene la pantalla abierta todo el día sin recargar — ahí "sin refrescar" sería literal y esta pieza pasaría de exclusión a necesaria.

> **Nota aparte:** en dos momentos de este ejercicio la IA se corrigió tras ser cuestionada, no al revés — propuso "editar", "borrar" y "reasignar responsable" sin respaldo en la ficha (completitud de CRUD), y coló un detalle de implementación en un documento de producto (el prompt original decía "webhook"; la IA lo generalizó sin avisar). Ambos los detectó el autor, no la IA. El hallazgo más serio, sin embargo, lo sacó el `adversarial-reviewer` sobre el PR, no la conversación: 3 de las 11 exclusiones marcadas como "de la ficha" en realidad venían de un bloque distinto del enunciado ("Fuera del MVP") que la IA ya había leído directamente del `README.md`, sin que el autor lo pegara nunca como prompt. El contenido era correcto, pero la trazabilidad no — quedó corregido reetiquetando su origen real en el NO-alcance.
