# Prompts
Inicie el cronométro al tener un archivo base del MVP con lo supuesto en la actividad.

## Configuraciones previas:
- Inicio con un documento de MVP básico al que le copie y pegue los supuestos del ejercicio
- Verificar que Codex puede conectarce al MCP de Jira
- Verificar que el AGENTS.md no necesita configuración previa

**Modelo:** GPT 6 Astra
**Herramienta:** Codex

### P 1
'''
el agents.md del proyecto esta vacio, pero el claude.md si tiene contenido, eso no afecta a codex?, el proyecto esta configurado para claude-code pero yo debo tenerlo listo para codex

cd ~/learning/AI4Devs/flowsync-ai4devs
codex

/import -- importa las configuraciones de Claude##
'''

### P2

'''
Indica qué instrucciones, skills, hooks, subagentes y servidores MCP están activos en este proyecto.
'''
Respuesta esperada y obtenida: una tabla que dicta el elemento y si tiene acceso o no, me dice que hace cada uno

--

## Pompt 1

**Modelo:** GPT 5.6 Sol Medium
**Herramienta:** Codex

'''
Tengo el pedido «Quiero que FlowSync sea una herramienta para que los equipos remotos sepan en qué está trabajando cada uno sin tener que hacer reuniones de sincronización. Algo tipo tareas compartidas pero más en tiempo real y menos rollo que Jira.» y el documento docs/prd/alcance-mvp-KC.md como contexto adicional. 

Tarea: Lee el documento e identifica las restricciones, necesidades y ayudame a definir y estructurar bien ese MVP para contruir un documento de requerimientos de producto. 

GUARDRIALS: no vamos a definir el modelo de datos robusto, no vamos a definir diagramas de arquitectura, no vamos a explotar todos los casos de uso. 

Objetivo de la sesion: un MVP definido y delimitado que solo considere las verticales ya mencionadas, este documento no lleva tablas, endponts ni arquitectura.

Antes de ejecutar cualquier cosa: 
- dime los supuestos que estas haciendo
- que entiendes del ejercicio
- pregunta las dudas
'''

Respuesta:
'''
Supuestos validados con el documento de inicio ...

  Necesito aclarar estas dudas antes de continuar:

  1. ¿El PRD está dirigido principalmente al equipo que lo implementará,
     a stakeholders de negocio o a ambos?

  2. ¿Quieres que edite docs/prd/alcance-mvp-KC.md o que cree un
     documento nuevo conservando ese archivo como fuente?

  3. ¿Hay una duración, tamaño de equipo o fecha objetivo que deba
     usarse para decidir qué cabe en el MVP?

  4. Para esta primera versión, ¿“tiempo real” debe tratarse como
     actualización automática inmediata o basta con que la información
     esté actualizada al entrar o recargar?

  5. ¿Quieres que el documento incluya métricas e hipótesis de éxito del
     MVP, aunque aún no existan valores de referencia?
'''

## Pompt 2

**Modelo:** GPT 5.6 Sol Medium
**Herramienta:** Codex

Cambio el requerimeinto de "tiempo real", bajo un supuesto de solo un developer y dos semanas de sprint. Que es como se maneja en mi equipo. Esto se hace bajo el supuesto de que no conozco los problemas que se me van a presentar y prefiero entregar algo valido que no funcione al 100% pero no requiera un re-trabajo exaustivo.

'''
Respuesta tus dudas:
1. El PRD esta dirigido a quien lo implementa y stakeholders
2. Edita el documento pero no elimines nada, todo el contenido agregalo al final para no perder de vista el punto de partida, se elimina hasta que yo lo diga 
3. Considera solo un desarrollador y dos semanas de duración
4. Basta con que este actualizada al entrar/recargar
5. si, proponlas
'''

Respuesta:
'''
• El punto de partida ya contiene una delimitación fuerte. Hay una
  contradicción que resolveré según tu aclaración más reciente: el texto
  original define “tiempo real” como cambios visibles sin refrescar,
  mientras que para este MVP basta ver el estado vigente al entrar o
  recargar. El PRD documentará esta decisión como actualización bajo
  demanda y dejará la sincronización automática fuera del alcance de
  estas dos semanas. También conservaré como riesgo central la adopción:
  si las tareas no se actualizan, el producto deja de aportar valor.
  '''

- Además agrega los cambios al repositorio, le doy permiso por que quiero validar como evolucionó con las versiones y siguientes comandos.
- Se atora en validaciones de Git por qur no esta "autenticado en este entorno". Si lo esta
- Lo detuve al revisar tiempo

## Pompt 3

**Modelo:** GPT 5.6 Sol Medium
**Herramienta:** Codex

