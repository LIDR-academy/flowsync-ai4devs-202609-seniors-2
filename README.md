<!-- Generado desde la lección de ejercicio del módulo: no se edita a mano. -->

# Ejercicio FlowSync: recorta un MVP hasta que puedas defenderlo

Es la última lección del módulo y la que más se subestima: leerla son unos minutos, **hacerla** lleva bastante más. Todo lo que hay que traer hecho está aquí, y solo aquí.

Cuatro partes. La primera explica cómo funciona el módulo, y conviene leerla aunque tengas prisa. La segunda deja el entorno listo. La tercera es la tarea, que **es la que lleva tiempo de verdad**. La cuarta es cómo se entrega y cuándo.

---

## 🔁 Cómo funciona este módulo

Hay tres momentos, y saberlos cambia cómo aprovechas cada uno.

**1. Lo intentas tú.** Sobre el proyecto de abajo, con tu agente, con el reloj puesto. Entregas lo que te salga, **con lo que tenga**. La entrega a medias no es un problema: este paso no se puntúa por completarlo.

**2. Lo ves resuelto en el directo.** El mentor recorre el mismo camino, partiendo del mismo párrafo vago y sobre este mismo proyecto. Si no te salió, ahí ves que se puede y cómo. Por eso conviene **mirar sin teclear**: lo vas a repetir con calma después.

**3. Lo replicas.** Los prompts que use el mentor te llegan por escrito. Con ellos vuelves a tu entorno y rehaces el recorrido, que es donde se asienta.

> ⚠️ **En el paso 3 no esperes salidas idénticas, y no es un fallo tuyo.** El agente no es determinista: con el mismo prompt cambian la redacción, el orden de las preguntas y hasta cuántas cosas propone meter en el alcance. Lo que se repite es **la forma del recorrido**, no el texto.

---

## 🛠️ Deja el entorno listo

Cuenta con unos 5-10 minutos.

### 1. Comprueba lo que necesita tu máquina

**Primero, lo que necesita tu máquina.** El proyecto funciona en **macOS** y en **Linux**, tal cual, y en **Windows dentro de WSL** (Windows Subsystem for Linux, el Linux que corre dentro de Windows). **En PowerShell no**: los atajos del `Makefile` están escritos para la terminal de macOS y Linux, así que ahí fallan aunque consigas instalar `make`.

