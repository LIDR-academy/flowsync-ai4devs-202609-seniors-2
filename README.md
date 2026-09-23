<!-- Generado desde la lección de ejercicio del módulo: no se edita a mano. -->

# Ejercicio FlowSync: monta el harness y mide la diferencia

Es la última lección del módulo y la que más se subestima: leerla son catorce minutos, **hacerla** lleva bastante más (5 de leer el stack, 15-20 de entorno y unos 45 de la tarea). Todo lo que hay que traer hecho está aquí, y solo aquí. Si algo falla en el setup, avisa a tu TA con antelación, no lo dejes para el minuto 1 del directo.

Cuatro partes. La primera explica cómo funciona el módulo, y conviene leerla aunque tengas prisa. La segunda deja el entorno listo. La tercera es la tarea, que es la que lleva tiempo de verdad. La cuarta es cómo se entrega.

---

## 🔁 Cómo funciona este módulo

Hay tres momentos, y saberlos cambia cómo aprovechas cada uno.

**1. Lo intentas tú.** Sobre el proyecto de aquí abajo, con tu agente y con el reloj puesto. Entregas lo que te salga, **con lo que tenga**. La entrega a medias no es un problema: este paso no se puntúa por completarlo.

**2. Lo ves resuelto en el directo.** El mentor monta el harness sobre este mismo proyecto y lanza **el mismo ticket que vas a usar tú**, con el harness y sin él, para que la diferencia se vea en pantalla. Si a ti no te salió, ahí ves que se puede y cómo. Por eso conviene **mirar sin teclear**: lo vas a repetir con calma después.

**3. Lo replicas.** Los prompts que use el mentor te llegan por escrito. Con ellos vuelves a tu entorno y rehaces el recorrido, que es donde se asienta.

> ⚠️ **En el paso 3 no esperes salidas idénticas, y no es un fallo tuyo.** El agente no es determinista: con el mismo prompt y el mismo código cambian los nombres, la redacción y hasta cuántos archivos toca. Lo que se repite es **la forma del recorrido**, no el texto.

---

## 🛠️ Deja el entorno listo

Cuenta con unos 5 minutos para leer el stack y 15-20 para el entorno.

### 1. Conoce el stack del proyecto: qué es y por qué

> Este máster mezcla perfiles: backend, frontend, full-stack, y también managers/PMs sin fondo técnico diario. Si ya conoces AdonisJS o React a fondo, salta directo al paso 2, el del entorno.

**¿Por qué Node.js + AdonisJS y no otra cosa?** Es una elección pedagógica, no una apuesta por "el mejor framework": Node.js reduce la fricción de entrada para una audiencia mixta, *"todo programador en algún momento ha usado JavaScript"*. Y que sea **TypeScript de punta a punta** (backend y frontend) tiene una razón muy de 2026: TypeScript superó a Python y JavaScript como lenguaje más usado en GitHub por primera vez en más de una década (Octoverse 2025). GitHub lo atribuye al *"convenience loop"* con IA: los lenguajes tipados generan guardrails más útiles para los LLMs, lo que mejora la generación de código y retroalimenta su propio uso. Es el mismo motivo por el que este proyecto es TypeScript de punta a punta.

**AdonisJS 7 (el backend, `backend/`)** es un framework de Node.js con TypeScript de punta a punta y "baterías incluidas" (routing, ORM, validación, auth ya resueltos), en el mismo espíritu que Laravel o Rails pero en TypeScript. Vas a escuchar estas capas nombradas en el directo, sin que se paren a definirlas: esta es tu chuleta:
- **Ruta** (`routes.ts`): qué URL responde a qué acción.
- **Controlador** (`controllers/*.ts`): orquesta la petición, recibe, delega, responde.
- **Validador** (VineJS, `validators/*.ts`): qué forma deben tener los datos de entrada. Es justo la pieza que un ticket de producto no siempre especifica del todo (la vas a ver en acción en la Parte 3 del directo).
- **Modelo** (Lucid, `models/*.ts`): la fila en la base de datos.
- **Migration** (`database/migrations/*.ts`): un cambio de esquema versionado en código. Nunca se edita la tabla a mano, se crea una migration nueva.
- **Transformer** (`transformers/*.ts`): qué datos exactos se devuelven al cliente (filtra lo que el modelo no debe exponer, como el hash del password).

**Importante para hoy**: el backend de FlowSync **ya existe y no se toca** en esta sesión. Solo lo vas a leer (o mejor dicho, el agente lo va a leer por ti, explorando el validador real cuando el ticket no alcanza a especificar un campo).

