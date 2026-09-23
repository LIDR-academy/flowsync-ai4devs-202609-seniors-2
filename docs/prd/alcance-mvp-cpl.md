# FlowSync — Alcance del MVP

> Párrafo de partida: «Quiero que FlowSync sea una herramienta para que los equipos remotos sepan
> en qué está trabajando cada uno sin tener que hacer reuniones de sincronización. Algo tipo
> tareas compartidas pero más en tiempo real y menos rollo que Jira.»

---

## 1. El terreno que ya existe

El proyecto no arranca vacío: trae una **vertical de cuenta de usuario terminada de punta a punta**
—registrarse, entrar, salir y ver el propio perfil— con sesión persistente entre recargas y
pantallas protegidas que echan fuera a quien no ha entrado.

El **modelo de datos actual tiene una sola entidad de negocio: la persona usuaria** (nombre, email
y credencial), más el rastro técnico de sus sesiones. **No existe nada parecido a una tarea, ni a un
equipo, ni a un espacio compartido**: todo eso hay que crearlo.

Consecuencia para el alcance: la autenticación **no se especifica, se reutiliza**, y todo lo que se
defina abajo cuelga de un usuario que ya sabemos identificar.

---

## 2. El interrogatorio (una ronda, cinco preguntas)

1. **¿A quién le duele y qué le duele exactamente hoy?** → A los pares, no a un lead. Duele la ronda
   de "¿en qué estás?" de la daily y el goteo de interrupciones por chat. Episodio concreto: dos
   personas tocaron el mismo módulo la misma semana; dos días perdidos.
2. **¿Qué significa "tiempo real" aquí, y qué decisión cambia?** → Ver los cambios de estado sin
   refrescar ni preguntar. Es **frescura de la tarea, no presencia de la persona**. La decisión que
   cambia: no empezar algo que otra ya está tocando, y elegir lo siguiente sabiendo qué está libre.
3. **¿FlowSync sustituye al gestor de tareas actual o convive con él?** → **Sustituye.** Es donde se
   hace el trabajo, no donde se cuenta. Convivir exigiría doble actualización.
4. **¿De dónde sale el estado y por qué alguien lo mantendría al día?** → Lo teclea quien hace la
   tarea, en segundos. Se sostiene porque quien escribe **cobra en el momento**: esa lista es su
   propia cola de trabajo y deja de recibir interrupciones.
5. **¿Cuál es la frontera del "equipo" y cómo sabremos que funcionó?** → Un espacio único compartido,
   3–10 personas, roles planos. Funcionó si a la semana el equipo **cancela la ronda de "¿en qué
   estás?" y nadie pide que vuelva**.

### Supuestos declarados (huecos que la ficha no cubría; decididos aquí)

- **S1.** Un único espacio compartido: todo el que tiene cuenta ve y edita las mismas tareas. Sin
  entidad "equipo", sin invitaciones, sin pertenecer a varios.
- **S2.** Los estados son un conjunto **fijo y cerrado de tres**: Por hacer · En curso · Hecha. No
  configurables. Si el piloto pide un cuarto, eso es un hallazgo, no un requisito de partida.
- **S3.** "Sin refrescar" se cumple con un retardo de **segundos**, no con instantaneidad estricta.
  Nadie está mirando la pantalla esperando el cambio.
- **S4.** La fecha de vencimiento es un **día, sin hora**: con tres husos horarios, una hora concreta
  genera discusiones que el MVP no necesita.
- **S5.** Las tareas terminadas **se quedan en la lista**. Si en una semana estorba, eso es
  información del piloto, no un problema a prevenir de antemano.
- **S6.** Una tarea tiene **un responsable como máximo**, y puede no tenerlo (nadie la ha cogido aún).

---

## 3. El alcance, en cinco bloques

### 3.1 Problema

Un equipo remoto pequeño no puede saber en qué está cada uno sin interrumpir a alguien. Eso se paga
dos veces: en la **ronda de "¿en qué estás?"** que se come la mitad de una daily de 15 minutos con
tres husos horarios, y en el **goteo de preguntas por chat** que rompe el foco del que responde.

Cuando falla, no falla en coordinación: falla en **trabajo duplicado**. Dos personas tocando el mismo
módulo la misma semana porque una empezó sin que la otra se enterara. Dos días perdidos.

Lo que este MVP **no** arregla, y hay que decirlo: la daily no desaparece entera. Desaparece la ronda
de estado. **Los bloqueos siguen necesitando la reunión.**

### 3.2 Usuarios

**Quien cobra el valor son los pares, no un responsable.** No hay reporte hacia arriba en este
producto; a un manager le daría igual, y eso es deliberado.