> 🪟 **Si trabajas en Windows, haz todo lo de esta lección dentro de la terminal de Ubuntu de WSL**: el clon, Node y `make`. Lo que tengas instalado en Windows no existe dentro de WSL, y al revés. Y clona el proyecto dentro de tu carpeta de Linux (`~/…`), no en `/mnt/c`: desde ahí `npm install` va muy lento. Si aún no tienes WSL, se instala con `wsl --install` desde PowerShell **abierto como administrador**, según la [guía oficial de Microsoft](https://learn.microsoft.com/es-es/windows/wsl/install).

- [ ] **Node.js 24 o superior**: `node -v` responde `v24` o más. Con la 20 el proyecto no arranca (`make setup` se para con `Unknown file extension ".ts"`); con la 22 arranca, pero con una pantalla de avisos `EBADENGINE` porque el proyecto pide la 24. La versión **LTS** (*long term support*, la de soporte largo) de [nodejs.org/en/download](https://nodejs.org/en/download) cumple.
- [ ] **`make`**: `make --version` responde con un número. Si no: en macOS, `xcode-select --install`; en Linux y en WSL con Ubuntu, `sudo apt install make`.

### 2. Forkea y clona el proyecto

- [ ] **Tu fork de `LIDR-academy/flowsync-ai4devs-202609-seniors-2`, en la rama `s2/start`.** Trae el harness ya configurado: `CLAUDE.md`/`AGENTS.md`, skill, subagente, hook y el MCP de Atlassian/Jira. Si ya tienes tu fork con el remoto `upstream` apuntando al repo del curso, basta con traer la rama nueva:

  ```bash
  git fetch upstream
  git checkout -b s2/start upstream/s2/start
  ```

  Si empiezas de cero, trabaja sobre un **fork**, no sobre un clon directo del repo del curso: sobre el del curso **no tienes permiso de escritura**, así que cualquier `git push` tuyo fallaría.

  ```bash
  # 1. Fork desde la web: botón "Fork" en github.com/LIDR-academy/flowsync-ai4devs-202609-seniors-2

  # 2. Clona TU fork y añade el del curso como "upstream"
  git clone git@github.com:<tu-usuario>/flowsync-ai4devs-202609-seniors-2.git
  cd flowsync-ai4devs-202609-seniors-2
  git remote add upstream git@github.com:LIDR-academy/flowsync-ai4devs-202609-seniors-2.git
  git remote -v          # origin = tu fork, upstream = el del curso

  # 3. Trae las ramas del curso y colócate en la de hoy
  git fetch upstream
  git checkout -b s2/start upstream/s2/start

  # 4. A partir de aquí tus cambios van a TU fork
  git push -u origin s2/start
  ```

  > 📌 **Si ya habías clonado el repo del curso**, no vuelvas a clonar: haz el fork en la web y recoloca los remotos sobre el clon que ya tienes, `git remote rename origin upstream` y `git remote add origin git@github.com:<tu-usuario>/flowsync-ai4devs-202609-seniors-2.git`. Desde ahí, los pasos 3 y 4 son iguales. Y si las URLs SSH (`git@github.com:…`) te dan `Permission denied (publickey)`, es que te falta la clave en tu cuenta de GitHub: [súbela](https://docs.github.com/es/authentication/connecting-to-github-with-ssh) o usa la versión HTTPS (`https://github.com/<usuario>/flowsync-ai4devs-202609-seniors-2.git`).

  > Si el `checkout` o el `clone` fallan, avisa a tu TA. No lo dejes para el minuto 1 del directo.

### 3. Instálalo y levántalo

- [ ] **Levanta la app con `make`**, desde la raíz del proyecto. Si ya hiciste el `setup` en otro módulo, con `make start` basta.

  ```bash
  make setup   # solo la primera vez: instala backend y frontend, crea los dos .env, genera la clave y migra la base de datos
  make start   # levanta el backend en http://localhost:3333 y el frontend en http://localhost:5173, a la vez
  ```

  `make start` **se queda ocupando la terminal**: arranca los dos servidores juntos, `Ctrl-C` los para, y si uno se cae se lleva al otro. `make` a secas lista todos los atajos. **Comprueba en otra terminal que viven**: `curl -s localhost:3333/` devuelve `{"hello":"world"}`, y `http://localhost:5173` en el navegador enseña FlowSync. El frontend busca el backend en `http://localhost:3333`; si lo levantas en otro puerto, cambia `VITE_API_URL` en `frontend/.env`.

  > 🔧 **Si algo falla, casi siempre es una de estas:** `make: command not found` → falta `make`; `Unknown file extension ".ts"` durante `make setup` → tu Node es anterior a la 22; `❌ Faltan dependencias. Ejecuta primero: make setup` → te saltaste el `setup`; un puerto en uso → tienes otro proyecto corriendo en el 3333 o en el 5173: ciérralo y vuelve a lanzar.
  >
  > **Sin `make`**, los mismos pasos a mano: `npm install` dentro de `backend/` y de `frontend/`, copia en cada una su `.env.example` a `.env`, y en `backend/` ejecuta `node ace generate:key` y `node ace migration:run`. Después, `npm run dev` en cada una, en dos terminales.

### 4. Comprueba tu agente

- [ ] Claude Code arranca y **lee tu contexto** (comprueba que ve el `CLAUDE.md`/`AGENTS.md`); el **MCP de Jira** sigue conectado (lo usaremos para materializar los tickets sobre el tablero `FLOW`).
- [ ] **No instales ningún framework SDD todavía**, no se usan hoy.

### 5. Crea tu rama

Crea ahora la rama en la que vas a trabajar y entregar:

```bash
git checkout -b alcance-<tus-iniciales>
```

---

## 📋 La tarea

> ⚠️ **Ve guardando cada prompt tal cual lo lanzas, desde el primero.** Se entregan junto con el alcance, y no valen reconstruidos: el prompt que arreglas mentalmente diez minutos después no es el que lanzaste, y es justo la diferencia que interesa mirar.

### El encuadre, y no es un consuelo

**El entregable no es el alcance. Es el NO-alcance**, y la parte B de abajo es lo que hay que traer sí o sí.

Un alcance largo lo escribe cualquiera, y la IA lo escribe larguísimo. Lo que cuesta es la frontera: decir *"esto no"* de algo que suena razonable, y poder sostener por qué. Esa decisión no la delega nadie, y es la única del ejercicio que sigue valiendo cuando cambie la herramienta.

**El reloj tampoco es una crueldad de diseño.** En la vida real el alcance de un MVP tampoco se decide con tiempo infinito: se decide con la reunión encima. Lo que sale en 45 minutos es exactamente la parte que depende de tener criterio, y no la que depende de tener un modelo mejor.

---

### 🅰️ Parte A: el alcance

Unos 45 minutos, con el reloj puesto.

Partes de un párrafo vago, del tipo que llega de verdad. Es **el mismo** con el que arranca el mentor en el directo:

> «Quiero que FlowSync sea una herramienta para que los equipos remotos sepan en qué está trabajando cada uno sin tener que hacer reuniones de sincronización. Algo tipo tareas compartidas pero más en tiempo real y menos rollo que Jira.»

*"Más en tiempo real"* y *"menos rollo que Jira"* no son requisitos: son sensaciones. El trabajo es exprimirlas hasta un alcance defendible, y dejarlo escrito en `docs/prd/alcance-mvp-<tus-iniciales>.md`, no en el chat. Es el mismo recorrido que hace el mentor en la primera demo del directo, con los mismos datos de partida; **los prompts los escribes tú**.

**El formato lo fija esta lección, y no es negociable.** Tres tramos, en este orden.

**1. El terreno que ya existe (3-5 líneas).** El proyecto no es una carpeta vacía. Antes de especificar nada, que el agente te devuelva qué capabilities hay ya construidas y cómo es el modelo de datos actual, y escribe el resumen. Sirve para dos cosas: que lo que definas respete lo que ya existe, y que no vuelvas a especificar algo que ya está hecho.

**2. El interrogatorio, con las respuestas ya decididas.** Pídele a la IA que **pregunte antes de proponer**: **las cinco preguntas** que más reducirían la incertidumbre sobre el problema, los usuarios y el alcance. Acota a **una sola ronda**, y prohíbele bajar al modelo de datos o a los endpoints: si no lo acotas, abre tres rondas más y se te va la tarde.

**No inventes las respuestas: pégale entera la ficha de hechos de abajo, de una vez.** Son las respuestas del producto, ya decididas, las mismas que pega el mentor en el directo, y cubren lo que la IA pregunta casi siempre aunque lo formule distinto. Así el recorte del paso 3 se discute sobre el mismo producto que el de la sesión, y la comparación vale. Si pregunta algo que la ficha no cubre, dile que decida ella y lo marque como supuesto, y **lee los supuestos que declare al terminar**: ahí se cuelan los huecos.

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
```

Y lo que ya está decidido que queda **fuera** del MVP, por si la IA empuja funcionalidades:

```
- Fuera del MVP: notificaciones push, integración con Slack, roles/permisos avanzados, analítica/reporting, comentarios en tareas.
```

**3. El alcance en cinco bloques.** Problema · usuarios · propuesta de valor · alcance · **NO-alcance**. Que la IA lo proponga siendo agresiva recortando, y que **justifique cada exclusión**. Después recórtalo tú otra vez, porque va a proponer de más: **ese recorte es tuyo**, y es lo que se revisa.

> ⚠️ **Aquí se cuela el error más caro del ejercicio, y es tentador porque parece rigor.** Si dejas seguir a la IA, el alcance crece solo: primero el modelo de datos, después los diagramas de arquitectura, después los casos de uso, y al final los requisitos numerados, que ya son otro documento. Todo etiquetado como si fuera parte del mismo documento.
>
> No lo es. Un documento de producto **no lleva tablas, ni endpoints, ni arquitectura**: ese detalle se deriva del código y envejece a la primera. Si lo ves aparecer, súbelo de nivel o quítalo, y anótalo, porque es el hallazgo más útil que te vas a llevar del rato.

> ⚠️ **Cuando suene el reloj, para. Aunque esté a medias.** Aunque falten bloques, aunque el NO-alcance tenga dos líneas, aunque justo estuvieras a punto de resolver una duda.
>
> Un alcance con tres exclusiones bien argumentadas **es información**: dice hasta dónde llegaste decidiendo. Un alcance completado de memoria diez minutos después es ruido con formato, y encima es indistinguible del bueno.

---

### 🅱️ Parte B: las tres líneas

Debajo del alcance, en el mismo archivo, tres líneas anotadas. **Esta parte no se puede fallar**, y es la que hay que traer sí o sí.

1. **Los dos números.** Cuántas cosas propuso la IA meter dentro del alcance, y cuántas quedaron dentro después de tu recorte. Tal cual salieron, sin redondear ni explicar.

2. **Tres cosas que dejaste fuera, y por qué cada una.** El porqué tiene una forma concreta: **qué hipótesis del producto no ayuda a validar**. *"No da tiempo"* no vale, porque no es una decisión de producto: es una excusa de calendario, y mañana deja de ser cierta.

3. **La exclusión de la que menos seguro estás**, y qué tendría que pasar para que entrara. Lo que interesa es **qué dos cosas se contradecían**: lo que te pedían contra lo que veías, lo barato contra lo que valida, lo que enamora contra lo que se puede sostener.

> ⚠️ **Ninguna de las tres tiene respuesta correcta.** La tercera es mejor cuanto más incómoda: un *"no supe decidir esta"* honesto vale más que un alcance cerrado con seguridad fingida.

> 📌 **Si la IA te discutió una decisión tuya y tenía razón, apúntalo aunque no lo pida ninguna de las tres.** No es lo mismo que te proponga una funcionalidad de más que te señale una **incoherencia**: que el documento pida algo que él mismo prohíbe, o prometa algo que su propio alcance impide cumplir. Eso segundo es un fallo tuyo, y es lo más valioso que saca del rato.

---

### Cómo saber que la has hecho bien

- **El NO-alcance ocupa tanto como el alcance, o más.** Si tiene dos líneas de relleno, no recortaste: aceptaste.
- **Cada exclusión tiene su porqué escrito al lado.** Una lista de cosas descartadas sin argumento no se puede defender delante de nadie, y esa es la prueba.
- **Las tres líneas están escritas y son concretas.** Si la tercera dice *"ninguna, lo tengo todo claro"*, vuelve a mirar: es la respuesta de quien aceptó la primera propuesta.
- **El documento no tiene ni una tabla de base de datos ni un endpoint.** Si los tiene, el ejercicio se te fue a implementación, que es exactamente lo que había que evitar.
- **Cabe en una pantalla larga.** Un MVP que necesita diez páginas para describirse no es un MVP.

> Entrégalo con lo que tenga.

---

## 📤 Cómo se entrega

**Dónde se deja:** en `docs/prd/alcance-mvp-<tus-iniciales>.md`. Si el directorio no existe, créalo. Va versionado en el repositorio, no en el chat, porque un alcance que solo existe en una conversación no lo puede leer nadie después.

### El pull request

Todo lo que produzcas va en la rama `alcance-<tus-iniciales>` que creaste al dejar el entorno listo. Sube **un pull request desde tu fork**, con dos cosas dentro y ni una más:

1. **Tu archivo de alcance**, `docs/prd/alcance-mvp-<tus-iniciales>.md`, con los tres tramos y las tres líneas.
2. **`prompts.md`**, en la raíz del proyecto. La rama de partida lo trae con la plantilla puesta.

```bash
git add docs/prd prompts.md
git commit -m "alcance: MVP + prompts"
git push -u origin alcance-<tus-iniciales>
```

Con la rama empujada, GitHub te ofrece arriba el botón para abrir el pull request. Va **contra el repositorio del curso**, no contra tu fork.

> 🧠 **`prompts.md` no es papeleo, y es la mitad de lo que se revisa.** Lo que se mira no es solo lo que te salió, es **cómo lo pediste**: un alcance flojo con un prompt bueno y un alcance flojo con un prompt vago necesitan respuestas distintas, y sin ese archivo no se distinguen. Pega los prompts **tal cual los lanzaste**, con su modelo y su herramienta, e incluye también **los que no funcionaron**, que suelen ser los más útiles de leer.

### El plazo

**Antes del directo.** Lo que llegue a tiempo recibe el feedback de tu TA **antes de la sesión**, que es el único momento en que te sirve: llegas sabiendo dónde fallaste y miras la sesión buscando eso. Lo que llegue después se marca como recibido, pero ya no se revisa.

---

## 📚 Si vas justo de tiempo

Prioriza las lecciones sobre **qué es el desarrollo dirigido por especificación y por qué la planificación es hoy el cuello de botella**, **el documento de producto y la cadena de granularidad**, y **los criterios de aceptación con la IA agujereándolos**. Las dos ampliaciones 🟢 son material de consulta y no hacen falta para seguir el directo.

Y si el reloj aprieta de verdad, la prioridad es la **parte B**: tres líneas honestas valen más que un alcance largo sin recortar.

---

## ✅ Antes de conectarte, comprueba

- [ ] Estás en la rama de partida, sobre **tu fork**, y `git push` funciona.
- [ ] El proyecto levanta con `make start`, y tu agente lee el contexto del repositorio.
- [ ] **Traes el archivo de la tarea**, con sus tres tramos (aunque estén a medias) y sus tres líneas.
- [ ] **`prompts.md` está relleno**, con modelo y herramienta en cada bloque.
- [ ] **El pull request está abierto.**

> Trae el archivo tal como quedó, sin maquillarlo: lo que le falta es la mitad de lo interesante.

---

## 🎯 Qué te llevas del Módulo 2

**El modelo mental**: el desarrollo dirigido por especificación como una **spec viva que es la fuente de verdad**, y no como el análisis de siempre con un copiloto encima; la **cadena de granularidad** que baja del PRD a la épica, de ahí a la historia, al ticket y al cambio, con cada escalón respondiendo a una pregunta distinta; la diferencia entre un **PRD** (qué se construye y para quién) y una **spec** (cómo debe comportarse el sistema); el **criterio de aceptación de negocio**, que es una regla falsable, frente al escenario ejecutable, que es un caso concreto; y usar la IA para **agujerear lo escrito** en vez de para redactarlo, que es donde de verdad aporta.

**Lo que queda en el proyecto**: el **PRD del MVP versionado en el repositorio**, con su alcance, su **no alcance escrito explícitamente**, sus requisitos y sus métricas de éxito. Colgando de él, un **backlog** con las historias de las épicas que se van a construir, cada una con sus criterios de aceptación redactados como reglas de negocio comprobables, y las que entran primero partidas en tickets con su Definition of Done, priorizados y materializados como elementos de trabajo en el tablero del equipo. Y tu propio **archivo de recorte del MVP**, con lo que dejaste fuera y el argumento con el que lo defiendes.
