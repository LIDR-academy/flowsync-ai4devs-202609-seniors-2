# Prompts

---

## Prompt 1 — El terreno que ya existe

**Modelo:** Sonnet 5 · Claude Pro
**Herramienta:** Claude Code v2.1.280

```
Antes de especificar nada nuevo, necesito que me digas en 3 a 5 líneas:
1. Qué capabilities tiene hoy FlowSync 
2. Cómo es el modelo de datos actual
Explorá el código del repo para resolver esto 
```

**Qué salió:** Exploró rutas, controladores, validadores y frontend. Devolvió que solo existe auth (signup, login, logout, perfil) y el modelo tiene una tabla users + access_tokens. Sin dominio de tareas. Correcto y conciso.

---

## Prompt 2 — El interrogatorio (5 preguntas)

**Modelo:** Sonnet 5 · Claude Pro
**Herramienta:** Claude Code v2.1.280

```
Ahora te paso la visión de producto
Quiero que FlowSync sea una herramienta para que los equipos remotos sepan en qué está trabajando cada uno sin tener que hacer reuniones de sincronización. Algo tipo tareas compartidas pero más en tiempo real y menos rollo que Jira.
Dicho esto haceme las 5 preguntas que más reducirían la incertidumbre para recortar un MVP. 
Una sola ronda, las 5 juntas. NO bajes a modelo de datos, endpoints ni arquitectura , pensemos solo en el producto .
```

**Qué salió:** 5 preguntas de producto: unidad de estado (tarea vs mood), distribución (pull vs push), colaboración (autoreporte vs asignación), ritual (libre vs check-in), historial (presente vs pasado). Bien enfocadas, sin bajar a técnico.

---

## Prompt 2b — Respuesta con la ficha de hechos

**Modelo:** Sonnet 5 · Claude Pro
**Herramienta:** Claude Code v2.1.280

```
(Se pegó la ficha de hechos de la lección "Ejercicio FlowSync" del Módulo 2 como respuesta a las 5 preguntas)
```

**Qué salió:** Mapeó cada respuesta a las preguntas. Agregó supuestos razonables (set de estados, tareas completadas ocultas por defecto, fecha como señal visual sin flujo). Preguntó si avanzar.

---

## Prompt 3 — Alcance en cinco bloques

**Modelo:** Sonnet 5 · Claude Pro
**Herramienta:** Claude Code v2.1.280

```
sí, avanzá, armame el alcance del MVP en exactamente cinco bloques:
Problema
Usuarios
Propuesta de valor
Alcance (qué entra)
NO-alcance (qué queda fuera y por qué cada exclusión)

se agresivo recortando. Cada cosa que dejes fuera tiene que tener su justificación. Esto es un documento de producto: sin tablas de BD, sin endpoints, sin arquitectura
```

**Qué salió:** Documento de alcance en 5 bloques. Problema concreto (daily pierde tiempo, solapes). Usuarios: equipos remotos 3–10, roles planos. 7 items en alcance (espacio único, tareas con 4 atributos, estados, filtro, señal visual, tiempo real). 11 exclusiones justificadas. No bajó a técnico.
