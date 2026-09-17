## Parte A: dos copias, un solo encargo

| Pregunta | Con harness | Sin harness |
| --- | --- | --- |
| Qué archivos tocó, contados | 7 | 4 |
| Qué convenciones del proyecto respetó y cuáles no | Respeto el feature folder deevelopment | No se definieron convenciones |
| Cuántas veces tuviste que intervenir | Ninguna | Ninguna |
| Qué te tocaría arreglar a mano | nada | nada |

## Parte B: las tres líneas

1. **Hasta qué pieza llegaste, y cuál te costó más de lo que esperabas.**

   Monté un AGENTS.md con el comando /init de claude y lo complete con una especificación de seguir feature folder especification, añadí un SKILL para formatear el código antes de hacer un commit.

2. **La primera diferencia que viste entre las dos salidas, y en qué te fijaste para verla.**

   El desarrollo con harness fue mucho más detallado con separación de piezaas en hooks, api's y tipado más concreto.
   Sin harness hizo el trabajo en 3 archivos, sin tanto detalle, siendo menos reutilizable.

3. **Algo que dejaste escrito en el harness y que el agente no cumplió igualmente.**

   Como no hizo commit no se ejecuto el SKILL.