- **Equipos remotos de 3–10 personas**, roles planos: todos ven y editan lo mismo.
- **Primer usuario (caso de estudio, no cliente real):** equipo de 6 personas de producto SaaS, en
  3 husos horarios, que hoy sufre un gestor de tareas pesado y una daily de 15 minutos.
- **Dos momentos de uso, no uno:** el que **mira** ("vuelvo de una reunión, ¿qué se ha movido?") y el
  que **escribe** ("cojo esto, lo marco"). Son la misma persona en distinto rato, y por eso funciona.

### 3.3 Propuesta de valor

**El estado del equipo se ve de un vistazo, y mantenerlo cuesta dos clics sobre una lista que ya
tenías abierta.**

Tres apuestas, y las tres son falsables:

- **Se ve sin preguntar.** La lista se actualiza sola con lo que hacen los demás. El "tiempo real" no
  está para que sea vistoso: está para que la información que ves al decidir qué coges no sea de ayer.
- **Se mantiene porque quien escribe cobra en el momento.** Esa misma lista es su cola de trabajo y su
  escudo contra interrupciones. Si el beneficio fuera solo para los demás, nadie la actualizaría.
- **Frescura de la tarea, nunca presencia de la persona.** Nada de "quién está conectado". Eso es
  vigilancia, y lo rechazamos a propósito, no por falta de tiempo.

**Criterio de éxito a una semana de uso real:** el equipo cancela la ronda de "¿en qué estás?" y nadie
pide que vuelva. Si la siguen haciendo igual, no funcionó.

**Riesgo #1, asumido:** si la información se queda vieja, el producto pierde el sentido. La mitigación
es que actualizar cueste dos clics, no obligar a nadie. Es lo primero que hay que validar.

### 3.4 Alcance — 8 cosas, y ni una más

Una vertical fina y usable de punta a punta. Terminada, no andamiada.

1. **Lista única compartida del equipo.** Todas las tareas del espacio, visibles y editables por
   cualquiera que haya entrado.
2. **Crear una tarea escribiendo solo el título.** Sin campos obligatorios, sin formulario, sin
   decidir nada más para poder guardarla.
3. **Cuatro atributos por tarea:** título, responsable, estado y fecha de vencimiento. Los tres
   últimos se rellenan después, o nunca.
4. **Tres estados fijos:** Por hacer · En curso · Hecha. Sin configurar nada.
5. **Cambiar estado y responsable desde la propia lista**, sin abrir un detalle. Este es el gesto de
   los dos clics, y es de donde depende todo lo demás.
6. **Filtrar por estado**, para centrarse en lo pendiente.
7. **La lista se actualiza sola** con los cambios de los demás, sin refrescar.
8. **Dos señales de frescura a la vista:** cuándo se tocó cada tarea por última vez, y marca visible
   de vencida.

> El punto 8 parece un adorno y no lo es: es **el instrumento que mide el riesgo #1**. Sin él, un
> piloto que fracase por datos viejos es indistinguible de uno que fracase porque la idea no vale.

### 3.5 NO-alcance — y por qué cada cosa se queda fuera

El criterio no es "no da tiempo". Es: **qué hipótesis del producto no ayuda a validar.**

**Lo que ya venía decidido fuera, con el argumento explícito:**

1. **Notificaciones push / avisos.** La señal es un resumen que espera, no un aviso que interrumpe.
   El producto existe para **dejar de interrumpir**; un push reintroduce exactamente la interrupción
   que vinimos a matar. Y si hiciera falta un aviso para que alguien mire la lista, es que la lista
   no vale — lo cual es justo lo que queremos averiguar sin taparlo.
2. **Integración con Slack.** Mismo argumento, más uno peor: llevar el estado a un canal es tratarlo
   como algo que se *cuenta*. FlowSync es donde se *hace*.
3. **Roles y permisos.** Un modelo de permisos solo se valida donde hay jerarquía y reporte hacia
   arriba. Hemos declarado que aquí no lo hay. Construirlo es construir para un usuario que no existe.
4. **Analítica y reporting.** Quien lee un informe es el lead que hemos sacado del producto a
   propósito. Cero hipótesis validadas, y encima empuja al producto hacia la vigilancia.
5. **Comentarios en tareas.** Es conversación. La apuesta del MVP es que **el estado basta**. Y si hay
   comentarios, actualizar deja de ser dos clics y pasa a ser escribir, que es justo lo que no se hace.

**Lo que recorto además, y es donde está la decisión:**

6. **Entidad "equipo", multi-espacio, invitaciones.** La hipótesis es "ver el estado mata la ronda", y
   se valida con **un** equipo. Multi-tenencia no valida producto: valida plataforma, y es cara.
7. **Sprints, estimaciones, épicas, backlog priorizado.** Es literalmente el gestor pesado del que
   huimos. Cada escalón de planificación sube el coste de mantener la tarea por encima de dos clics,
   y ahí es donde muere el dato fresco.
