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

---



## Prompt 1

**Modelo:** Cursor Grok 4.6
**Herramienta:** Cursor

```
Crea un archivo AGENTS.MD para este proyecto, en la raiz. Obten las convenciones de este proyecto leyendo el código fuente y los archivos de configuración. Ten presente que existen dos carpetas, una para backend y otra para frontend. Entonces debes indicarlo, adicional debes crear un AGENTS.MD dentro de cada folder, uno AGENTS.md dentro de la carpeta backend y otro dentro de la carpeta frontend. Los archivos AGENTS.MD dentro de cada folder deben ser más específicos, con más detalles propios de cada layer. Adicional debes indicar como se deben correr las pruebas unitarias, si no existe manera de correr las pruebas unitarias en cada proyecto, indica el enfoque más común dependiendo del stack del proyecto. 
```

**Qué salió:** La parte de pruebas unitarias fué confusa porque el frontend no estaba listo para ejecutarlas (No tenía pruebas unitarias ni tampoco en los paquetes definida alguna librería para ejecutarlas). Entonces tuve que pedir que lo borrara mejor en el siguiente prompt.

## Prompt 2

**Modelo:** Cursor Grok 4.6 

**Herramienta:** Cursor

```
Remueve la parte de ejecución de pruebas unitarias del AGENTS.md
```

**Qué salió:** Funcionó a la primera

## Prompt 3

**Modelo:** Cursor Grok 4.6 

**Herramienta:** Cursor

```
Configura un hook para este proyecto, que se dispare cuando se hagan implementaciones de frontend dentro de la carpeta frontend.  Esto lo debe disparar Cursor automaticamente una vez se termine de hacer una implementación (cuando el agente termine de editar).  Este hook debe ejecutar el linter para formatear el código automáticamente
```

**Qué salió:** Funcionó a la primera

## Prompt 4

**Modelo:** Cursor Grok 4.6 

**Herramienta:** Cursor

