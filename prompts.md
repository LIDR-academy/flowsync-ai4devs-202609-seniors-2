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

# Sin harness

---

## Prompt 1

**Modelo:** Sonet 4.5
**Herramienta:** Claude Code

```
review @tickets/ticket-1 and create a plan to execute it
```

**Qué salió:** 
Me mostro los componentes que planeaba crear, las decisiones tecnicas y me pregunto si estaba listo para implementar

---

## Prompt 2

**Modelo:** Sonet 4.5
**Herramienta:** Claude Code

```
yes, proceed with implementation
```

**Qué salió:** 
creo los componentes y lanzo la aplicacion. Funciono a la primera.

# con harness

---

## Prompt 1

**Modelo:** Sonet 4.5
**Herramienta:** Claude Code

```
review @tickets/ticket-1 
```

**Qué salió:** 
reviso los requerimientos, determino el stack utilizado, determino preguntas de aclaracion

---

## Prompt 2

**Modelo:** Sonet 4.5
**Herramienta:** Claude Code

```
us localstorage for task persistance, use a modal with an input field. colors are #8877bb and #00194a. yes task should be editable
```

**Qué salió:** 
comenzo con la implementacion del requerimiento, no funciono ya que solo desplegaba una pagina en blanco

---

## Prompt 3

**Modelo:** Sonet 4.5
**Herramienta:** Claude Code

```
I see a white page only
```

**Qué salió:** 
intento revisar la aplication y pidio lanzar la pagina en debug para mostrar los errores de consola

---

## Prompt 2

**Modelo:** Sonet 4.5
**Herramienta:** Claude Code

```
here is the error Uncaught SyntaxError: The requested module '/src/types/Task.ts' does not provide an export named 'Task' (at Calendar.tsx:2:10)
```

**Qué salió:** 
encontro el error y lo reparo. El resultado final mejor que sin harness

---

