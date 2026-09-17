# Comparación

Comparación de resultados `flowsync-ai4devs-202609-seniors-2` con harness y sin harness

|  | ✅ Con harness | 🛡️ Sin harness | 
|---|---|---|
| ¿Qué archivos tocó?| 9 (todos frontend) | 9 (todos frontend) |
| ¿Qué convenciones del proyecto respetó y cuáles no?| Todas las indicadas |No detecté inconsistencias |
| ¿Cuántas veces tuviste que intervenir?| 3 | 0 |
| ¿Qué te tocaría arreglar a mano?| Diseño gráfico | "Nada" |


## ¿Qué piezas montaste y cuál te costó más de lo que esperabas?
Solamente se creó CLAUDE.md usando /init para luego pasar su contenido a AGENT.md y se agregaron algunas cuantas instrucciones adicionales muy generales en AGENTS.md.
No hubo mayor inconveniente en esto, pero al ser mi primera vez utilizando Claude, el mayor tiempo invertido fue conocimiento como utilizar la herramienta.

## La primera diferencia que viste entre las dos salidas, y en qué te fijaste para verla
Por indicaciones en el harness, generó un plan previo a la implementación, que ya definía el alcance técnico para poder revisar y ajustarlo si hacía falta antes de iniciar con la implementación así como 4 aclaraciones solicitadas por la IA para continuar. Mientras que la versión sin harness se fue directo a implementar el cambio.
Ahora, curiosamente, la versión con harness pidió mi intervención en par de ocasiones por errores de compilación y cuál solución aplicar, mientras que la versión sin harness implementó la totalidad del requerimiento sin intervención de mi parte e hizo un diseño gráfico "más atractivo" respecto a la versión con harness (no había lineamiento definido respecto a identidad gráfica).

## Algo que dejaste escrito en el harness y que el agente no cumplió igualmente
Hacer unicamente commit (no push), no hizo el commit, dejó los cambios sin commitear.
