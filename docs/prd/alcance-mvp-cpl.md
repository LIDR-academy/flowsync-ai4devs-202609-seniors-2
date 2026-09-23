# FlowSync — Alcance del MVP

> Párrafo de partida: «Quiero que FlowSync sea una herramienta para que los equipos remotos sepan
> en qué está trabajando cada uno sin tener que hacer reuniones de sincronización. Algo tipo
> tareas compartidas pero más en tiempo real y menos rollo que Jira.»

---

## 1. El terreno que ya existe

El proyecto trae una **vertical de cuenta de usuario terminada de punta a punta** —registrarse,
entrar, salir y ver el propio perfil— con sesión persistente y pantallas protegidas.

El **modelo de datos tiene una sola entidad de negocio: la persona usuaria**. No existe nada
parecido a una tarea, ni a un equipo, ni a un espacio compartido: todo eso hay que crearlo.

Consecuencia: la autenticación **no se especifica, se reutiliza**, y todo lo de abajo cuelga de un
usuario que ya sabemos identificar.

---

## 2. El interrogatorio (una ronda, cinco preguntas)

1. **¿A quién le duele y qué exactamente?** → A los pares, no a un lead. La ronda de "¿en qué estás?"
   de la daily y el goteo de interrupciones por chat. Episodio: dos personas tocaron el mismo módulo
   la misma semana; dos días perdidos.
2. **¿Qué es "tiempo real" aquí y qué decisión cambia?** → Ver los cambios sin refrescar ni preguntar.
   Es **frescura de la tarea, no presencia de la persona**. Cambia: no empezar algo que otra ya está
   tocando, y elegir lo siguiente sabiendo qué está libre.
3. **¿Sustituye al gestor de tareas o convive con él?** → **Sustituye.** Es donde se hace el trabajo,
   no donde se cuenta. Convivir exigiría doble actualización.
4. **¿De dónde sale el estado y por qué alguien lo mantendría?** → Lo teclea quien hace la tarea, en
   segundos. Se sostiene porque quien escribe **cobra en el momento**: esa lista es su propia cola de
   trabajo y su escudo contra interrupciones.
5. **¿Cuál es la frontera del equipo y cómo sabremos que funcionó?** → Un espacio único compartido,
   3–10 personas, roles planos. Funcionó si a la semana el equipo **cancela la ronda y nadie pide que
   vuelva**.

### Supuestos declarados

S1 lo decidió la ficha y solo se anota (no se construye). S2–S6 los decido yo: eran huecos.

- **S1.** Un único espacio compartido, sin entidad "equipo", sin invitaciones, sin pertenecer a varios.
- **S2.** Los estados son un conjunto **fijo y cerrado de tres**: Por hacer · En curso · Hecha. Si el
  piloto pide un cuarto, es un hallazgo, no un requisito de partida.
- **S3.** "Sin refrescar" se cumple con **segundos** de retardo, no con instantaneidad. Nadie está
  mirando la pantalla esperando el cambio.
- **S4.** El vencimiento es un **día, sin hora**: con tres husos, una hora concreta genera discusiones
  que el MVP no necesita.
- **S5.** Las tareas hechas **se quedan en la lista**. Si en una semana estorba, es información del
  piloto, no un problema a prevenir.
- **S6.** Una tarea tiene **un responsable como máximo**, y puede no tener ninguno.

---

## 3. El alcance, en cinco bloques

### 3.1 Problema

Un equipo remoto pequeño no puede saber en qué está cada uno sin interrumpir a alguien. Se paga dos
veces: en la **ronda de "¿en qué estás?"** que se come la mitad de una daily de 15 minutos con tres
husos horarios, y en el **goteo de preguntas por chat** que rompe el foco del que responde.

Cuando falla, no falla en coordinación: falla en **trabajo duplicado**. Dos personas en el mismo
módulo la misma semana porque una empezó sin que la otra se enterara.

Lo que este MVP **no** arregla, y hay que decirlo: la daily no desaparece entera. Desaparece la ronda
de estado. **Los bloqueos siguen necesitando la reunión.**

