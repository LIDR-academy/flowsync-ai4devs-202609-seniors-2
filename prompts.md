# Prompts

## Prompt 1

**Modelo:** Sonnet 5 

**Herramienta:** Claude Code

```
Este proyecto es la semilla de una app de gestión de tareas (FlowSync). Vas a ayudarme a escribir su PRD (Product Requirements Document). Antes de empezar, dado que no partimos de una hoja en blanco, analiza el repo para conocer el estado inicial y dame un resumen de las capacidades que ya están construidas y del modelo de datos.
```

**Qué salió:** Además del análisis del código existente, detectó los templates de prompts y alcance que dejé en el repo y me preguntó por ellos.

## Prompt 2

**Modelo:** Sonnet 5 

**Herramienta:** Claude Code

```
El documento alcance-mvp-gc.md no lo tomes en cuenta. Es para mí exclusivamente y ajeno al proyecto, aunque esté en el mismo repositorio. Lo mismo para el archivo prompts.md. Bueno, partiendo del entendimiento de lo que ya está construido, arrancamos con el PRD. Quiero que FlowSync sea una herramienta para que los equipos remotos sepan en qué está trabajando cada uno sin tener que hacer reuniones de sincronización. Algo tipo tareas compartidas pero más en tiempo real y menos rollo que Jira.
Para clarificar y bajar a detalle, antes de proponer nada preguntame las 5 cosas que más te ayudarían a entender el problema, los usuarios y el alcance deseado.
```

**Qué salió:** Me hizo preguntas sobre usuarios, problema, alcance y no-alcance. Contesté pegando las respuestas del ejercicio, me devolvió un PRD y me propuso grabarlo.

## Prompt 3

**Modelo:** Sonnet 5 

**Herramienta:** Claude Code

```
Podemos guardarlo como borrador, pero lo vamos a desafiar. Antes que nada, cuáles serían las épicas para el MVP?
```

**Qué salió:** Armó 3 épicas que parecen razonables.

## Prompt 4

**Modelo:** Sonnet 5 

**Herramienta:** Claude Code

```
Estamos ignorando usuarios relevantes para el problema?
```

**Qué salió:** Mencionó dos casos ignorados (no exactamente lo preguntado pero relevante), y me dijo que no creía que estuviéramos ignorando ningún tipo de usuario.

## Prompt 5

**Modelo:** Sonnet 5 

**Herramienta:** Claude Code

```
Me parece bien modelar autoasignación únicamente. Revisemos ahora la funcionalidad que estamos dejando fuera. Justifica el motivo para no incluir a cada item del no-alcance.
```

**Qué salió:** Me pasó la lista de items descartados con una justificación, omitiendo 2.

## Prompt 6

**Modelo:** Sonnet 5 

**Herramienta:** Claude Code

```
Hay algo que no me queda claro. Cada usuario debería poder filtrar las tareas sin asignar, pero también tiene sentido que puedan saber quién tiene asignada una tarea, tanto para el resto de los miembros del equipo como para el propio usuario. Esto está contemplado dentro del alcance que propusiste?
```

**Qué salió:** Reconoció que era un faltante y agregó un item al alcance.




