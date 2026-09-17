# Comparación: con harness vs. sin harness

Ticket lanzado en las dos copias: **"Implementar login en el frontend"**.

## Parte A: dos copias, un solo encargo

| Pregunta | Con harness | Sin harness |
| --- | --- | --- |
| Qué archivos tocó, contados | 14 | 11 |
| Qué convenciones del proyecto respetó y cuáles no | No se definieron convenciones | No se definieron convenciones |
| Cuántas veces tuviste que intervenir | Ninguna, por tiempo lo dejé a ambos, aunque sí le indiqué en el prompt que me preguntara. En el harness tuve que intervenir al final cuando pasó al subagente, pero no pude continuar por tiempo | Ninguna, por tiempo lo dejé a ambos, aunque sí le indiqué en el prompt que me preguntara |
| Qué te tocaría arreglar a mano |  |  |

## Parte B: las tres líneas

1. **Hasta qué pieza llegaste, y cuál te costó más de lo que esperabas.**

   Me costó tomar el proyecto sin contexto, sin saber qué teníamos en el BE. De ahí que lo primero
   que hice fue levantar un pequeño inventario para un PM, de modo que fuera simple. Luego monté
   el `AGENTS.md`; aquí sí creo que fallé porque me guié bastante en lo dado en las lecturas, y de
   ahí que casi no se me ocurrió qué decir, pues no tengo el contexto de las herramientas y el
   tiempo me jugó una mala pasada. Luego quise agregar el siguiente, que para mí era un subagente
   que, luego de finalizados los cambios, pudiera validar. Con este me sentí cómoda. Me costó, por
   el tiempo, saber si podía hacer más o si con eso era suficiente.

2. **La primera diferencia que viste entre las dos salidas, y en qué te fijaste para verla.**

   El manejo de errores en el API. Curiosamente, en el harness le indiqué que usara el validator
   como algo central, pero al final siento que el sin harness fue mucho más táctico en el manejo
   de campos que el con harness.

3. **Algo que dejaste escrito en el harness y que el agente no cumplió igualmente.**

   Siento que el manejo de errores; me parece que en mi mente tenía eso como algo relevante y no
   vi que lo hiciera, al menos no como lo esperaba.