```
Implementa la siguiente historia de usuario "Narrativa

Como usuario del portal que administra la documentación de un negocio
Quiero contar con un gestor visual de archivos y carpetas donde pueda organizar, cargar, renombrar y eliminar documentos
Para que la documentación quede estructurada, identificable y consultable sin depender de canales externos.

Alcance Principal

Se construye un módulo de Gestor Documental con navegación por carpetas y carga de archivos. El módulo permite crear una estructura jerárquica de carpetas (con subcarpetas), ingresar a ellas y administrar los archivos contenidos en cada nivel.

La carga acepta únicamente documentos ofimáticos (PDF, Word, Excel) e imágenes, con un límite de 50 MB por archivo. Cualquier otro formato —en particular video y audio— es rechazado por la interfaz antes de iniciar la transferencia.

Cada archivo se representa con un ícono propio según su tipo y expone su metadata (nombre, tipo, tamaño y fecha de carga). Cada carpeta expone su propia metadata: fecha de creación, cantidad de elementos y peso total, entendido como la suma del peso de todos sus archivos más el de los archivos contenidos en sus subcarpetas, de forma recursiva.

La interfaz usa una paleta base clara y reserva colores de mayor contraste para los botones de acción, de modo que las acciones primarias y destructivas se identifiquen de inmediato.

Requerimientos
Estructura de carpetas: el usuario puede crear carpetas en la raíz y dentro de cualquier carpeta existente, asignándoles un nombre.
Navegación: el usuario puede ingresar a una carpeta, ver su contenido y regresar a niveles anteriores mediante una ruta de navegación (breadcrumb).
Eliminación de carpetas: el usuario puede eliminar una carpeta; la acción requiere confirmación explícita e informa que se eliminará también todo su contenido.
Carga de archivos: dentro de cualquier carpeta el usuario puede cargar uno o varios archivos, por selección o arrastre.
Tipos permitidos: PDF, Word (.doc, .docx), Excel (.xls, .xlsx) e imágenes (.jpg, .jpeg, .png). Cualquier otro formato, incluidos video y audio, es rechazado con mensaje de error.
Límite de tamaño: no se permite cargar archivos con peso superior a 50 MB.
Iconografía por tipo: cada archivo se muestra con un ícono distintivo según su formato.
Renombrar archivo: el usuario puede modificar el nombre de un archivo conservando su extensión original.
Eliminar archivo: el usuario puede eliminar un archivo, previa confirmación.
Metadata de archivo: el sistema muestra nombre, tipo, tamaño en unidad legible (KB/MB) y fecha de carga.
Metadata de carpeta: el sistema muestra fecha de creación, cantidad de elementos y peso total calculado de forma recursiva.
Lineamiento visual: fondo y superficies en tonos claros; botones de acción en colores de alto contraste, diferenciando acción primaria de acción destructiva.

Supuestos: la eliminación es definitiva (no se contempla papelera en esta historia); los nombres de carpeta y archivo deben ser únicos dentro de un mismo nivel; no se contemplan permisos diferenciados por usuario en este alcance.

Criterios de Aceptación

AC1: Creación de una carpeta

Dado que el usuario se encuentra en el gestor documental
Cuando selecciona la acción "Nueva carpeta" e ingresa un nombre válido
Entonces el sistema crea la carpeta en el nivel actual
Y la muestra en el listado con su fecha de creación y peso total en cero.

AC2: Creación de subcarpetas

Dado que el usuario se encuentra dentro de una carpeta existente
Cuando crea una nueva carpeta
Entonces el sistema la crea como subcarpeta del nivel actual
Y actualiza la ruta de navegación al ingresar a ella.

AC3: Nombre de carpeta duplicado

Dado que el usuario está creando una carpeta en un nivel
Cuando ingresa un nombre que ya existe en ese mismo nivel
Entonces el sistema no crea la carpeta
Y muestra un mensaje indicando que el nombre ya está en uso.

AC4: Eliminación de una carpeta con contenido

Dado que el usuario visualiza una carpeta que contiene archivos o subcarpetas
Cuando selecciona la acción de eliminar
Entonces el sistema solicita confirmación advirtiendo que se eliminará todo el contenido
Y al confirmar elimina la carpeta y sus elementos del listado.

AC5: Carga de un archivo permitido

Dado que el usuario se encuentra dentro de una carpeta
Cuando carga un archivo PDF, Word, Excel o imagen de hasta 50 MB
Entonces el sistema almacena el archivo en esa carpeta
Y lo muestra en el listado con su ícono correspondiente, su tamaño y su fecha de carga.

AC6: Rechazo por tipo de archivo no permitido

Dado que el usuario intenta cargar un archivo de video, audio o cualquier formato no contemplado
Cuando selecciona o arrastra el archivo
Entonces el sistema no inicia la carga
Y muestra un mensaje indicando los formatos permitidos.

AC7: Rechazo por tamaño excedido

Dado que el usuario intenta cargar un archivo de formato permitido
Cuando el peso del archivo supera los 50 MB
Entonces el sistema no inicia la carga
Y muestra un mensaje indicando el límite máximo permitido.

AC8: Renombrar un archivo

Dado que el usuario visualiza un archivo dentro de una carpeta
Cuando selecciona la acción de renombrar e ingresa un nuevo nombre válido
Entonces el sistema actualiza el nombre del archivo conservando su extensión
Y mantiene sin cambios su tamaño y fecha de carga.

AC9: Eliminación de un archivo

Dado que el usuario visualiza un archivo dentro de una carpeta
Cuando selecciona la acción de eliminar y confirma
Entonces el sistema elimina el archivo del listado
Y descuenta su peso del peso total de la carpeta y de las carpetas superiores.

AC10: Consulta de metadata de un archivo

Dado que el usuario visualiza un archivo cargado
Cuando consulta su detalle
Entonces el sistema muestra nombre, tipo, tamaño en unidad legible y fecha de carga.

AC11: Consulta de metadata de una carpeta con contenido anidado

Dado que una carpeta contiene archivos y subcarpetas con archivos
Cuando el usuario consulta la metadata de la carpeta
Entonces el sistema muestra su fecha de creación, la cantidad de elementos y el peso total
Y el peso total corresponde a la suma del peso de sus archivos más el de todos los archivos contenidos en sus subcarpetas en cualquier nivel.

AC12: Identificación visual de acciones

Dado que el usuario se encuentra en cualquier vista del gestor documental
Cuando visualiza la interfaz
Entonces las superficies y el fondo se presentan en tonos claros
Y los botones de acción se presentan en colores de alto contraste, diferenciando la acción primaria de la acción destructiva."
```

**Qué salió:** Comenzó a desarrollar backend y eso no lo estaba esperando.

## Prompt 5



**Modelo:** Cursor Grok 4.6 

**Herramienta:** Cursor

```
Aclaración: construye solo el frontend. No toques nada del backend
```

**Qué salió:** Funcionó a la primera

## Prompt 6

**Modelo:** Cursor Grok 4.6 

**Herramienta:** Cursor

```
Revisa cuales convenciones no respetaste, las que estan en los archivos AGENTs.MD
```

**Qué salió:** Identificó una convención. Esto me ayudo para la comparación.

## Prompt 7

**Modelo:** Cursor Grok 4.6 

**Herramienta:** Cursor

```
Cual Modelo se usó para estos prompts anteriores ?
```

**Qué salió:** Funcionó a la primera. Se hizo esta pregunta porque Cursor estaba configurado en Modo Auto Balance, entonces el modelo usado no estaba explícito. 