### 3.2 Usuarios

**El valor lo cobran los pares, no un responsable.** No hay reporte hacia arriba; a un manager le
daría igual, y eso es deliberado.

- **Equipos remotos de 3–10 personas**, roles planos: todos ven y editan lo mismo.
- **Primer usuario (caso de estudio, no cliente real):** 6 personas de producto SaaS, 3 husos
  horarios, hoy con un gestor de tareas pesado y una daily de 15 minutos.
- **Dos momentos, no uno:** el que **mira** ("vuelvo de una reunión, ¿qué se ha movido?") y el que
  **escribe** ("cojo esto, lo marco"). Son la misma persona en distinto rato, y por eso funciona.

### 3.3 Propuesta de valor

**El estado del equipo se ve de un vistazo, y mantenerlo cuesta dos clics sobre una lista que ya
tenías abierta.** Tres apuestas, las tres falsables:

- **Se ve sin preguntar.** El "tiempo real" no está para que sea vistoso: está para que lo que ves al
  decidir qué coges no sea de ayer.
- **Se mantiene porque quien escribe cobra en el momento.** Si el beneficio fuera solo para los demás,
  nadie actualizaría nada.
- **Frescura de la tarea, nunca presencia de la persona.** Nada de "quién está conectado": es
  vigilancia, y se rechaza a propósito, no por falta de tiempo.

**Éxito a una semana de uso real:** el equipo cancela la ronda de "¿en qué estás?" y nadie pide que
vuelva. Si la siguen haciendo igual, no funcionó.

**Riesgo #1, asumido:** si la información se queda vieja, el producto pierde el sentido. La mitigación
es que actualizar cueste dos clics, no obligar a nadie.

### 3.4 Alcance — 8 cosas, y ni una más

1. **Lista única compartida del equipo**, visible y editable por cualquiera que haya entrado.
2. **Crear una tarea escribiendo solo el título.** Sin campos obligatorios ni formulario.
3. **Cuatro atributos:** título, responsable, estado y vencimiento. Los tres últimos, después o nunca.
4. **Tres estados fijos:** Por hacer · En curso · Hecha.
5. **Cambiar estado y responsable desde la propia lista**, sin abrir un detalle. Este es el gesto de
   los dos clics, y de él depende todo lo demás.
6. **Filtrar por estado**, para centrarse en lo pendiente.
7. **La lista se actualiza sola** con los cambios de los demás, sin refrescar.
8. **Dos señales de frescura:** cuándo se tocó cada tarea por última vez, y marca de vencida.

> El punto 8 parece un adorno y no lo es: es **el instrumento que mide el riesgo #1**. Sin él, un
> piloto que fracase por datos viejos es indistinguible de uno que fracase porque la idea no vale.

### 3.5 NO-alcance — y por qué cada cosa se queda fuera

El criterio no es "no da tiempo". Es: **qué hipótesis del producto no ayuda a validar.**

**Lo que ya venía decidido fuera, con el argumento explícito:**

1. **Notificaciones push.** La señal es un resumen que espera, no un aviso que interrumpe. El producto
   existe para **dejar de interrumpir**; un push reintroduce la interrupción que vinimos a matar. Y si
   hiciera falta un aviso para que alguien mire la lista, es que la lista no vale — que es justo lo
   que queremos averiguar sin taparlo.
2. **Integración con Slack.** Igual, más uno peor: llevar el estado a un canal es tratarlo como algo
   que se *cuenta*. FlowSync es donde se *hace*.
3. **Roles y permisos.** Solo se validan donde hay jerarquía y reporte hacia arriba. Aquí no lo hay:
   construirlo es construir para un usuario que no existe.
4. **Analítica y reporting.** Quien lee un informe es el lead que hemos sacado del producto a
   propósito. Cero hipótesis validadas, y empuja hacia la vigilancia.
5. **Comentarios en tareas.** Es conversación, y la apuesta es que **el estado basta**. Con
   comentarios, actualizar deja de ser dos clics y pasa a ser escribir, que es lo que no se hace.

