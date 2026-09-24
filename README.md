<!-- Generado desde la lección de ejercicio del módulo: no se edita a mano. -->

# Ejercicio FlowSync: escribe la spec de lo que ya funciona

Es la última lección del módulo y la que más se subestima. Leerla son doce minutos; **hacerla, unos 70** (10 de entorno, 15 de instalación y sandbox, 45 de la tarea). No la abras la noche anterior a las 23:50.

Cuatro partes. La primera explica cómo funciona el módulo, y conviene leerla aunque tengas prisa. La segunda deja el entorno listo y te familiariza con la herramienta en un sandbox. La tercera es la tarea, que es la que lleva tiempo de verdad. La cuarta es cómo se entrega.

> Este módulo tiene **setup de herramienta**: hay que llegar con **OpenSpec instalado y funcionando**. Si algo falla, avisa a tu TA con antelación: no lo dejes para el minuto 1 del directo.

---

## 🔁 Cómo funciona este módulo

Hay tres momentos, y saberlos cambia cómo aprovechas cada uno.

**1. Lo intentas tú.** Sobre el proyecto de abajo, con tu agente, con el reloj puesto. Entregas lo que te salga, **con lo que tenga**. La entrega a medias no es un problema: este paso no se puntúa por completarlo.

**2. Lo ves resuelto en el directo.** El mentor hace este mismo ejercicio, sobre este mismo proyecto y sobre la misma superficie. Si no te salió, ahí ves que se puede y cómo. Por eso conviene **mirar sin teclear**: lo vas a repetir con calma después.

**3. Lo replicas.** Los prompts que use el mentor te llegan por escrito. Con ellos vuelves a tu entorno y rehaces el recorrido, que es donde se asienta.

> ⚠️ **En el paso 3 no esperes salidas idénticas, y no es un fallo tuyo.** El agente no es determinista: con el mismo prompt y el mismo código cambian la redacción, el orden y hasta cuántos requisitos escribe. Lo que se repite es **la forma del recorrido**, no el texto.

---

## 🛠️ Deja el entorno listo

> Aquí dejas el entorno listo y te **familiarizas con OpenSpec en un sandbox desechable**, no en el repo del proyecto: que la herramienta no sea lo nuevo cuando empiece el directo. **La tarea de más abajo no necesita OpenSpec instalado**, pero el directo sí, así que este paso no se salta.

### 1. Entorno base (10 min)

**Primero, lo que necesita tu máquina.** El proyecto funciona en **macOS** y en **Linux**, tal cual, y en **Windows dentro de WSL** (Windows Subsystem for Linux, el Linux que corre dentro de Windows). **En PowerShell no**: los atajos del `Makefile` están escritos para la terminal de macOS y Linux, así que ahí fallan aunque consigas instalar `make`.