'''
- Valida que los cambios no se salen de las delimitantes iniciales del documento
- Valida que no hay instrcucciones acotadas, es decir, todo es medible y nada se considera "vago"
- Si encuentras decisiones vagas en el documento, genera las preguntas para acotamiento
'''

Respuesta:
'''
 Aún no puede considerarse completamente acotado y medible. Encontré estas inconsistencias:

  - El texto original exige cambios sin refrescar, mientras el PRD acepta entrar o recargar: docs/prd/alcance-mvp-KC.md:10 y docs/prd/alcance-mvp-KC.md:79. La segunda decisión refleja tu
    respuesta, pero falta marcar explícitamente que sustituye a la primera.

  - El punto de partida presenta título, responsable, estado y vencimiento como contenido necesario. El PRD permite omitir responsable y vencimiento: docs/prd/alcance-mvp-KC.md:20 y docs/
    prd/alcance-mvp-KC.md:101.

  - Se promete entender “qué cambió” durante una ausencia, pero el historial está fuera del MVP: docs/prd/alcance-mvp-KC.md:51 y docs/prd/alcance-mvp-KC.md:165. La lista actual permite
    saber cómo está el trabajo, pero no qué cambió.

  - La métrica que exige responsable en el 80 % de las tareas entra en tensión con la propuesta de mantener tareas libres para que alguien las tome: docs/prd/alcance-mvp-KC.md:103 y docs/
    prd/alcance-mvp-KC.md:177.

  También quedan expresiones no verificables como “vigente”, “disponibles en el espacio”, “claramente”, “comprensible”, “estado general”, “comunicar el error” y “la mayoría”. Los límites
  de interacciones y el tiempo inferior a un minuto sí son medibles.

  Necesito estas decisiones para cerrar el PRD:

  1. ¿Confirmamos que “tiempo real” en este MVP significa exclusivamente obtener datos actualizados al entrar o recargar, y que esa decisión sustituye la definición original de
     actualización automática?

  2. ¿Para crear una tarea solo será obligatorio el título, o también deben ser obligatorios responsable y fecha de vencimiento?
  3. Si responsable y vencimiento son opcionales, ¿confirmamos que una tarea puede permanecer indefinidamente sin ambos?
  4. ¿Quién aparece como responsable elegible: cualquier usuario registrado en la aplicación o únicamente un conjunto de usuarios precargados para el piloto?
  5. ¿Debe poder retirarse el responsable de una tarea y devolverla al estado “libre”?
  6. ¿Puede cualquier integrante reasignar tareas de otras personas sin confirmación?
  7. ¿Se permite cualquier transición entre “Por hacer”, “En curso” y “Terminada”, incluida reabrir una tarea terminada?
  8. ¿El título se puede editar después de crear la tarea?
  9. ¿Eliminar o archivar tareas queda expresamente fuera del MVP?
  10. ¿“Qué cambió mientras no estaba” debe eliminarse de la promesa o quieres una señal mínima de cambios recientes? Esta última añadiría alcance.
  11. ¿La fecha de vencimiento representa un día completo, sin hora? En ese caso, ¿se considera vencida al comenzar el día señalado o al terminarlo?
  12. ¿Qué debe ocurrir visualmente cuando falla un guardado: mostrar el valor anterior con un mensaje de error o mantener el cambio pendiente para reintentarlo?
  13. ¿Cómo se ordena la lista por defecto: creación más reciente, vencimiento, estado u otro criterio?
  14. En la métrica de vigencia, ¿qué significa que un estado sea “vigente” y quién lo verifica?
  15. ¿Reemplazamos la métrica de tareas con responsable por una que no penalice las tareas libres?
  16. Para “la mayoría de las tareas”, ¿usamos un umbral concreto, por ejemplo al menos el 80 %?
  17. ¿Las métricas del piloto se medirán mediante una encuesta diaria breve y una revisión manual al final de los cinco días?
  18. ¿La ronda informativa debe omitirse durante los cinco días del piloto para considerar validada la señal principal, o basta con que se elimine al final de esa semana?

  No he modificado el documento durante esta revisión.
  '''

## Pompt 4

**Modelo:** GPT 5.6 Sol Medium
**Herramienta:** Codex

