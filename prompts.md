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

## Prompt 1: Las 5 preguntas

**Modelo:** Sonnet 4.5  
**Herramienta:** Claude Code

```
Quiero que me hagas 5 preguntas antes de definir el alcance antes de proponer el primer MVP. 
Las 5 preguntas que te ayuden a reducir la incertidumbre del problema, los usuarios y el alcance. 
Todo en **una sola** ronda, No **DEBES** bajar al modelo de datos ni a los endpoints necesarios.
```

**Qué salió:** Las 5 preguntas correctas (dolor, quién cobra valor, qué es "tiempo real", qué reunión desaparece, de dónde sale el estado). Después pegué la ficha de hechos completa del README.

---

## Respuestas de la ficha de hechos

*(Pegadas tal cual desde el README del ejercicio)*

- Coordinación entre **pares**, NO reporte hacia arriba
- Episodio concreto: dos personas tocaron el mismo módulo la misma semana sin saberlo → 2 días perdidos
- La daily NO desaparece entera, solo la ronda de "¿en qué estás?" (la mitad de los 15 min)
- Equipos remotos pequeños, 3-10 personas, roles planos
- Un espacio único compartido, sin multi-equipo
- "Tiempo real" = ver cambios de estado sin refrescar, NO es chat ni presencia
- Forma de la señal: resumen que espera, NO notificaciones push
- Qué decisión cambia: no empezar algo que otro ya toca, elegir lo siguiente sabiendo qué está libre
- Estado lo teclea quien hace la tarea, en segundos. Sin integraciones Git/CI
- Sustituye al gestor de tareas, NO convive con él
- Riesgo #1: que la info se quede vieja
- Tarea mínima: título, responsable, estado, fecha de vencimiento
- Filtrar por estado para centrarse en lo pendiente
- Éxito: cancelar la ronda de "¿en qué estás?" y que nadie pida que vuelva
- Construir: una vertical fina y usable, no andamiaje amplio

**Fuera explícitamente:** notificaciones push, Slack, roles/permisos, analítica, comentarios, sprints, estimaciones, épicas.

---

## Prompt 2: Proponer el alcance

**Modelo:** Sonnet 4.5  
**Herramienta:** Claude Code

```
(Implícito después de pegar la ficha de hechos)
Propón el alcance del MVP en 5 bloques: Problema, Usuarios, Propuesta de valor, 
Alcance (qué SÍ), NO-alcance (qué NO y por qué cada exclusión).
Recorta agresivamente.
```

**Qué salió:** Propuesta inicial con 6 capabilities en el SÍ, 16 en el NO con justificaciones. Incluía WebSockets y borrar tareas.

**Intervención del usuario:**
- "Los websockets van a requerir cambios de infraestructura"
- "Solo el dueño de la tarea puede cambiar el estado"
- "Solo el lead/gerente puede borrar tareas"

**Contradicciones detectadas por Claude:**
1. WebSockets contradice "vertical fina y usable" → se eliminó del alcance
2. Lead/gerente contradice "roles planos" y "los pares, no un lead" → se eliminó el borrado completo
3. Solo el dueño cambia estado → se aceptó, tiene sentido para ownership

**Recorte aplicado:**
- WebSockets → Botón de refrescar manual
- Borrar tareas → Completamente fuera del MVP
- Solo el responsable puede cambiar el estado de su tarea (ownership)

**Documento generado:** `docs/prd/alcance-mvp-cedl.md`

---

## Output del Prompt 2: Contradicciones encontradas

Al señalar las 3 contradicciones, el usuario aceptó el recorte más agresivo. Esto dejó el alcance en **5 capabilities**:

1. Crear tarea (título, responsable, fecha, estado inicial automático)
2. Ver lista compartida con botón de refrescar manual
3. Cambiar estado (solo el dueño de la tarea)
4. Editar título y fecha (cualquiera)
5. Reasignar responsable

**Exclusiones clave agregadas al NO-alcance:**
- WebSockets (no valida la hipótesis sin infraestructura)
- Borrar tareas (evita decisiones de roles/permisos)
- Filtros/búsqueda (15-25 tareas caben en scroll)

**La duda registrada en Parte B.3:** "Reasignar responsable" quedó dentro pero contradice "si cambia de manos, bórrala y crea otra". Es la exclusión de la que menos seguro estoy.

---