> 🪟 **Si trabajas en Windows, haz todo lo de esta lección dentro de la terminal de Ubuntu de WSL**: el clon, Node y `make`. Lo que tengas instalado en Windows no existe dentro de WSL, y al revés. Y clona el proyecto dentro de tu carpeta de Linux (`~/…`), no en `/mnt/c`: desde ahí `npm install` va muy lento. Si aún no tienes WSL, se instala con `wsl --install` desde PowerShell **abierto como administrador**, según la [guía oficial de Microsoft](https://learn.microsoft.com/es-es/windows/wsl/install).

- [ ] **Node.js 24 o superior**: `node -v` responde `v24` o más. Con la 20 el proyecto no arranca (`make setup` se para con `Unknown file extension ".ts"`); con la 22 arranca, pero con una pantalla de avisos `EBADENGINE` porque el proyecto pide la 24. La versión **LTS** (*long term support*, la de soporte largo) de [nodejs.org/en/download](https://nodejs.org/en/download) cumple. *(OpenSpec, que instalas en el paso 2, pide la 20.19: con la 24 vas sobrado para los dos.)*
- [ ] **`make`**: `make --version` responde con un número. Si no: en macOS, `xcode-select --install`; en Linux y en WSL con Ubuntu, `sudo apt install make`.

- [ ] **Trabaja sobre tu propio fork.** Si has intentado subir tus cambios y GitHub te los ha rechazado, no es un fallo tuyo: **no tienes permiso de escritura sobre el repo del curso, y no deberías tenerlo.** La solución son dos minutos.

```bash
# 1. Fork desde la web: botón "Fork" en github.com/LIDR-academy/flowsync-ai4devs-202609-seniors-2

# 2a. Si AÚN NO has clonado: clona tu fork
git clone git@github.com:<tu-usuario>/flowsync-ai4devs-202609-seniors-2.git
cd flowsync-ai4devs-202609-seniors-2
git remote add upstream git@github.com:LIDR-academy/flowsync-ai4devs-202609-seniors-2.git

# 2b. Si YA clonaste el del curso: no vuelvas a clonar, solo recoloca los remotos
git remote rename origin upstream
git remote add origin git@github.com:<tu-usuario>/flowsync-ai4devs-202609-seniors-2.git

# 2c. Si YA clonaste tu propio fork: solo te falta el upstream
git remote add upstream git@github.com:LIDR-academy/flowsync-ai4devs-202609-seniors-2.git

# Comprueba cómo han quedado: origin = tu fork, upstream = el del curso
git remote -v

# 3. Trae las ramas del curso y colócate en la de hoy
git fetch upstream
git checkout -b s3/start upstream/s3/start

# 4. A partir de aquí tus cambios van a TU fork
git push -u origin s3/start
```

> 📌 **Si te sale `Permission denied (publickey)`, es SSH, no el fork.** Los comandos de arriba usan URLs SSH (`git@github.com:…`), que necesitan una clave subida a tu cuenta de GitHub. Si no la tienes, o [súbela ahora](https://docs.github.com/es/authentication/connecting-to-github-with-ssh) (cinco minutos, y te sirve para el resto del curso), o cambia las tres URLs por su versión HTTPS (`https://github.com/<usuario>/flowsync-ai4devs-202609-seniors-2.git`). Cualquiera de las dos vale; lo que no vale es descubrirlo el día del directo.

> 📌 **Un fork es una foto del momento, y el curso sigue publicando ramas.** Las ramas que aún no se han publicado **todavía no existen** en tu fork, y tu fork no se entera solo. Antes de arrancar el trabajo de cada módulo, corre **`git fetch upstream`** y saca la rama nueva desde ahí (`git checkout -b sN/start upstream/sN/start`). Si haces checkout de una rama y te contesta *"pathspec did not match"*, casi siempre es esto y se arregla con un `fetch`.

- [ ] Rama **`s3/start`** en tu fork: trae el harness del proyecto, el PRD, y el **backlog del equipo**.
- [ ] **Abre `docs/backlog/`**: están las historias del equipo repartidas en épicas, con sus criterios de aceptación. Algunas traen además su descomposición en tickets. Es el artefacto que dirige la implementación, y lo tienes entero en el repo.
- [ ] **Abre también `docs/backlog/README.md` y busca el orden priorizado.** No lo leas por encima: mira **cuál va la primera** y qué razón da el propio README para ponerla ahí.

> 📌 **El backlog trae más historias de las que se refinan en una demo en vivo.** No te falta nada ni te has perdido una clase. Una demo existe para **enseñarte que algo es posible y cómo se hace**, no para producir delante de ti el inventario completo de lo que te llevas: refinar un backlog entero en directo serían horas de repetir el mismo gesto. El equipo ya tenía su backlog; lo que se enseña es **cómo se construye uno**.

- [ ] Claude Code arranca y lee tu contexto.
- [ ] **El proyecto levanta entero, backend y frontend, y puedes iniciar sesión en la interfaz.** Desde la raíz del proyecto. Compruébalo ahora: descubrir que el frontend no compila es un mal comienzo.

  ```bash
  make setup   # solo la primera vez: instala backend y frontend, crea los dos .env, genera la clave y migra la base de datos
  make start   # levanta el backend en http://localhost:3333 y el frontend en http://localhost:5173, a la vez
  ```

  `make start` **se queda ocupando la terminal**: arranca los dos servidores juntos, `Ctrl-C` los para, y si uno se cae se lleva al otro. `make` a secas lista todos los atajos. **Comprueba en otra terminal que viven**: `curl -s localhost:3333/` devuelve `{"hello":"world"}`, y `http://localhost:5173` en el navegador enseña FlowSync. El frontend busca el backend en `http://localhost:3333`; si lo levantas en otro puerto, cambia `VITE_API_URL` en `frontend/.env`.

  > 🔧 **Si algo falla, casi siempre es una de estas:** `make: command not found` → falta `make`; `Unknown file extension ".ts"` durante `make setup` → tu Node es anterior a la 22; `❌ Faltan dependencias. Ejecuta primero: make setup` → te saltaste el `setup`; un puerto en uso → tienes otro proyecto corriendo en el 3333 o en el 5173: ciérralo y vuelve a lanzar.
  >
  > **Sin `make`**, los mismos pasos a mano: `npm install` dentro de `backend/` y de `frontend/`, copia en cada una su `.env.example` a `.env`, y en `backend/` ejecuta `node ace generate:key` y `node ace migration:run`. Después, `npm run dev` en cada una, en dos terminales.

> 📌 **Si vas a buscar esto en un tablero, no lo busques: manda el repositorio.** Las historias y sus tickets se materializaron en su momento como issues en el tablero `FLOW`, pero un tablero compartido se limpia entre sesiones, así que **no cuentes con encontrarlos ahí**. El propio backlog lo deja escrito (`docs/backlog/README.md`): las issues y subtareas vienen marcadas como *«hay que recrearlas»*, y **si el tablero y el repositorio se contradicen, manda el repositorio**. Un tablero sirve para seguir el trabajo (quién lo tiene, en qué estado va); los criterios de aceptación viven en el repo, que es lo que has abierto arriba. Si quieres llevar tu propio seguimiento en Jira, recréalos tú con el MCP que ya tienes conectado.

### 2. Instalar OpenSpec y explorarlo en un sandbox (15 min)
No lo inicialices en FlowSync: créate una **carpeta desechable**, fuera del repo, para ver cómo funciona sin ensuciar el proyecto.

```bash
# 1. Instalar la CLI (paquete npm global)
npm install -g @fission-ai/openspec@latest
openspec --version          # debe responder con un número de versión

# 2. Sandbox desechable, FUERA de cualquier proyecto
cd ~                        # imprescindible: vienes de dentro de flowsync-ai4devs-202609-seniors-2
mkdir openspec-sandbox && cd openspec-sandbox
openspec init               # elige "Claude Code" en el asistente; acepta el resto

# 3. Mira la estructura que creó
ls -R openspec/             # dos carpetas (specs/ y changes/) y un config.yaml
```

> ⚠️ **El `cd ~` no es decorativo.** Vienes del paso 1, y ahí te quedaste **dentro** de `flowsync-ai4devs-202609-seniors-2`. Sin salir antes, el `openspec init` inicializaría el repo del proyecto: escribiría `openspec/` y `.claude/commands/opsx/` dentro de él, que es justo lo que este paso te dice que no hagas todavía. Si ya te ha pasado, borra esas dos carpetas del repo y vuelve a empezar en `~`.

- [ ] **Abre Claude Code *dentro* de `openspec-sandbox/`**, escribe `/` y **confirma que aparecen** `/opsx:propose`, `/opsx:apply`, `/opsx:archive`. Que sea dentro del sandbox importa: `openspec init` instala los comandos en el `.claude/` **de ese proyecto**, no en tu máquina. Si abres Claude Code en otra carpeta no verás ninguno, y no será un fallo de instalación. *(Si estás dentro y aun así no aparecen, reinicia Claude Code por completo: los slash commands se cargan al arrancar.)*
- [ ] **Fíjate en las dos carpetas que crea y en que `specs/` nace vacía**: `specs/` es la verdad sobre cómo se comporta el sistema, `changes/` es lo que está en curso. Esa separación es la que sostiene el vocabulario `propose → apply → archive`. Junto a ellas verás un **`config.yaml`**: ahí es donde luego se le cuenta a OpenSpec el stack y las convenciones del proyecto. *(Si un tutorial te habla de un `openspec/project.md`, ya no existe: se retiró en la 1.0. No es un fallo de tu instalación.)*

### 3. Crea tu rama

Sal del sandbox y vuelve a tu fork de FlowSync: la rama va **en el proyecto**, no en el sandbox. Ya con el fork abierto:

```bash
git checkout -b spec-viva-<tus-iniciales>
```

Ahí va todo lo que produzcas.

---

## 📋 La tarea

> ⚠️ **Ve guardando cada prompt tal cual lo lanzas, desde el primero.** Se entregan junto con la spec, y no valen reconstruidos: el prompt que arreglas mentalmente diez minutos después no es el que lanzaste, y es justo la diferencia que interesa mirar.

### El encuadre, y no es un consuelo

Vas a escribir la spec de un código que **ya está escrito y ya funciona**. No propones nada, no cambias una línea: lees lo que hay y escribes lo que hace **hoy**.

Suena a tarea de documentación, y ahí está la trampa: no lo es. Intentar decir en `WHEN/THEN` lo que hace un código es la forma más barata que existe de auditarlo, porque te obliga a decidir, requisito a requisito, **qué es contrato y qué es casualidad**. Y esa decisión, unas cuantas veces, no vas a poder tomarla. Esas veces son el ejercicio.

**El entregable no es la spec. Son las tres listas de la parte B**, y esas se escriben igual de bien con la spec a medias.

**El reloj tampoco es una crueldad de diseño.** Escribir la spec de un sistema entero no cabe en una tarde de nadie, y por eso el ejercicio va sobre una superficie pequeña. Lo que sale en 45 minutos es exactamente la parte que depende de tener criterio, no la que depende de tener una herramienta mejor.

> 📌 **Para la tarea no hace falta OpenSpec, y no lo inicialices en el proyecto.** No se lanza ningún comando, no se inicializa nada y no se toca la configuración: solo se lee código que ya está ahí y se escribe un archivo de texto con el formato de una spec viva. El `openspec init` sobre el proyecto de verdad llega en el directo, y hacerlo antes te deja carpetas a medias que después estorban.

**Sobre qué se hace:** sobre el vertical de **cuentas y acceso** del proyecto que acabas de dejar listo (registro, inicio de sesión, sesión y perfil), que es lo que ya está construido de punta a punta. **Entero, en sus dos capas**, igual que lo hace el mentor en el directo: en el backend, sus rutas, sus controladores, el modelo de usuario, sus validadores y sus middlewares; en el frontend, las pantallas de acceso, el estado de sesión y la protección de rutas. Los prompts los escribes tú.

**Dónde se deja:** en `docs/spec-viva/<tus-iniciales>.md`. La carpeta todavía no existe en el repo; la crea tu archivo.

> ⚠️ **Resérvale un rato de verdad y ponte el reloj.** Son unos 45 minutos y hay que pararlos. Dejarlo para la noche de antes te deja con una spec larga y sin comprobar, que es justo lo que la tarea quiere que veas, pero se aprovecha mejor con tiempo de pensarlo.

### El encuadre, y no es un consuelo

**El entregable no es el alcance. Es el NO-alcance**, y la parte B de abajo es lo que hay que traer sí o sí.

Un alcance largo lo escribe cualquiera, y la IA lo escribe larguísimo. Lo que cuesta es la frontera: decir *"esto no"* de algo que suena razonable, y poder sostener por qué. Esa decisión no la delega nadie, y es la única del ejercicio que sigue valiendo cuando cambie la herramienta.

**El reloj tampoco es una crueldad de diseño.** En la vida real el alcance de un MVP tampoco se decide con tiempo infinito: se decide con la reunión encima. Lo que sale en 45 minutos es exactamente la parte que depende de tener criterio, y no la que depende de tener un modelo mejor.

### 🅰️ Parte A: la spec, con reloj

Con un agente, escribe la spec de lo que el sistema hace hoy y déjala en **un archivo versionado del proyecto**, no en el chat.

**Las dos capas, y solo ese vertical.** Lo que pasa por la API y lo que se ve en pantalla, y nada que no sea cuentas y acceso, aunque el agente se ofrezca a seguir. Que el agente escriba las dos capas es rápido; lo que no cabe en el reloj es **comprobarlo todo después**, que es donde está el ejercicio. Cuenta con no llegar a comprobar cada requisito: la parte B existe precisamente para decir hasta dónde llegaste.

**El formato lo fija esta lección, y no es negociable:**

- Arriba, un `## Purpose` de una o dos frases: para qué existe esta capability.
- Debajo, `## Requirements`, y colgando de él `### Requirement:` en los que el sistema **SHALL** hacer algo.
- Bajo cada requisito, al menos un `#### Scenario:` de cuatro almohadillas, con dos viñetas: `- **WHEN**` y `- **THEN**`. No hay casilla para el `GIVEN`: la precondición se mete dentro del `WHEN`.
- En castellano, salvo las mayúsculas de la RFC.

**Y tres reglas duras, que son las que separan este ejercicio de escribir documentación:**

1. **Nada de `ADDED`, `MODIFIED` ni `REMOVED`.** Eso es el vocabulario de un delta, y esto no es un delta: es la verdad actual del sistema. Si tu archivo tiene una de esas secciones, has escrito otra cosa.
2. **Solo comportamiento observable desde fuera.** Ni un nombre de clase, ni un nombre de archivo, ni una ruta de código. En la API, observable es la petición y la respuesta. En la pantalla, observable es lo que una persona ve y puede hacer.
3. **No toques el código.** Ni siquiera para arreglar lo que encuentres, y sobre todo para eso: lo que encuentres es material de la parte B.

> ⚠️ **Cuando suene el reloj, para. Aunque esté a medias.** Aunque falten requisitos, aunque haya escenarios sin `THEN`, aunque justo estuvieras a punto de comprobar una cosa.
>
> Una spec en la que comprobaste seis de los requisitos que escribiste y dejaste dos a medias **es información**: dice exactamente hasta dónde llegaste. Una spec completada de memoria diez minutos después es ruido con formato, y encima es indistinguible de la buena.

---

### 🅱️ Parte B: las tres listas

Debajo de la spec, en el mismo archivo. **Esta parte no se puede fallar**, y es la que hay que traer sí o sí.

**1. Cuántos requisitos escribió el agente, y cuántos comprobaste tú abriendo el código.** Los dos números, tal cual salieron. No los redondees ni los expliques. Comprobar significa haber ido a mirar si el código hace eso; leer el requisito y que suene razonable no cuenta.

**2. Las incoherencias que aparecieron al escribirla.** Una línea cada una, con **dónde se ve**. No las busques a propósito: aparecen solas, porque una regla que se cumple en casi todas partes canta en cuanto intentas escribirla como si se cumpliera siempre.

**3. Lo que no supiste decidir si era un bug o el contrato.** Al menos una, y en una frase, **qué dos lecturas se contradecían**. Esta es la lista que importa. No es lo que estaba mal: es lo que podría estar bien o mal según a quién le preguntes, y no había forma de decidirlo leyendo el código.

> 🧠 **Por qué la tercera lista siempre tiene algo dentro, y por qué eso no es un fallo tuyo.** Una spec dice lo que el sistema hace visto **desde fuera**, y hay comportamiento que desde fuera no se distingue: dos sistemas que por dentro tratan el mismo dato de maneras completamente distintas pueden responder igual a las mismas peticiones. Hay otro que no se puede confirmar sin ejecutarlo y esperar, porque solo aparece al cabo de un rato o cuando algo se llena. Y hay un tercer grupo, el interesante: comportamiento que se ve perfectamente y **aun así no sabes si alguien lo decidió o simplemente salió así**.
>
> Dejar eso en el aire, marcado, es la respuesta correcta. Un contrato que se calla donde no sabe vale mucho más que uno que rellena con seguridad fingida.

> ⚠️ **Ninguna de las tres tiene respuesta correcta.** La segunda y la tercera son mejores cuanto más incómodas: un *"no supe decidir entre estas dos lecturas"* honesto vale más que una spec completa escrita con seguridad.

---

### Cómo saber que la has hecho bien

- **Las tres listas están escritas y son concretas.** Si la tercera está vacía, vuelve a mirar: es la respuesta que da alguien que aceptó la spec en vez de contrastarla contra el código.
- **El número de comprobados es menor que el de escritos.** Casi siempre lo es, y no es un fallo tuyo: es el dato.
- **En la spec no aparece ni un nombre de archivo ni un nombre de clase.** Si aparecen, describiste la implementación y no el comportamiento, y esa spec no sobrevive al primer refactor.
- **La spec es del acceso y de nada más.** Si aparecen requisitos de las tareas o de cualquier otra parte, te saliste del vertical y estás escribiendo la spec del sistema entero otra vez.

> Entrégalo con lo que tenga.

---

## 📤 Cómo se entrega

Todo lo que produzcas va en la rama que creaste en el último paso del entorno.

Todo lo que produzcas va en la rama `alcance-<tus-iniciales>` que creaste al dejar el entorno listo. Sube **un pull request desde tu fork**, con dos cosas dentro y ni una más:

1. **Tu archivo de spec** en `docs/spec-viva/`, con los requisitos y las tres listas.
2. **`prompts.md`**, en la raíz del proyecto. Ya está ahí con la plantilla puesta.

```bash
git add docs/spec-viva prompts.md
git commit -m "spec viva: cuentas y acceso + prompts"
git push -u origin spec-viva-<tus-iniciales>
```

Con la rama empujada, GitHub te ofrece arriba el botón para abrir el pull request. Va **contra el repositorio del curso**, no contra tu fork.

> 🧠 **`prompts.md` no es papeleo, y es la mitad de lo que se revisa.** Lo que se mira no es solo lo que te salió, es **cómo lo pediste**: un resultado flojo con un prompt bueno y un resultado flojo con un prompt vago necesitan respuestas distintas, y sin ese archivo no se distinguen. Pega los prompts **tal cual los lanzaste**, con su modelo y su herramienta, e incluye también **los que no funcionaron**, que suelen ser los más útiles de leer.

### El plazo

**Antes del directo.** Lo que llegue a tiempo recibe el feedback de tu TA **antes de la sesión**, que es el único momento en que te sirve: llegas sabiendo dónde fallaste y miras la sesión buscando eso. Lo que llegue después se marca como recibido, pero ya no se revisa.

---

## 📚 Si vas justo de tiempo

- Repasa las lecciones de este asíncrono sobre los dos caminos y sobre OpenSpec en profundidad.
- 📖 OpenSpec: [*Getting started*](https://github.com/Fission-AI/OpenSpec/tree/main/docs) (~10 min, repo oficial).

> ⚠️ **Telemetría**: OpenSpec envía estadísticas anónimas (nombres de comandos y versión). Para apagarla **en la shell actual**, `export OPENSPEC_TELEMETRY=0` o `export DO_NOT_TRACK=1`; eso dura lo que dure la terminal. Para apagarla **de forma permanente**, o metes ese `export` en tu `.zshrc`/`.bashrc`, o añades `"telemetry": { "enabled": false }` al config global de OpenSpec (`~/.config/openspec/config.json`). No hay subcomando de la CLI que lo haga por ti.

---

## ✅ Antes de conectarte, comprueba

- [ ] Estás en la rama de partida, sobre **tu fork**, y `git push` funciona.
- [ ] El proyecto levanta entero, backend y frontend, y puedes iniciar sesión en la interfaz.
- [ ] `openspec --version` responde, y los comandos aparecen dentro del sandbox.
- [ ] **Traes el archivo de la tarea**, con su spec (aunque esté a medias) y sus tres listas.
- [ ] **`prompts.md` está relleno**, con modelo y herramienta en cada bloque.
- [ ] **El pull request está abierto.**

> Trae el archivo tal como quedó, sin maquillarlo: lo que le falta es la mitad de lo interesante.

---

## 🎯 Qué te llevas del Módulo 3

**El modelo mental**: dos caminos (delegación directa vs OpenSpec) y **el criterio para elegir**, sobre tres casos distintos; el loop **Explore → Plan → Execute** con el gate humano en el plan; y OpenSpec como **spec viva + delta** (como Git para requisitos), donde el momento humano es revisar el **contrato antes** del código. Y una lección de backlog: **un quick win que todavía no puedes construir no es lo primero**, porque el orden real lo fijan el valor y la dependencia.

**Lo que queda en el proyecto**: una **spec viva** en `openspec/specs/`, con sus changes archivados y trazables, de forma que se pueda leer qué se decidió, cuándo y por qué. Eso es lo que distingue haber implementado algo de haberlo dejado documentado en el mismo gesto.