**React 19 + Vite (el frontend, `frontend/`)** es donde sí vas a trabajar en vivo hoy:
- **React**: librería de componentes. Construyes la UI a partir de piezas reutilizables (un formulario de login es un componente).
- **Vite**: el "motor" de desarrollo detrás, arranca un servidor casi instantáneo y empaqueta el proyecto para producción. Sustituyó a Create React App (descontinuado) como estándar de facto en 2026.
- **shadcn/ui**: no es una dependencia que se instala, son componentes que se **copian** a tu propio repo, así que se editan libremente y no engordan el `package.json`. Por eso el curso lo usa.

**Glosario rápido** (términos que vas a escuchar sin definición en el directo):

> Glosario exprés del stack: Migration (cambio de esquema de la base de datos, versionado en código, nunca a mano), Validator o VineJS (reglas que debe cumplir el body de una petición antes de procesarla), Transformer (la forma exacta de los datos que el backend devuelve al cliente), Token guard o access_tokens (el mecanismo de autenticación del backend: cada token empieza con el prefijo oat_)

📖 *Si quieres profundizar (opcional, no hace falta para el directo)*: [AdonisJS docs](https://docs.adonisjs.com), [React docs](https://react.dev), [Vite docs](https://vite.dev).

### 2. Comprueba lo que necesita tu máquina

- [ ] **Node.js 24 o superior** instalado: `node -v` responde `v24` o más. Con la 20 el proyecto no arranca (se para con `Unknown file extension ".ts"`).
- [ ] **Claude Code** instalado y autenticado (`claude` arranca en tu terminal). Docs: `code.claude.com/docs`.

### 3. Forkea y clona el proyecto

- [ ] **Tu propio fork de `LIDR-academy/flowsync-ai4devs-202609-seniors-2`, en la rama `s1/start`.** Trabajas sobre un **fork**, no sobre un clon directo del repo del curso: **no tienes permiso de escritura sobre el del curso, y no deberías tenerlo**, así que sobre un clon directo cualquier `git push` tuyo va a fallar. Son dos minutos:

  ```bash
  # 1. Fork desde la web: botón "Fork" en github.com/LIDR-academy/flowsync-ai4devs-202609-seniors-2

  # 2. Clona TU fork (no el del curso) y añade el del curso como "upstream"
  git clone git@github.com:<tu-usuario>/flowsync-ai4devs-202609-seniors-2.git
  cd flowsync-ai4devs-202609-seniors-2
  git remote add upstream git@github.com:LIDR-academy/flowsync-ai4devs-202609-seniors-2.git

  # Comprueba cómo han quedado: origin = tu fork, upstream = el del curso
  git remote -v

  # 3. Trae las ramas del curso y colócate en la de hoy
  git fetch upstream
  git checkout -b s1/start upstream/s1/start

  # 4. A partir de aquí tus cambios van a TU fork
  git push -u origin s1/start
  ```

  > 📌 **Si ya habías clonado el repo del curso, no vuelvas a clonar**: haz el fork en la web y recoloca los remotos sobre el clon que ya tienes, `git remote rename origin upstream` y `git remote add origin git@github.com:<tu-usuario>/flowsync-ai4devs-202609-seniors-2.git`. A partir de ahí, los pasos 3 y 4 son iguales.

  > 📌 **Si te sale `Permission denied (publickey)`, es SSH, no el fork.** Los comandos de arriba usan URLs SSH (`git@github.com:…`), que necesitan una clave subida a tu cuenta de GitHub. Si no la tienes, o [súbela ahora](https://docs.github.com/es/authentication/connecting-to-github-with-ssh) (cinco minutos, y te sirve para el resto del curso), o cambia las dos URLs por su versión HTTPS (`https://github.com/<usuario>/flowsync-ai4devs-202609-seniors-2.git`). Cualquiera de las dos vale; lo que no vale es descubrirlo el día del directo.

  > Si algo de esto falla, avisa a tu TA. No lo dejes para el minuto 1 del directo.

### 4. Instálalo y levántalo

- [ ] **Backend levantado** (`backend/`, AdonisJS 7):

  ```bash
  cd backend
  npm install
  cp .env.example .env
  node ace generate:key
  node ace migration:run
  npm run dev
  ```

  Verifica que responde en `http://localhost:3333`.
- [ ] **Frontend levantado** (`frontend/`, React 19 + Vite): abre otra terminal en la raíz del repo (el backend se queda corriendo en la primera):

  ```bash
  cd frontend
  npm install
  npm run dev
  ```

  Verifica que responde en `http://localhost:5173`.

### 5. Crea tu rama

Crea ahora la rama en la que vas a trabajar y entregar, antes de duplicar el proyecto en la tarea:

```bash
git checkout -b harness-<tus-iniciales>
```

---

## 📋 La tarea

> ⚠️ **Ve guardando cada prompt tal cual lo lanzas, desde el primero.** Se entregan junto con la comparación, y no valen reconstruidos: el prompt que arreglas mentalmente diez minutos después no es el que lanzaste, y es justo la diferencia que interesa mirar.

### El encuadre, y no es un consuelo

**El entregable no es el código que salga.** Es la comparación, y sobre todo **las tres líneas de la parte B**, que se escriben igual de bien aunque ninguna de las dos corridas llegue al final.

La idea que sostiene todo el módulo, que el andamiaje explica más varianza que el modelo, leída es una frase de diapositiva. La única forma de que deje de serlo es lanzar **el mismo encargo, con el mismo modelo, en dos sitios que solo se diferencian en lo que hay montado alrededor**, y mirar por dónde se separan las dos salidas. Si no se separan, eso también es un dato, y de los interesantes: quiere decir que ese encargo concreto no ejercía ninguna de las reglas que escribiste.

**El reloj tampoco es una crueldad de diseño.** Un harness real no se monta en una tarde ideal, se monta con el rato que hay antes de empezar la tarea de verdad. Lo que sale en 45 minutos es exactamente la parte que depende de tener criterio, y no la que depende de tener una herramienta mejor.

**Sobre qué se hace:** sobre el proyecto que acabas de dejar levantado, duplicado en dos copias hermanas.

**El encargo** es el mismo ticket que usa el mentor en el directo, *«Implementar login en el frontend»*. Lo creas tú en tu propio tablero de Jira, con el texto que tienes más abajo.

> ⚠️ **Resérvale un rato de verdad y ponte el reloj.** Son unos 45 minutos y hay que pararlos. Dejarlo para la noche de antes te deja con dos corridas a medias y sin haberlas comparado, que es justo la parte que vale.

---

### 🅰️ Parte A: dos copias, un solo encargo

#### 1. Duplica el proyecto, y una copia se queda pelada

Dos carpetas con el mismo código. En una montas el harness. La otra **no se toca en todo el ejercicio**: sin archivo de instrucciones, sin comprobaciones automáticas, sin atajos, sin nada.

```bash
# desde el directorio que CONTIENE tu clon, no desde dentro
cp -R flowsync-ai4devs-202609-seniors-2 flowsync-sin-harness
```

Tu clon original es la copia **con** harness: es la que tiene los remotos configurados y desde la que vas a entregar. `flowsync-sin-harness/` es solo una copia de trabajo, no se entrega y no se toca.

#### 2. Monta el harness en una sola de las dos

Las mismas piezas que monta el mentor en el directo, **en este orden**, que es el suyo:

1. **El archivo de instrucciones del agente**, generado con `/init` (`CLAUDE.md`). Se usa tal cual sale.
2. **La conexión con tu tablero de Jira**: el servidor MCP de Atlassian, a nivel de proyecto.
3. **Una skill `/priority-ticket`**: trae el ticket de mayor prioridad asignado a ti en «Por hacer», resume sus criterios de aceptación, entra en plan mode y propone cómo implementarlo; al aprobar el plan, lo mueve a «En curso».
4. **Una skill `/commit`**: un commit convencional (`tipo(scope): descripción`) a partir de los cambios preparados.
5. **Un subagente `adversarial-reviewer`**: revisa un pull request intentando romperlo, no aprobarlo, y sin editar nada.
6. **Un hook que formatea el frontend** cada vez que el agente edita un archivo. El frontend no trae formateador: instala Prettier en `frontend/` y dispáralo sobre `frontend/src/**`.
7. **Las reglas de proceso**, al final del `CLAUDE.md`: rama nueva antes de tocar código; al cerrar, `/commit` y el pull request con `gh pr create`; después, el subagente revisor sobre el pull request; y en el chat, solo la URL del pull request.
8. **`AGENTS.md` como enlace a `CLAUDE.md`**, para que lo lean también otras herramientas: `ln -s CLAUDE.md AGENTS.md`.

Cuando las tengas, **commitea el harness a mano** antes de lanzar nada. Los prompts con los que montas cada pieza los escribes tú: lo que es igual que en el directo es **qué** se monta, no cómo se lo pides al agente.

Si el reloj no da para las ocho, **para donde llegues, sin saltarte el orden**: cada pieza montada ya cuenta en la comparación, y la parte B pregunta hasta dónde llegaste.

#### 3. Un solo encargo: el ticket del directo

Crea en tu tablero de Jira este elemento de trabajo, con este texto, **asígnatelo y déjalo en «Por hacer»** (es lo que busca `/priority-ticket`):

```markdown
# Implementar login en el frontend

## Descripción
Implementar la autenticación en el frontend, consumiendo el backend de auth ya existente (`POST /api/v1/auth/signup`, `POST /api/v1/auth/login`). Usar shadcn/ui para los componentes.

## Criterios de aceptación
- Pantalla de registro (email+password) que llama a `POST /api/v1/auth/signup`.
- Pantalla de login (email+password) que llama a `POST /api/v1/auth/login` y guarda el token recibido.
- Tras login exitoso: redirige a una vista protegida (p. ej. perfil) que consuma `GET /api/v1/account/profile`.
- Credenciales inválidas en login, o email ya registrado en signup, muestran un mensaje claro — no un error genérico ni de consola.
- Enlace de navegación entre login y registro.
```

Fíjate en que es un ticket de producto aunque nombre las rutas de la API: **no dice todo lo que el backend exige**, y ese hueco es justamente donde se va a notar la diferencia entre las dos copias.

Lánzalo en las dos. En la copia con harness, con `/priority-ticket`. En la pelada, que no tiene esa skill, **escribes a mano la misma instrucción que lleva dentro**: que traiga el ticket de mayor prioridad asignado a ti, resuma sus criterios y entre en plan mode para implementarlo. Lo que se mantiene igual es el encargo, no cuántas teclas te costó mandarlo. **No apliques el plan en ninguna de las dos**: se comparan los dos planes, igual que en el directo.

> ⚠️ **No rescates a la copia pelada.** La tentación de guiarla un poco *"para que sea justo"* aparece a los cinco minutos, y es lo único que arruina el ejercicio: guiarla a mano es exactamente la variable que estás midiendo.

#### 4. La comparación

En un archivo, un lado y otro, con estas casillas:

1. **Qué archivos propone tocar**, contados.
2. **Qué convenciones del proyecto respetó y cuáles no**, nombrándolas una a una. Si en un lado no había ninguna escrita en ninguna parte, esa es la respuesta y vale.
3. **Cuántas veces tuviste que intervenir**: corregir, aclarar, repetir el encargo o pararlo en seco.
4. **Qué te tocaría arreglar a mano** antes de enseñarle eso a alguien de tu equipo.

> ⚠️ **Cuando suene el reloj, para. Aunque esté a medias.** Una casilla en blanco **es información**: dice hasta dónde llegaste. Una casilla rellenada de memoria diez minutos después es ruido con formato, y encima es indistinguible de la buena.

> ⚠️ **Ve guardando cada prompt tal cual lo lanzas, desde el primero.** Se entregan junto con la comparación, y no valen reconstruidos: el prompt que arreglas mentalmente después no es el que lanzaste, y es justo la diferencia que interesa mirar.

---

### 🅱️ Parte B: las tres líneas

Debajo de la comparación, en el mismo archivo, tres líneas anotadas. **Esta parte no se puede fallar**, y es la que hay que traer sí o sí.

1. **Hasta qué pieza llegaste, y cuál te costó más de lo que esperabas.** El número de la lista, y en qué se te fue el rato de verdad.

2. **La primera diferencia que viste entre las dos salidas, y en qué te fijaste para verla.** Ojo, no cuál fue mejor: **qué** salió distinto, concretamente, y dónde estabas mirando cuando lo notaste. Si tuviste que abrir un archivo para verlo, dilo.

3. **Algo que dejaste escrito en el harness y que el agente no cumplió igualmente.** El matiz es todo: no es lo que hizo mal la copia pelada. Es lo que tú habías dejado negro sobre blanco en el lado bueno y aun así no pasó.

> ⚠️ **Ninguna de las tres tiene respuesta correcta.** La tercera es la más incómoda y la más valiosa: si la contestas honestamente vas a llegar al directo con la pregunta correcta ya hecha.

---

### Cómo saber que la has hecho bien

- **Las tres líneas están escritas y son concretas.**
- **La tercera no dice *"lo cumplió todo"*.** Si lo dice, vuelve a mirar con calma: un archivo de instrucciones **sube la probabilidad** de que algo pase, no lo garantiza, y notar dónde se cae esa probabilidad es medio módulo.
- **El encargo es el mismo en los dos sitios**: el mismo ticket, y en la pelada la misma instrucción que lleva la skill. Si no lo es, la comparación no mide el andamiaje, mide lo bien que reescribiste el encargo la segunda vez.
- **Hay algo sin terminar.** Significa que respetaste el reloj y que no rellenaste de memoria.
- **La comparación cabe en una pantalla.** Si no cabe, estás comparando código línea a línea: quédate con las cuatro casillas.

> Entrégalo con lo que tenga.

---

## 📤 Cómo se entrega

Todo lo que produzcas va en la rama `harness-<tus-iniciales>` que creaste al dejar el entorno listo. Sube **un pull request desde tu fork**, con dos cosas dentro y ni una más:

1. **Tu archivo de comparación**, en `docs/harness/comparacion.md`. Ese directorio todavía no existe en el proyecto: créalo.
2. **`prompts.md`**, en la raíz del proyecto. Ya está ahí con la plantilla puesta.

```bash
git add docs/harness prompts.md
git commit -m "harness: comparacion con y sin harness, mas prompts"
git push -u origin harness-<tus-iniciales>
```

Con la rama empujada, GitHub te ofrece arriba el botón para abrir el pull request. Va **contra el repositorio del curso** (`github.com/LIDR-academy/flowsync-ai4devs-202609-seniors-2`), no contra tu fork.

> 🧠 **`prompts.md` no es papeleo, y es la mitad de lo que se revisa.** Lo que se mira no es solo lo que te salió, es **cómo lo pediste**: un resultado flojo con un prompt bueno y un resultado flojo con un prompt vago necesitan respuestas distintas, y sin ese archivo no se distinguen. Pega los prompts **tal cual los lanzaste**, con su modelo y su herramienta, e incluye también **los que no funcionaron**, que suelen ser los más útiles de leer.

### El plazo

**Antes del directo.** Lo que llegue a tiempo recibe el feedback de tu TA **antes de la sesión**, que es el único momento en que te sirve: llegas sabiendo dónde fallaste y miras la sesión buscando eso. Lo que llegue después se marca como recibido, pero ya no se revisa.

---

## 📚 Si vas justo de tiempo

1. ⭐ Böckeler: [*Harness engineering for coding agent users*](https://martinfowler.com/articles/harness-engineering.html) (~10 min) → refuerza el modelo mental de los 3 pilares.
2. ⭐ Chroma: [*Context Rot*](https://research.trychroma.com/context-rot) (~10 min) → refuerza el Pilar 2 (El Contexto).
3. ⭐ Anthropic: [*Prompting best practices*](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices) (~20 min, hojear) → refuerza el Pilar 3 (El Prompt).

---

## ✅ Antes de conectarte, comprueba

- [ ] Estás en la rama de partida, sobre **tu fork**, y `git push` funciona.
- [ ] `node -v` responde `v24` o más, y **Claude Code arranca** en tu terminal.
- [ ] El proyecto levanta, y tu agente lee el archivo de instrucciones al arrancar.
- [ ] **Traes tu archivo de comparación**, con sus cuatro casillas (aunque estén a medias) y sus tres líneas.
- [ ] **El encargo es el mismo en los dos lados**: mismo ticket, misma instrucción.
- [ ] **`prompts.md` está relleno**, con modelo y herramienta en cada bloque, **incluidos los que no funcionaron**.
- [ ] **El pull request está abierto.**

> Trae el archivo tal como quedó, sin maquillarlo: lo que le falta es la mitad de lo interesante.

---

## 🎯 Qué te llevas del Módulo 1

**El modelo mental**: los **tres pilares co-iguales** (la herramienta, el contexto y el prompt), donde descuidar uno no lo compensan los otros dos; que **el modelo dejó de ser el cuello de botella** y que la diferencia grande la explica el **harness**, es decir todo lo que rodea al modelo y le da con qué trabajar; que la ventana de contexto es un **techo y no un almacén**, porque la calidad se deteriora en silencio según se llena, así que la disciplina está en elegir qué entra y qué se queda fuera; y que un prompt no se juzga por lo largo que sea, sino por llevar **resultado esperado, criterios de éxito y restricciones**, que con los modelos razonadores además pide ser corto y directo.

**Lo que queda en el proyecto**: un **harness configurado y versionado**, con el archivo de instrucciones que el agente lee al arrancar, atajos propios para las tareas que el equipo repite, un subagente con su encargo escrito, una comprobación que se dispara sola al guardar y una conexión al gestor donde vive el trabajo. Encima de él, una **funcionalidad implementada de punta a punta a partir de un elemento de trabajo escrito en lenguaje de producto**, no de un encargo improvisado en el chat. Y tu propio **archivo de comparación** de la misma tarea hecha con harness y sin él, con los prompts que lanzaste al lado.

---
