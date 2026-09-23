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

**Modelo:** Claude Opus 5.5 (1M) xHigh
**Herramienta:** Claude Code

```
Revisa el proyecto que hay en este directorio. Dime sus capabilities constridas, como es el modelo de datos. Escribe el resumen en la memoria del proyecto para tenerlo presente durante esta sesion y no tener que volver a revisarlo.
```

**Qué salió:** funcionó a la primera: solo hay auth (registro, login, perfil, logout) y dos tablas (`users`, `auth_access_tokens`); lo guardó en la memoria del proyecto.

## Prompt 2

**Modelo:** Claude Opus 5.5 (1M) xHigh
**Herramienta:** Claude Code

```
Quiero que FlowSync sea una herramienta para que los equipos remotos sepan en qué está trabajando cada uno sin tener que hacer reuniones de sincronización. Algo tipo tareas compartidas pero más en tiempo real y menos rollo que Jira
Preguntame antes de proponer: las cinco preguntas que más reducirían la incertidumbre sobre el problema, los usuarios y el alcance. 
Vamos a definirlo en una sola ronda
NO QUIERO trabajar el modelo de datos ni los endpoints. Solo definiremos requisitos de producto, no tecnicos.
```

**Qué salió:** funcionó a la primera: cinco preguntas en una sola ronda, sin bajar al modelo de datos.

## Prompt 3

**Modelo:** Claude Opus 5.5 (1M) xHigh
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

- Fuera del MVP: notificaciones push, integración con Slack, roles/permisos avanzados, analítica/reporting, comentarios en tareas.
```

**Qué salió:** con solo la ficha, sin pedirlo, propuso ya el alcance en cinco bloques: 6 cosas dentro y dos tensiones de la ficha señaladas (fecha de vencimiento, "veo qué se ha movido").

## Prompt 4

**Modelo:** Claude Opus 5.5 (1M) xHigh
**Herramienta:** Claude Code

```
guardalo en docs/prd/alcance-mvp-FP.md
```

**Qué salió:** lo guardó y, por su cuenta, añadió los tramos 1 y 2 y los enunciados de la Parte B.

## Prompt 5

**Modelo:** Claude Opus 5.5 (1M) xHigh
**Herramienta:** Claude Code

```
Las tensiones resuelvelas tu y marcalas como supuesto
```

**Qué salió:** dejó la fecha como opcional (S1), dejó fuera el resumen de cambios (S2) y añadió por su cuenta el espacio único (S3).

## Prompt 6

**Modelo:** Claude Opus 5.5 (1M) xHigh
**Herramienta:** Claude Code

```
Dame el alcance en cinco bloques. 
- Problema 
- Usuarios 
- Propuesta de valor
- Alcance
- NO-alcance

Recuerda que es un MVP. Quiero un alcance corto, se agresiva en el recorte.
Justifica cada recorte
```

**Qué salió:** recortó de 6 a 4 cosas; sacó la fecha y el filtro por estado aunque la ficha los pedía, y con eso S1 dejó de valer.

## Prompt 7

**Modelo:** Claude Opus 5.5 (1M) xHigh
**Herramienta:** Claude Code

```
si
```

**Qué salió:** sustituyó el alcance del archivo por la versión de 4 cosas.

## Prompt 8

**Modelo:** Claude Opus 5.5 (1M) xHigh
**Herramienta:** Claude Code

```
me quedo con esta
```

**Qué salió:** sin cambios en el documento; lo anotó en la memoria del proyecto.

## Prompt 9

**Modelo:** Claude Opus 5.5 (1M) xHigh
**Herramienta:** Claude Code

```
rellena el documento de prompts
```

**Qué salió:** este archivo.

## Prompt 10

**Modelo:** Claude Opus 5.5 (1M) xHigh
**Herramienta:** Claude Code

```
añade xHigh al modelo en el documento de prompts
```

**Qué salió:** añadió el nivel de esfuerzo a la línea de modelo de todos los prompts.

## Prompt 11

**Modelo:** Claude Opus 5.5 (1M) xHigh
**Herramienta:** Claude Code

```
elimina el punto 3 del alcance. para el mvp no lo necesitamos
```

**Qué salió:** quitó "coger, soltar y mover" y dejó el alcance en 3 cosas; avisó de que sin ese punto no hay forma de cambiar el estado ni el responsable de una tarea.

## Prompt 12

**Modelo:** Claude Opus 5.5 (1M) xHigh
**Herramienta:** Claude Code

```
como vas a llamar a la rama?
```

**Qué salió:** propuso `alcance-fp`, siguiendo el patrón del README.

## Prompt 13

**Modelo:** Claude Opus 5.5 (1M) xHigh
**Herramienta:** Claude Code

```
créala como alcance-fp
```

**Qué salió:** creó la rama sin commitear nada.

## Prompt 14

**Modelo:** Claude Opus 5.5 (1M) xHigh
**Herramienta:** Claude Code

```
que le pasa al punto 3?
```

**Qué salió:** explicó que sin ese punto ninguna tarea puede cambiar de estado ni de responsable, y corrigió una de las alternativas que había dado antes.

## Prompt 15

**Modelo:** Claude Opus 5.5 (1M) xHigh
**Herramienta:** Claude Code

```
vuelve a incluirlo. no me di cuenta
```

**Qué salió:** volvió a poner el punto 3 tal como estaba; el alcance queda otra vez en 4 cosas.

## Prompt 16

**Modelo:** Claude Opus 5.5 (1M) xHigh
**Herramienta:** Claude Code

```
alctualiza el fichero de prompts con los que faltan, este incluido.
```

**Qué salió:** solo faltaba este; los anteriores ya estaban.

## Prompt 17

**Modelo:** Claude Opus 5.5 (1M) xHigh
**Herramienta:** Claude Code

```
que ficheros vas a incluir en la PR?
```

**Qué salió:** solo `docs/prd/alcance-mvp-FP.md` y `prompts.md`; deja fuera el reformateo de `backend/database/schema.ts`.

## Prompt 18

**Modelo:** Claude Opus 5.5 (1M) xHigh
**Herramienta:** Claude Code

```
haz el commit y abre la PR
```

**Qué salió:** hizo el commit con los dos ficheros y abrió el PR contra `s2/start` del repositorio del curso (contra `main` arrastraba decenas de ficheros ajenos).