**Lo que recorto además, y es donde está la decisión:**

6. **Entidad "equipo", multi-espacio, invitaciones.** La hipótesis se valida con **un** equipo.
   Multi-tenencia no valida producto: valida plataforma.
7. **Sprints, estimaciones, épicas, backlog priorizado.** Es el gestor pesado del que huimos. Cada
   escalón de planificación sube el coste de mantener la tarea por encima de dos clics, y ahí muere
   el dato fresco.
8. **Subtareas y dependencias.** Si una tarea necesita descomponerse para entenderse, el estado ha
   dejado de ser una respuesta a "¿en qué estás?".
9. **Prioridad, etiquetas, proyectos.** Con 6 personas y una lista que cabe en pantalla, ordenar por
   otra dimensión no cambia **ninguna** decisión. Cada campo extra se queda viejo.
10. **Descripción larga, texto enriquecido, adjuntos.** La hipótesis de adopción es "sin campos". Un
    cuadro de texto invita a escribir, y lo escrito no se actualiza.
11. **Kanban con arrastrar y soltar.** Presenta la misma información que la lista y no añade ninguna
    decisión nueva: no puede confirmar ni refutar nada que la lista no conteste ya. Si el piloto
    fracasa, no habrá sido por la forma del tablero.
12. **Historial de cambios por tarea.** Quién movió qué y cuándo es auditoría, y la auditoría es la
    puerta de atrás a la vigilancia que rechazamos por la principal.
13. **Varios responsables por tarea.** Si hay dos, "¿quién está en esto?" vuelve a no tener respuesta
    — que es el problema entero.
14. **Buscador.** Si un equipo de 6 necesita buscar en su propia lista, el hallazgo es que el modelo
    de lista única no escala; construirlo lo taparía.
15. **Archivado, papelera, borrado con confirmación.** Las hechas se quedan (S5). Si la lista se
    ensucia en una semana, es un dato del piloto.
16. **Presencia: quién está conectado, "escribiendo ahora", avatares activos.** Rechazo deliberado:
    desplaza la señal de la tarea a la persona y convierte el producto en otra cosa.
17. **Derivar el estado de Git, PRs, CI o calendario.** Otro producto. Y el orden importa: **primero
    hay que saber si el estado sirve**; automatizar un dato que nadie mira no arregla nada.
18. **Importar del gestor actual.** Permite convivir, y convivir es doble actualización, que es como
    muere esta categoría. Sustituir es la hipótesis, no una preferencia.
19. **App móvil o nativa.** La hipótesis es que la lista se mantiene porque ya la tienes abierta
    mientras trabajas. En el móvil eso no se cumple, así que un móvil que funcionase mal no diría
    nada sobre la apuesta, y uno que funcionase bien tampoco.
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
  cómodo convivir, y convivir significa actualizar dos sitios, que es el fallo que mata esta
  categoría. Facilitarlo sería sabotear la prueba.
- **Buscador** — no ayuda a validar nada y además **tapa** un resultado que quiero ver: si un equipo
  de 6 necesita buscar en su propia lista en una semana, el modelo de lista única no se sostiene.

**3. La exclusión de la que menos seguro estoy: las notificaciones (nº 1).**

Lo que se contradice: el producto promete "llego por la mañana y veo qué se ha movido", pero el
episodio que lo justifica —dos personas en el mismo módulo— **ocurre a media mañana, no al llegar**.
Un resumen que espera no llega a tiempo de evitar ese choque; un aviso sí, pero un aviso es la
interrupción que dijimos que veníamos a eliminar. He elegido proteger el principio por encima del
episodio, y no tengo claro que sea lo correcto.

Entraría si en el piloto el equipo sigue duplicando trabajo **con la lista abierta y al día**: eso
significaría que ver no basta y que hace falta empujar. Entraría en su forma más pequeña —un aviso
dentro de la propia app cuando alguien coge una tarea, nunca fuera de ella— no push.

**Bonus — dónde la IA tenía razón y yo no.**
_[rellenar tras tu propio recorte]_
