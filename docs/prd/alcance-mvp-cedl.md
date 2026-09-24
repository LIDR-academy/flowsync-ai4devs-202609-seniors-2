# Alcance MVP - FlowSync

## 1. Problema

Los equipos remotos pequeños (3-10 personas) pierden tiempo en:
- **La ronda de "¿en qué estás?" de la daily** (7-8 minutos de cada reunión de 15)
- **Interrupciones constantes por Slack/chat** preguntando en qué trabaja cada uno
- **Duplicación de trabajo**: dos personas tocan el mismo módulo sin saberlo (episodio real: 2 días perdidos)

Nadie ve el estado del equipo sin interrumpir a alguien. La información existe en la cabeza de cada persona, pero no está compartida.

## 2. Usuarios

**Usuario primario:** Desarrolladores/as en equipos remotos que se coordinan entre pares, sin jerarquía.

**Caso de estudio:** Equipo de 6 personas de producto SaaS, 3 husos horarios, daily de 15 min, usa Jira hoy pero lo encuentran pesado.

**NO es para:** Managers que reportan hacia arriba, equipos que necesitan sprints/estimaciones/épicas, múltiples equipos separados.

## 3. Propuesta de valor

**Ver de un vistazo en qué trabaja cada persona del equipo**, sin preguntar. En segundos: crear una tarea, actualizarle el estado, ver qué está libre.

**Qué decisión cambia:** No empezar algo que otro ya está tocando. Elegir lo siguiente sabiendo qué está libre.

**Éxito medible:** El equipo cancela la ronda de "¿en qué estás?" de la daily (recupera 7-8 min) y nadie pide que vuelva después de una semana.

## 4. Alcance - Qué SÍ construimos

**Una vertical fina y usable de punta a punta:**

1. **Crear tarea nueva:** título, responsable (elegido de la lista de usuarios del equipo), estado inicial automático ("Por hacer"), fecha de vencimiento
2. **Ver lista compartida** de todas las tareas del equipo, con botón para refrescar manualmente
3. **Cambiar el estado de mis tareas:** Solo el responsable asignado puede cambiar el estado de su tarea. Tres estados: "Por hacer", "En curso", "Hecho"
4. **Editar título y fecha:** Cualquiera puede editar el título y la fecha de vencimiento de cualquier tarea
5. **Reasignar responsable:** Cambiar quién es el dueño de una tarea existente

**Supuestos marcados:**
- Un solo espacio compartido (multi-equipo queda fuera)
- Refrescar manualmente la lista con un botón (tiempo real automático queda fuera del MVP)
- El equipo actualiza manualmente el estado (sin integraciones Git/CI/Slack)
- Roles planos: todos crean tareas y editan detalles, pero solo el responsable actualiza el estado de su tarea

## 5. NO-Alcance - Qué NO construimos (y por qué)

### Funcionalidades excluidas con justificación:

1. **Actualización automática en tiempo real (WebSockets)**  
   *Por qué:* Añade infraestructura (servidor de WebSockets, manejo de conexiones persistentes, lógica de reconexión, broadcasting). No valida la hipótesis central: ¿la gente mantiene el estado actualizado? Un botón de refrescar manual (o polling simple cada 10s) valida lo mismo sin construir esa capa. Si después de la semana la gente pide "que se actualice solo", entonces sabemos que vale el esfuerzo.

2. **Borrar tareas**  
   *Por qué:* Las tareas terminadas se marcan como "Hecho" y quedan en la lista. Borrar introduce decisiones sobre permisos (¿quién puede borrar qué?) y riesgo de pérdida accidental de información. No valida si la lista se mantiene útil para coordinar trabajo activo. Si la lista crece demasiado, añadimos filtros (próxima exclusión) antes de borrado.

3. **Filtrar, ordenar o buscar tareas**  
   *Por qué:* Con 3-10 personas esperamos 15-25 tareas activas. Cabe en pantalla con scroll. Filtrar no valida la hipótesis central (¿la gente actualiza el estado?). Se añade cuando la lista crezca y se demuestre que el estado se mantiene fresco.

4. **Descripción, notas o cuerpo de la tarea**  
   *Por qué:* Si el título no es auto-explicativo, habla con el responsable. El producto busca reducir documentación, no fomentarla. Añade fricción sin validar la hipótesis.

5. **Comentarios en tareas**  
   *Por qué:* Comunicación fuera de la herramienta (Slack, cara a cara). Ya está en la lista oficial de "fuera del MVP". No valida el valor central: visibilidad del estado.

6. **Más de 3 estados** (bloqueado, en revisión, cancelado...)  
   *Por qué:* Validamos primero si mantienen actualizado lo básico. Si necesitan más granularidad, lo sabremos en la semana de validación. Menos estados = menos fricción al actualizar.

7. **Destacar visualmente las tareas atrasadas**  
   *Por qué:* La fecha de vencimiento se muestra, pero lógica de "atrasado en rojo" es gestión de proyecto tradicional. El MVP valida coordinación en tiempo real, no cumplimiento de deadlines.

