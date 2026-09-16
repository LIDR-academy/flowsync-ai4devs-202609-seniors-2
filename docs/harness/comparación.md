# Archivos modificados

| Con harness | Sin harness |
| ----------- | ----------- |
| frontend/src/api/auth.ts | frontend/src/api/auth.ts |
| frontend/src/App.css (creó y eliminó después) | frontend/src/App.css (lo creó y lo eliminó) | 
| frontend/src/App.tsx | frontend/src/App.tsx |
| frontend/src/pages/LoginPage.css | frontend/src/pages/LoginPage.css |
| frontend/src/pages/LoginPage.tsx | frontend/src/pages/LoginPage.tsx |
| frontend/src/pages/WelcomePage.css | frontend/src/pages/WelcomePage.css |
| frontend/src/pages/WelcomePage.tsx | frontend/src/pages/WelcomePage.tsx |
| | frontend/src/index.css |
| | frontend/src/assets/hero.png (lo creó y lo eliminó) |
| | frontend/src/assets/react.svg (lo creó y lo eliminó) | 
| | frontend/src/assets/vite.svg (lo creó y lo eliminó) |

# Qué cumplió y qué no

Creo que en gral. hizo lo que le pedí en ambos casos:
- Pantalla de login con 2 campos, el de password oculto 
- Mensaje de error al fallar la autenticación seguido de un blanqueo del formulario
- Cargar una página estática de bienvenida tras login exitoso

| Con harness | Sin harness |
| ----------- | ----------- |
| Lo hizo a la primera | La pantalla de login no hacía nada, le tuve que marcar que no funcionaba, me pidió un debug con F12, la corrigió y ya después funcionó bien |
| No puso un solo comentario, y le pedí en el AGENTS.md que comentara lo que no fuera trivial (tal vez todo era trivial) | Tampoco puso comentarios, aunque no le pedí nada al respecto |

# Intervenciones

| Con harness | Sin harness |
| ----------- | ----------- |
| Al empezar me preguntó por el ejercicio (entendió que era una especie de simulacro) y si quería que hiciera algo o no. Le dije que hiciera de cuenta que no había leído la consigna. | Le reporté que no funcionaba el login y lo arregló |
| Le pedí que revisara el código, no encontró nada demasiado serio | |

# Correcciones/ajustes
No tengo la menor idea, no programo js.

# Qué monté
- Un CLAUDE.md -> AGENTS.md
- Una skill de revisión (critic), aunque no hacía falta porque Claude ya trae propias 
- Una integración MCP con Jira

Las 3 fueron sencillas pero jamás había hecho nada de esto así que para el setup no me limité por tiempo, no habría tenido sentido.

# Qué diferencias vi
No revisé el código, no lo interpreto y no parecía fácil comparar. Solo me limité a probar la fc. básica y a reportarle el problema al agente que trabajaba sin harness.

# Qué ignoró
No le di ninguna instrucción muy concreta, salvo que usara comentarios a discreción, y no puso ninguno, pero tampoco lo hizo en el proyecto sin harness.
