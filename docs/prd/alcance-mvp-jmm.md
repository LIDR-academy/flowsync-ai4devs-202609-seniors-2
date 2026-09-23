# Alcance del MVP de FlowSync

> Ejercicio del Módulo 2 · AI4Devs 2026/09 Seniors · JMM
> Punto de partida: «Quiero que FlowSync sea una herramienta para que los equipos remotos
> sepan en qué está trabajando cada uno sin tener que hacer reuniones de sincronización.
> Algo tipo tareas compartidas pero más en tiempo real y menos rollo que Jira.»

**Reloj:** inicio 19:42 — 45 min

---

## 1. El terreno que ya existe

El proyecto trae la gestión de cuenta, y nada más: registrarse con email y contraseña (el
nombre es opcional, el email no se puede repetir), iniciar sesión y seguir dentro al
recargar, ver el perfil y cerrar sesión. No se puede editar el perfil ni recuperar la
contraseña, y no hay tests escritos.

De tareas y equipos no existe nada: ni en la API, ni en las pantallas, ni en la base de
datos. Solo hay dos cosas guardadas — las personas registradas y sus sesiones abiertas.
Todo lo que entre en el alcance se construye desde cero encima del acceso ya hecho.

---

## 2. El interrogatorio

Una sola ronda, sin bajar al modelo de datos ni a endpoints. Las respuestas no las inventé
yo: le pegué entera la ficha de hechos. Lo que la ficha no cubría lo decidió ella, y está
declarado como supuesto más abajo.

### Las cinco preguntas

1. ¿Quién es el usuario principal y qué tamaño tiene su equipo? ¿Quién decide adoptar la
   herramienta, el propio equipo o su responsable?
2. ¿Qué duele hoy exactamente de las reuniones de sincronización, y para quién? ¿Qué
   pregunta concreta debería responder FlowSync con solo abrirlo?
3. ¿Qué quiere decir «más en tiempo real»?
4. ¿Qué quiere decir «menos rollo que Jira»? ¿Menos campos que rellenar, menos pasos para
   crear una tarea, menos configuración previa, o no tener que decidir sprint ni
   estimación? ¿Cuál es el mínimo que necesita una tarea para que la lista sirva de algo?
5. ¿Cómo sabréis dentro de un mes que ha funcionado, y qué tendría que dejar de pasar?
   ¿Cuánto hay que construir en esta primera versión: una funcionalidad terminada de punta
   a punta, o el armazón de varias?

> Dos notas honestas sobre este tramo:
>
> - Pidió cinco preguntas *numeradas*, y eso cumplió. Pero varias llevaban tres o cuatro
>   preguntas dentro: acoté la ronda, no el tamaño de cada pregunta.
> - Las preguntas **4 y 5 están reconstruidas** a partir del resumen de respuestas que dio
>   después, no copiadas literalmente: perdí esa parte del scroll. Las tres primeras sí son
>   textuales.

### Supuestos que declaró la IA

Lo que la ficha no cubría, decidido por ella. Aquí es donde estaban los huecos:

- **Adopción**: la decide el propio equipo, sin comprador ni aprobación de un responsable.
- **Plazo**: no hay fecha de entrega; el límite de tamaño lo marca la «vertical fina», no
  el calendario.
- **Pertenencia**: todo el que se registra entra en el único espacio compartido, sin
  invitaciones. Consecuencia: el MVP solo vale para una instancia por equipo.
- **Estados**: tres fijos y no configurables — pendiente, en curso y hecha. Toda tarea
  nueva nace en pendiente.
- **Campos obligatorios**: resuelve una contradicción de la propia ficha, que dice a la vez
  «sin campos obligatorios» y que la tarea tiene cuatro datos. Decide que solo el título es
  obligatorio, y que una tarea sin responsable se lee como «libre».
- **Responsable**: como mucho uno por tarea, y cualquiera puede asignarla o reasignarla.
- **«Qué se ha movido»**: cada tarea muestra cuándo cambió por última vez, pero no hay un
  «novedades desde tu última visita» personalizado.
- **Edición**: cualquiera puede editar y borrar cualquier tarea, sin historial de cambios.
- **Medición del éxito**: cualitativa, hablando con el equipo piloto, sin instrumentar
  métricas en el producto.
- **Plataforma e idioma**: web de escritorio, solo en castellano, sin versión móvil.

---

## 3. El alcance, en cinco bloques

### Problema

En un equipo remoto nadie ve en qué está cada uno sin interrumpir a alguien. Se paga dos
veces: la mitad de la daily se va en la ronda de «¿en qué estás?», y el resto del día en
preguntas por chat. Cuando falla, falla caro: dos personas tocaron el mismo módulo la
misma semana sin saberlo y se perdieron dos días. La parte de bloqueos de la daily es un
problema real, pero es otro: este MVP no la ataca.