8. **Subtareas y dependencias.** Misma familia. Si una tarea necesita descomponerse para entenderse,
   el estado ha dejado de ser una respuesta a "¿en qué estás?".
9. **Prioridad, etiquetas, proyectos.** Con 6 personas y una lista que cabe en pantalla, ordenar por
   otra dimensión no cambia **ninguna** decisión. Cada campo extra es un campo más que se queda viejo.
10. **Descripción larga, texto enriquecido, adjuntos.** La hipótesis de adopción es "sin campos". Un
    cuadro de texto invita a escribir, y lo escrito no se actualiza nunca.
11. **Tablero kanban con arrastrar y soltar.** Mucha UI para la misma información. Cambiar estado ya
    está resuelto en el punto 5 del alcance; el kanban es preferencia estética, no hipótesis.
12. **Historial de cambios por tarea.** Quién movió qué y cuándo es auditoría, y la auditoría es la
    puerta de atrás a la vigilancia que hemos rechazado por la puerta principal.
13. **Varios responsables por tarea.** Si hay dos, la pregunta "¿quién está en esto?" vuelve a no
    tener respuesta — que es el problema entero.
14. **Buscador.** Una lista de un equipo de 6, filtrada por estado, se lee de un vistazo. Si el
    volumen obliga a buscar, el hallazgo es que el modelo de una sola lista no escala, y eso quiero
    verlo, no esconderlo.
15. **Archivado, papelera, borrado con confirmación.** Las hechas se quedan (S5). Si la lista se
    ensucia en una semana, es un dato del piloto, no un fallo a prevenir.
16. **Presencia: quién está conectado, "escribiendo ahora", avatares activos.** Rechazo deliberado.
    Desplaza la señal de la tarea a la persona y convierte el producto en otra cosa.
17. **Derivar el estado de Git, PRs, CI o calendario.** Otro producto: integraciones y OAuth de
    terceros. Y el orden importa: **primero hay que saber si el estado sirve**; automatizar un dato
    que nadie mira no arregla nada.
18. **Importar tareas del gestor actual.** Una importación permite convivir, y convivir es doble
    actualización, que es como muere esta categoría. Sustituir es la hipótesis, no una preferencia.
19. **App móvil o nativa.** El caso de uso es "llego por la mañana / vuelvo de una reunión y miro",
    delante del mismo escritorio donde se trabaja.
20. **Recuperar contraseña, verificar email, onboarding, ajustes de cuenta.** El acceso que ya existe
    basta para un piloto de 6 personas que se conocen. Nada de esto toca la hipótesis.
21. **Estados personalizables o flujos configurables.** "Menos rollo que Jira" **es** esto. Tres
    estados fijos son la apuesta; que el equipo pida un cuarto sería un resultado del piloto.

---

## Parte B — las tres líneas

**1. Los dos números.**
La IA propuso **8** cosas dentro del alcance. Después de mi recorte quedaron **_[rellenar]_**.

**2. Tres cosas que dejé fuera, y por qué.**

- **Historial de cambios por tarea** — no valida ninguna hipótesis y contradice una: el producto
  apuesta por frescura de la tarea, no por trazabilidad de la persona. Un log es vigilancia con otro
  nombre.
- **Importar del gestor actual** — la hipótesis es que FlowSync **sustituye**. Una importación hace
  cómodo convivir, y convivir significa actualizar dos sitios, que es exactamente el fallo que mata
  esta categoría de producto. Facilitarlo sería sabotear la prueba.
- **Buscador** — no ayuda a validar nada y además **tapa** un resultado que quiero ver: si un equipo
  de 6 necesita buscar en su propia lista en una semana, el modelo de lista única no se sostiene.

**3. La exclusión de la que menos seguro estoy: las notificaciones (nº 1).**

Lo que se contradice: el producto promete "llego por la mañana y veo qué se ha movido", pero el
episodio que justifica todo —dos personas en el mismo módulo— **ocurre a media mañana, no al llegar**.
Un resumen que espera no llega a tiempo de evitar ese choque; un aviso sí, pero un aviso es la
interrupción que dijimos que veníamos a eliminar. He elegido proteger el principio ("no interrumpir")
por encima del episodio, y no tengo claro que sea lo correcto.

Entraría si en el piloto el equipo sigue duplicando trabajo **con la lista abierta y al día**: eso
significaría que ver no basta, y que hace falta empujar. En ese caso entraría la forma más pequeña
posible —un aviso dentro de la propia app cuando alguien coge una tarea, nunca fuera de ella— no
notificaciones push.

**Bonus — dónde la IA tenía razón y yo no.**
_[rellenar tras tu propio recorte: si el agente señaló una incoherencia del documento —algo que pide
lo que él mismo prohíbe, o promete algo que su alcance impide cumplir— va aquí.]_
