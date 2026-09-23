# Comparación: con harness vs. sin harness

Las dos ejecuciones consiguieron implementar correctamente el flujo de login y, en ambos casos, el agente fue capaz de inspeccionar la API existente y validar la solución contra el backend real. La diferencia no estuvo tanto en que una solución funcionara y la otra no, sino en la forma en que cada agente abordó el trabajo y estructuró la implementación.

## Corrida con harness

La ejecución con harness tardó 6 minutos y 15 segundos y terminó tocando 8 archivos funcionales del frontend.

El agente respetó las principales reglas definidas: trabajó sobre el frontend, no instaló nuevas dependencias, utilizó Git únicamente para operaciones de lectura y ejecutó las validaciones existentes de lint y build. También utilizó el backend como fuente de contexto para entender el contrato real de la API.

Durante la implementación detectó que la respuesta exitosa del backend venía envuelta en una estructura { data: ... }, algo que no estaba correctamente reflejado en el contexto inicial. En lugar de mantener esa suposición, probó la API real y corrigió la implementación.

La solución quedó más separada por responsabilidades: creó una capa para consumir la API, un componente específico para el formulario de login y otro componente para mostrar la información del usuario autenticado. También implementó persistencia de sesión, consulta del perfil y logout, aunque algunas de estas funcionalidades iban más allá de lo estrictamente solicitado en el ticket.

No fue necesario corregir ni aclarar el encargo durante la ejecución. La única decisión manual fue rechazar el acceso opcional a Chrome.

Al levantar el backend aparecieron varios archivos generados bajo backend/.adonisjs/ como modificados por diferencias de finales de línea. No hubo cambios funcionales de código en el backend, pero esto mostró que la regla de "backend de solo lectura" no quedaba completamente garantizada frente a efectos secundarios producidos por la ejecución de comandos.

## Corrida sin harness

La ejecución sin harness tardó 4 minutos y 50 segundos y tocó 6 archivos del frontend.

Aunque no existían instrucciones adicionales ni mecanismos automáticos de control, el agente también entendió correctamente el proyecto, inspeccionó la API existente, probó credenciales válidas e inválidas y dejó una implementación funcional.

No realizó cambios en el backend ni instaló dependencias. También ejecutó comprobaciones de tipos, lint y build antes de dar por terminado el trabajo.

La solución fue algo más compacta que la generada con harness. Separó el acceso a autenticación y el formulario de login, pero mantuvo una mayor parte del comportamiento posterior al login dentro de App.tsx. También creó un archivo frontend/.env.example para documentar la URL de la API, algo que la versión con harness no hizo.

Tampoco fue necesaria ninguna intervención correctiva durante esta ejecución.

## Conclusión de la comparación

En este ticket concreto, la diferencia entre trabajar con harness y sin harness fue menor de lo que esperaba. Las dos corridas produjeron una solución funcional y ambas fueron capaces de descubrir por sí mismas el contrato real de la API.

La corrida con harness mostró una implementación algo más estructurada y estuvo acompañada de reglas explícitas y mecanismos automáticos de control. Sin embargo, la corrida sin harness fue más rápida y también respetó correctamente las restricciones principales del ticket.

Esto me deja como aprendizaje que un harness no necesariamente produce una diferencia evidente en cualquier tarea. En este caso, el modelo ya tenía suficiente capacidad para explorar el repositorio y tomar buenas decisiones sin demasiada orientación adicional. Para medir mejor el valor del harness probablemente sería necesario probar tareas donde existan más convenciones internas, restricciones de arquitectura o decisiones que el agente no pueda inferir simplemente leyendo el código.

## Parte B

1. Monté un CLAUDE.md como contexto permanente y hooks PreToolUse y PostToolUse para bloquear modificaciones directas del backend, restringir comandos Git y ejecutar lint automáticamente. La parte que más trabajo llevó fue definir y comprobar los mecanismos de enforcement mediante hooks.

2. La primera diferencia concreta que observé estuvo en la estructura de la solución. Con harness, el agente separó la capa de API, el formulario y el panel del usuario autenticado en piezas distintas. Sin harness realizó una implementación más compacta y además creó frontend/.env.example.

3. Dejé explícitamente escrito que backend debía mantenerse como solo lectura. Aunque el agente no editó código del backend, al ejecutar Adonis aparecieron archivos generados bajo backend/.adonisjs como modificados por efectos secundarios del entorno. Esto mostró que bloquear Edit y Write no garantiza por sí solo que ningún comando pueda producir cambios dentro de una zona protegida.