### Usuarios

Equipos remotos pequeños (3–10 personas), sin jerarquía: todos ven y tocan lo mismo. El
valor lo cobran los propios compañeros, no un responsable; aquí no hay reporte hacia
arriba. Caso de estudio (no es un cliente): un equipo de producto SaaS de 6 personas,
repartido en 3 husos horarios, con un gestor de tareas pesado y una daily de 15 minutos.

### Propuesta de valor

Una lista de tareas compartida, que es a la vez la cola de trabajo de cada uno y el
estado del equipo, siempre al día sin preguntar. Quien actualiza cobra en el momento:
decide qué coge sobre esa lista y deja de recibir interrupciones. Sustituye al gestor de
tareas, no convive con él.

Hipótesis a validar:
- **H1 (riesgo #1).** Si actualizar cuesta dos clics, la gente mantiene el estado al día
  sin que nadie la obligue.
- **H2.** Con el estado del equipo visible de un vistazo, el equipo cancela la ronda de
  «¿en qué estás?» y nadie pide que vuelva (se mide tras una semana de uso real).

### Alcance

1. Crear una tarea escribiendo solo qué hay que hacer. Quién la lleva y para cuándo son
   opcionales, y una tarea sin nadie asignado se lee como «libre».
2. Cambiar el estado de una tarea (pendiente, en curso, hecha) y quién la lleva desde la
   propia lista, en dos clics.
3. Ver una única lista compartida con quién está en qué, qué está libre, qué se ha pasado
   de plazo y cuándo se movió cada tarea por última vez.
4. Filtrar la lista por estado para centrarse en lo pendiente.

Se apoya en lo ya construido (registro, acceso y cierre de sesión). Todo el que tenga
cuenta forma parte del único espacio compartido.

### NO-alcance

1. **Que la lista se actualice sola, sin refrescar**: fuera, porque no hace falta para
   validar H1, que es el riesgo #1. Si la gente no mantiene el estado al día, da igual con
   qué rapidez se propague. Y H2 se puede probar con una lista que se recarga a mano: lo
   que sustituye a la ronda de «¿en qué estás?» es que el estado esté escrito, no que
   llegue al instante. Si H1 falla, el tiempo real no salva nada; si H1 sale, entonces sí
   sabré si hace falta.
2. Notificaciones push y avisos: fuera, porque no ayudan a validar H2. La señal es un
   resumen que espera, no algo que interrumpe.
3. Integración con Slack o chat: fuera, porque no ayuda a validar H2. Además devuelve la
   conversación al sitio del que queremos sacar las preguntas.
4. Derivar el estado de Git, PRs, CI o calendario: fuera, porque no ayuda a validar H1 (y
   la invalida). La hipótesis es que la persona teclea su estado; esto sería otro producto.
5. Presencia, «quién está conectado» e indicadores de actividad: fuera, porque no ayudan a
   validar ni H1 ni H2. El estado es de la tarea, no de la persona, y lo otro es vigilancia.
6. Comentarios y conversación dentro de la tarea: fuera, porque no ayudan a validar que el
   estado se mantenga al día. Se convierten en otro canal de «¿cómo va?».
7. Sprints, estimaciones, épicas y backlog priorizado: fuera, porque no ayudan a validar
   H1, que depende de no tener que decidir nada de esto. Quien lo necesite no es el usuario.
8. Informes y analítica: fuera, porque no ayudan a validar H2. El valor es entre
   compañeros, no hacia arriba. El éxito se comprueba hablando con el equipo piloto.
9. Roles y permisos: fuera, porque no ayudan a validar H1 ni H2 en un equipo plano.
10. Varios equipos, varios espacios o gente en más de uno: fuera, porque no ayudan a validar
   H2, que se prueba dentro de un único equipo.
11. Estados o flujos configurables: fuera, porque no ayudan a validar H1. Tres estados
    fijos son precisamente el «menos rollo».
12. Descripción larga, etiquetas, adjuntos, subtareas y prioridad: fuera, porque no ayudan
    a validar que se sepa quién está en qué. Cada campo más resta velocidad y va contra H1.
13. Editar el texto y borrar tareas: fuera, porque no ayudan a validar H1 ni H2. Una tarea
    equivocada se marca como hecha.
14. Varios responsables por tarea: fuera, porque no ayudan a validar H2. «Quién está en
    qué» necesita una respuesta, no una lista.
15. «Novedades desde tu última visita» personalizadas: fuera, porque no ayudan a validar
    H2 más de lo que ya hace ver cuándo se movió cada tarea.
16. Marcar y gestionar bloqueos: fuera, porque no ayudan a validar H2. La parte de
    bloqueos de la daily se queda como está, a propósito.
17. Importar tareas de otro gestor: fuera, porque no ayuda a validar H1 ni H2, que se
    prueban empezando de cero. Convivir o migrar es otro problema.
18. Aplicación móvil y otros idiomas: fuera, porque no ayudan a validar H2. El caso es
    «llego o vuelvo de una reunión y miro la lista» en web.

---

## Parte B — las tres líneas

<!-- Esta parte NO se puede fallar. Si el reloj aprieta, esto antes que nada. -->

**1. Los dos números.** La IA propuso meter **5** cosas dentro del alcance; después de mi
recorte quedaron **4**.

**2. Tres cosas que dejé fuera, y por qué.**

1. **Derivar el estado de Git, PRs o CI.** Fuera, porque no solo no ayuda a validar H1: la
   invalida. H1 dice que la gente mantiene el estado al día porque cuesta dos clics. Si el
   estado lo deduce una integración, eso no se prueba nunca — estaría midiendo otro
   producto.
2. **Comentarios y conversación dentro de la tarea.** Fuera, porque no ayuda a validar H2.
   El «¿cómo va?» volvería al producto por otra puerta, que es exactamente la conversación
   que quiero sacar de la daily.
3. **Presencia y «quién está conectado».** Fuera, porque no ayuda a validar ni H1 ni H2, y
   además cambia de qué va el producto: el estado es de la tarea, no de la persona. Mirar a
   la persona es vigilancia, y lo rechazo a propósito.

**3. La exclusión de la que menos seguro estoy, y qué tendría que pasar para que entrara.**

**Que la lista se actualice sola, sin refrescar.** Es lo único que el encargo pedía por su
nombre — «más en tiempo real» — y es lo que he sacado.

Lo que se contradecía: **lo que me pedían contra lo que valida**. El tiempo real es, con
diferencia, la parte más cara del MVP, y no prueba H1, que es el riesgo #1: si la gente no
escribe su estado, da igual a qué velocidad se propague. Pero si me equivoco, me equivoco
en lo que hace distinto al producto, no en un detalle.

Entraría si H1 sale bien y aun así el equipo no cancela la ronda de «¿en qué estás?». Eso
significaría que el problema no es que el estado no esté escrito, sino que no llega a
tiempo — y entonces el tiempo real deja de ser un lujo y pasa a ser lo que valida H2.

---

## Hallazgos

### No intentó bajar a implementación, y eso fue lo raro

Esperaba pelearme con tablas y endpoints y no pasó: al pedirle explícitamente que lo que no
cabía en un documento de producto me lo dijera aparte, lo hizo. Se guardó el mecanismo de
tiempo real, el campo de «última modificación» y las reglas de borde, y me los listó en el
chat en vez de colarlos. La regla funcionó porque le di **dónde poner** lo que no cabía, no
solo la prohibición.

### Me discutió, y tenía razón — cinco veces

Le pedí que buscara incoherencias internas y encontró ocho. Las que son fallo mío:

1. **Argumenté una exclusión por coste, que es lo que el enunciado prohíbe.** El NO-alcance
   del tiempo real decía «es, con diferencia, la parte más cara del MVP». Eso es un
   argumento de calendario disfrazado, el mismo «no da tiempo» que no vale. Reescrito como
   argumento de validación.
2. **El episodio fundacional no lo evita el MVP que he definido.** El problema se justifica
   con dos personas tocando el mismo módulo la misma semana. Sin actualización automática,
   si alguien deja la lista abierta y empieza algo a las 11:00, vuelve a pasar. La promesa
   «siempre al día sin preguntar» no se sostiene con una lista que se recarga a mano.
3. **Saco el tiempo real, que la ficha daba como hecho, no como opinión.** La ficha define
   «tiempo real» como ver los cambios sin refrescar. Lo he excluido igualmente. Está
   declarado en la tercera línea, pero es una decisión que va contra un dato dado.
4. **Prometo enseñar lo vencido y no dejo corregirlo.** El alcance muestra qué se ha pasado
   de plazo, pero solo se puede cambiar estado y responsable, y editar está fuera. Una
   fecha mal puesta no se arregla nunca y el aviso de vencido se queda para siempre.
5. **«Marcar como hecha» una tarea equivocada ensucia justo lo que el producto enseña.** La
   lista mostraría como terminado trabajo que nunca se hizo.

Y una contradicción entre tramos: el tramo 2 declara el supuesto de que cualquiera puede
editar y borrar, y el NO-alcance lo excluye. El documento no dice que el recorte lo anuló.

### Lo que me llevo

Que la IA proponga una feature de más se ve venir. Que te demuestre que **tu propio
documento no cumple lo que promete** es otra cosa, y no lo habría visto solo. El pase final
—pedirle que agujeree lo escrito en vez de que lo redacte— ha valido más que los otros
cinco prompts juntos.
