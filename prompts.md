# Prompts

## Prompt 1

**Modelo:** Opus 5 High
**Herramienta:** Claude Code

```
/init 
```

**Qué salió:** generó archivo CLAUDE.md, luego manualmente lo renombré AGENTS.md y creé CLAUDE.md referenciando a AGENTS.md

## Prompt 2

**Modelo:** Opus 5 High
**Herramienta:** Claude Code

```
incluye dentro de las reglas de este repositorio lo siguiente:
- antes de implementar el cambio que te solicite, verifica si es consistente, pregunta en vez de asumir, no busques rellenar huecos por tu cuenta, pregunta ofreciendo 2 o 3 opciones junto a tu recomendación, permitiendome dar una opción propia
- incluye una regla para que nunca hagas cambios no solicitados y/o que no formen parte del alcance solicitado, debes acotar tu alcance estrictamente a lo relacionado con la tarea
- antes de realizar una tarea, debes generar un plan de los cambios que incluya archivos a modificar/crear, reglas de negocio definidas, criterios de aceptación, que está dentro y fuera del alcance, en formato conciso, no extenso, en markdown y quedando a la espera de una confirmación de parte del usuario para implementar el plan
```

**Qué salió:** modificó AGENTS.md

## Prompt 3

**Modelo:** Opus 5 High
**Herramienta:** Claude Code

```
una vez finalizaste la tarea, debes hacer una revisión para asegurarte de que el código compila antes de hacer commit de los cambios, comparar el diff del cambio respecto al alcance de la tarea y revisar que todo el alcance esté cubierto por los cambios realizados, si detectas inconsistencias, corrigelas antes de subir los cambios
```

**Qué salió:** modificó AGENTS.md

## Prompt 4

**Modelo:** Opus 5 High
**Herramienta:** Claude Code

```
otroa regla, no hagas push de los cambios, solo puedes hacer commits
```

**Qué salió:** modificó AGENTS.md

## Prompt 5 (en ventana de sesión nueva)

**Modelo:** Opus 5 High
**Herramienta:** Claude Code

```
implementa la tarea de jira FLOW-3
```

**Qué salió:** realizó 4 preguntas y presentó un plan de implementación con los cambios, pidiendo aprobación para implementarlo

## Prompt 6

**Modelo:** Opus 5 High
**Herramienta:** Claude Code

```
sí, adelante
```

**Qué salió:** implementó el requerimiento, pidió intervención por 2 errores de compilación que tenían múltiples opciones de corrección