8. **Historial de cambios / auditoría**  
   *Por qué:* No valida si la gente mantiene el estado actualizado. Añade complejidad sin aportar a la métrica de éxito.

9. **Notificaciones de cualquier tipo** (push, email, browser)  
   *Por qué:* Ya definido como fuera. "Resumen que espera, no aviso que interrumpe". La forma de consumo es "llego por la mañana y veo qué se movió", no interrupciones.

10. **Integraciones** (Slack, Git, CI, calendario)  
    *Por qué:* Ya definido como fuera del MVP. Es otro producto, requiere OAuth y conectores de terceros. El estado sale de actualización manual en segundos.

11. **Múltiples equipos o espacios separados**  
    *Por qué:* Un espacio único compartido. Multi-equipo añade complejidad (permisos, navegación) sin validar la hipótesis con el primer equipo.

12. **Roles jerárquicos o permisos avanzados** (lead/gerente con privilegios especiales)  
    *Por qué:* El usuario primario es coordinación entre pares, no reporte hacia arriba. "No hay reporte hacia arriba y a un manager le daría igual". Roles planos: todos pueden crear y editar detalles de tareas. La única restricción es que solo el responsable cambia el estado de su tarea (ownership claro, no jerarquía).

13. **Sprints, estimaciones, épicas, backlog priorizado, informes**  
    *Por qué:* Renuncia explícita definida en los hechos. Un equipo que necesite eso no es nuestro usuario.

14. **Etiquetas, categorías o agrupaciones de tareas**  
    *Por qué:* Añade decisiones al crear/actualizar. Buscamos "dos clics", no configuración. No valida la hipótesis.

15. **Adjuntos, archivos o enlaces**  
    *Por qué:* Contexto fuera de la herramienta. Añade complejidad sin validar visibilidad de estado.

16. **Asignación múltiple** (una tarea con varios responsables)  
    *Por qué:* Una tarea = una persona responsable. Si es trabajo compartido, crea dos tareas. Evita ambigüedad sobre quién actualiza el estado.

---

## Parte B: Las tres líneas

### 1. Los números

- **Propuestas inicialmente en alcance:** 6 capabilities
- **Quedaron después del recorte:** 5 capabilities

### 2. Tres exclusiones y su justificación

1. **WebSockets / Tiempo real automático**  
   *Hipótesis que no valida:* No valida si la gente mantiene actualizado el estado. Un botón de refrescar manual valida lo mismo sin construir infraestructura de conexiones persistentes. Si mantener fresco el estado funciona con refrescar manual, entonces sabemos que WebSockets son un nice-to-have, no un must-have.

2. **Borrar tareas**  
   *Hipótesis que no valida:* No valida si la lista se mantiene útil para coordinar trabajo activo. Las tareas terminadas marcadas como "Hecho" permiten ver qué se cerró recientemente, lo cual es parte del "resumen que espera". Borrar introduce decisiones de permisos que contradicen roles planos.

3. **Filtros y búsqueda**  
   *Hipótesis que no valida:* No valida la hipótesis central: ¿se mantiene actualizado el estado? Con 15-25 tareas (el volumen esperado), scroll simple es suficiente. Si validamos que la lista se usa y el estado se mantiene fresco, entonces añadimos filtros. El orden inverso (construir filtros sin saber si la lista se mantiene útil) es andamiaje prematuro.

### 3. La exclusión de la que menos seguro estoy

**Reasignar responsable quedó DENTRO, y no estoy seguro.**

**La contradicción:** Por un lado, la ficha dice "una tarea = un dueño" y "si cambia de manos, bórrala y crea otra" (lo escribí yo mismo en una exclusión anterior sobre asignación múltiple). Por otro lado, casos reales: alguien de vacaciones, alguien enfermo, una tarea que se asignó mal.

**Qué tendría que pasar para sacarla:** Si en la semana de validación nadie reasigna tareas porque simplemente crean una nueva cuando alguien se lleva el trabajo de otro, entonces reasignar no valida nada y es complejidad extra. La alternativa más simple es: si la tarea cambió de manos, márcala "Hecho" y crea una nueva con el título actualizado y el nuevo responsable.

**Por qué dudé:** Marcar "Hecho" una tarea que no se terminó miente sobre el estado, que es justo lo que el producto busca evitar. Pero añadir "reasignar" puede ser solucionar un problema de proceso (mala asignación inicial) con una feature en vez de con disciplina.

---

## Supuestos críticos a validar

**Riesgo #1:** La información se queda vieja y el producto pierde sentido.  
**Mitigación en el diseño:** Actualizar cuesta un clic sobre una lista ya abierta. Quien lo escribe cobra en el momento: esa lista es su cola de trabajo.

**Validación:** Si después de una semana el estado no se mantiene fresco, el MVP falló, independientemente de las features construidas.
