# Parte A

## La Comparación
| Item | Con Harness | Sin harness |
|---|---|---|
| **Qué archivos tocó** | Fueron 15 archivos:  <br>- frontend/src/App.tsx<br>- frontend/src/App.css<br>- frontend/src/api/authApi.ts<br>- frontend/src/api/config.ts<br>- frontend/src/features/auth/SignUpForm.tsx<br>- frontend/src/features/auth/SignUpForm.css<br>- frontend/src/features/auth/WelcomeScreen.tsx<br>- frontend/src/features/auth/WelcomeScreen.css<br>- frontend/src/features/auth/PasswordField.tsx<br>- frontend/src/features/auth/validation.ts<br>- validation.test.ts<br>- mapApiError.test.ts<br>- api/authApi.test.ts<br>- features/auth/SignUpForm.test.tsx<br>- App.test.tsx | Fueron 9 archivos incluído uno del backend:  <br>- backend/app/validators/user.ts<br>- frontend/src/App.tsx<br>- frontend/src/services/authService.ts<br>- frontend/src/validation/registerValidation.ts<br>- frontend/src/components/RegisterForm.tsx<br>- frontend/src/components/RegisterForm.css<br>- frontend/src/components/WelcomeScreen.tsx<br>- frontend/src/components/WelcomeScreen.css<br>- frontend/src/types/auth.ts |
| **Qué convenciones del proyecto respetó y cuáles no** | Todas en general las respetó:<br>- Cambios solo en frontend/, no tocó backend/<br>- Siguió las convenciones existentes del diseño de UI<br>- No inventó reglas ni respuestas del servidor<br>- No añadió dependencias nuevas<br>- Respetó las políticas de contraseñas solicitada<br>- No hizo commit de los cambios<br>- El trabajo de revisar la calidad del código, funcionalidad y tests después de finalizar la implementación sí fue asignada a un agente independiente | No s ele dió ninguna instrucción.<br>- Siguió las convenciones existentes del diseño de UI |
| **Cuántas veces tuviste que intervenir** | Ninguna | Una |
| **Qué te tocaría arreglar a mano antes de enseñarle eso a alguien de tu equipo** | Nada | Nada |

<br><br><br>
# Parte B

## Las tres líneas

### 1. Qué piezas montaste y cuál te costó más de lo que esperabas?  
En el proyecto con harness monté dos piezas:  
- Archivo de instrucciones en la raíz del proyecto CLAUDE.md -> AGENTS.md
- Un agente revisor "quality-reviewer.md" en ./claude/agents que revisa lo que el agente principal implementó.  

Me costó más el crear el AGENTS.md y específicamente identificar las restricciones adecuadas a colocar aquí pero sin limitar mucho a la IA.

### 2. La primera diferencia que viste entre las dos salidas, y en qué te fijaste para verla?
Las dos salidas en cuanto a resultado final y archivos modificados/creados fueron muy similares.  
Sin embargo me genera más confianza el resultado con Harness porque hubo de por medio un agente revisor independiente que realizó dos ciclos de pruebas ya que en el primero encontró un bug que luego el principal lo resolvió y que el revisor volvió a revalidar luego.
Me fijé en el razonamiento y cruce de mensajes entre los dos agentes.

### 3. Algo que dejaste escrito en el harness y que el agente no cumplió igualmente
En general todo lo que dejé escrito en el harness el agente lo cumplió a la primera a excepción el punto de crear test unitarios. Esto se debió a que por un lado le dije que creara los tests, pero por otro le pedí que no instalara dependencias a librerías externas sin mi autorización entonces con esa última instrucción no creó los tests a la primera, tuve que aprbarle que librería instalar y ahi sí creó los tests.