'''
estamos modificando y delimitando el PRD (alcance-mvp-KC) de este proyecto, en una sesión previa ya habías validado las inconsistencias e instrucciones "vagas". Para poder cerrar el PRD preguntaste:
  1. ¿Confirmamos que “tiempo real” en este MVP significa exclusivamente obtener datos actualizados al entrar o recargar, y que esa decisión sustituye la definición original desactualización automática?
- Si, confirmado
  2. ¿Para crear una tarea solo será obligatorio el título, o también deben ser obligatorios responsable y fecha de vencimiento?
  - solo titulo
  3. Si responsable y vencimiento son opcionales, ¿confirmamos que una tarea puede permanecer indefinidamente sin ambos?
  - si
  4. ¿Quién aparece como responsable elegible: cualquier usuario registrado en la aplicación o únicamente un conjunto de usuarios precargados para el piloto?
  - solo los precargados para el piloto
  5. ¿Debe poder retirarse el responsable de una tarea y devolverla al estado “libre”?
  - no, se marca como * para siguiente iteración, debemos definir que pasa en ese caso, no se considera por ahora
  6. ¿Puede cualquier integrante reasignar tareas de otras personas sin confirmación?
  - si
  7. ¿Se permite cualquier transición entre “Por hacer”, “En curso” y “Terminada”, incluida reabrir una tarea terminada?
  - no, son estados sequenciales, no se puede reabrir una tarea terminada, se queda como * como siguientes definiciones
  8. ¿El título se puede editar después de crear la tarea?
  - si, pero coloca una nota * de que se revisar este supuesto en siguientes versiones, una tarea termiana no debería poder editarse, re-asignarse, etc. Pendiente de revision
  9. ¿Eliminar o archivar tareas queda expresamente fuera del MVP?
  - si
  10. ¿“Qué cambió mientras no estaba” debe eliminarse de la promesa o quieres una señal mínima de cambios recientes? Esta última añadiría alcance.
  - señal minima de cambios recientes
  11. ¿La fecha de vencimiento representa un día completo, sin hora? En ese caso, ¿se considera vencida al comenzar el día señalado o al terminarlo?
  - al terminar el dia señalado
  12. ¿Qué debe ocurrir visualmente cuando falla un guardado: mostrar el valor anterior con un mensaje de error o mantener el cambio pendiente para reintentarlo?
  - mostrar cambio pendiente para otro intento
  13. ¿Cómo se ordena la lista por defecto: creación más reciente, vencimiento, estado u otro criterio?
  - estado, vencimiento y al ultimo las más reciente. Coloca una nota * para definir criterios de urgencia en el siguiente version
  14. En la métrica de vigencia, ¿qué significa que un estado sea “vigente” y quién lo verifica?
  - que la fecha de termino no haya superado la fecha del dia de hoy, lo verifica el sistema
  15. ¿Reemplazamos la métrica de tareas con responsable por una que no penalice las tareas libres?
  - no, se deben penalizar las tareas libres. Eso apunta a una mejor distribución de trabajo y resalta el hecho de tener tareas libres
  16. Para “la mayoría de las tareas”, ¿usamos un umbral concreto, por ejemplo al menos el 80 %?
  - si
  17. ¿Las métricas del piloto se medirán mediante una encuesta diaria breve y una revisión manual al final de los cinco días?
  - al final de los 5 días
  18. ¿La ronda informativa debe omitirse durante los cinco días del piloto para considerar validada la señal principal, o basta con que se elimine al final de esa semana?
  - debe omitirse
'''

Ya no me dio tiempo de ejecutar este prompt por que acabo el tiempo, di el contexto de la sesión pasada por que cerré codex por accidente.

# Parte B 

1. La IA no propuso cosas fuera de lo solicitado, no me dio tiempo de recortar, en la leída que le dí al archivo sonaba coherente pero quedaron cosas pendientes de revisar
2. Cosas que deje fuera:
- Actualización en tiempo real, por que partí del supuesto de 1 desarrollador y solo dos semanas para el desarrollo. Consideré que no podía medir el alcance del tiempo gastado en posibles errores, considerando además que si el resto funcionaba de punta a punta el "tiempo real no iba a molestar", se podía meter en una V2
- Rentringí el retirar un responsable de una tarea, al yo no tener un contexto completo decidí exluirlo para discutirlo en una segunda versión, igual eliminé cualquier tipo de transición por la misma razón
- Decidí mantener la penalización de tareas libres, permití la creación de tareas sin responsable por esos casos donde se estan definiendo y al final se dictan los responsables cuando el panorama esta más "completo", pero considerando que no podemos tener tareas libres de manera indefinida, debe haber una penalización por la falta de asignación
3. Cosas que rechacé/re-definí y no estoy segura:
- Responsable y vencimiento como requisitos al crear una tarea, pensando en distintas formas de como un equipo se organiza, di por supuesto que no eran necesarias, pero las intrucciones lo dejaban claro. Simplemente quisé ajustar el producto al equipo, pero para buenas prácticas en general es el equipo el que se debe ajustar

