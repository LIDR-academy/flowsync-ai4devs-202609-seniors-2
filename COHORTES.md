# Cómo se crea y se alimenta el repo de un cohorte

Este repositorio es el **canónico**. No es de ningún alumno: cada cohorte tiene el suyo, derivado de aquí.

## Qué necesitas, y qué NO

**No necesitas una copia sincronizada de este repositorio.** El script se descarga las ramas él solo, en un temporal, cada vez que lo ejecutas. Así que da igual lo vieja que sea tu carpeta local: **siempre publica lo que hay hoy en el remoto**.

Necesitas tres cosas:

1. **El archivo del script.** Bájalo así, y vuelve a hacerlo cuando te avise:
   ```bash
   gh api repos/LIDR-academy/flowsync-ai4devs-fundacional/contents/scripts/publicar-cohorte.sh \
     --jq .content | base64 -d > publicar-cohorte.sh && chmod +x publicar-cohorte.sh
   ```
   Lo deja en la carpeta donde estás, y los ejemplos de abajo se corren **desde esa carpeta**.
2. **`gh` autenticado con la cuenta oficial de los TA: `ai4devs@lidr.es`** (usuario de GitHub `LIDR-AI4Devs`). Si ya la tienes en `gh`, `gh auth switch -u LIDR-AI4Devs`; si no, `gh auth login` y entra con ese email. **Todo lo hace con la cuenta activa de `gh`, también el `git`**: da igual qué cuenta tengas guardada en el llavero del sistema. El script te dice al empezar con cuál corre.
3. **`git`.**

> 👤 **El script comprueba la cuenta antes de hacer nada:**
> - **Si no es de la organización `LIDR-academy`**, se para y te dice cómo cambiar a la oficial.
> - **Si es de la organización pero no es la oficial**, te avisa y te pregunta si estás seguro. Esa es la vía para una **excepción a la regla**: se confirma con un `SI`, no hace falta tocar el script.
> - `estado` solo lee, así que no pregunta por la cuenta oficial.

> 🔒 **El script se niega a funcionar si tu copia no coincide con la del repositorio.** No es celo: si te quedas con una versión anterior, **te quedas sin los avisos que impiden repartir una solución antes de tiempo**, y eso no se nota hasta que ya pasó. Cuando te lo diga, vuelve a bajarlo con el comando de arriba.

## Crear el cohorte

```bash
./publicar-cohorte.sh crear 202610-seniors
```

Crea `LIDR-academy/flowsync-ai4devs-202610-seniors` (público) con **`main` y `s1/start`, nada más**, y eso es deliberado.

**La etiqueta lleva fecha y track, y el track no es opcional.** `202610-seniors`, `202610-seniors-II`. Sin track, dos cohortes del mismo mes chocan, así que el script rechaza `202610` a secas.

Al terminar imprime la URL del repo nuevo, en la última línea.

## Publicar cuando toque: un comando por módulo impartido

```bash
./publicar-cohorte.sh publicar 202610-seniors s2 start   # tras impartir el Módulo 1: s1/end + s2/start
./publicar-cohorte.sh publicar 202610-seniors s1 end     # lo mismo, pedido desde la otra rama
./publicar-cohorte.sh estado   202610-seniors            # qué hay publicado
```

**Tras impartir un módulo se publican dos ramas juntas: su `end` y la `start` del siguiente.** El alumno necesita las dos: la solución del módulo que acaba de ver y la rama de partida del siguiente, que es de donde sale su prework. Por separado, una de las dos se olvidaba.

**Se puede pedir por cualquiera de las dos ramas, y el resultado es el mismo.** `publicar … s2 start` y `publicar … s1 end` suben `s1/end` y `s2/start`. Usa la que te resulte más natural.

- Pide **una sola confirmación**, que nombra las dos ramas.
- Si la `start` trae commits propios además de la solución, te dice cuántos. Hoy pasa con `s4/start`.
- Si la otra rama del par no existe en este repositorio, se publica solo la que pediste y el script lo avisa. Pasa en los extremos: `s1/start` sale sola porque no hay Módulo 0 (es la que usa `crear`, y la que recupera un `crear` a medias, ver *Si algo falla*), y `s5/end` sale sola porque no hay `s6/start`.

## Por qué no se publican todas de golpe

**`s(N+1)/start` ES la solución de la sesión N.** No es una convención: son el mismo commit.

```
s1/end == s2/start        s2/end == s3/start        s4/end == s5/start
```

Así que un cohorte que naciera con todas las ramas tendría el curso resuelto el primer día, y uno que naciera sin ninguna dejaría al alumno sin rama de partida para su prework. Por eso hay una herramienta y no una instrucción.

**El script avisa** cuando lo que vas a publicar destapa una solución, y pide confirmación escrita. Ese aviso es la razón de que exista: publicar `s3/start` reparte `s2/end`, y **eso no se ve en el nombre de la rama**. Por eso pregunta igual por los dos caminos: `publicar … s3 start` y `publicar … s2 end` reparten la solución del Módulo 2.

> ⚠️ **No publiques ramas a mano con `git push`.** Te saltas el aviso, y es justo el caso en que hace falta.

## Si algo falla

**«no pertenece a la organización» o «no ve …».** Tienes varias cuentas de GitHub y la activa no es la oficial. `gh auth status` las lista y `gh auth switch -u LIDR-AI4Devs` cambia a la oficial. Si tienes `GH_TOKEN` definido, ese token gana sobre cualquier cuenta.

**«tiene una invitación PENDIENTE».** La cuenta está invitada a la organización pero no ha aceptado. El script da el enlace para aceptarla.

**`crear` creó el repo pero no publicó `s1/start`.** No vuelvas a correr `crear`: el repo ya existe y fallaría. Publica lo que faltó:

```bash
./publicar-cohorte.sh publicar 202610-seniors s1 start
```

**`remote: Repository not found` justo después de «✓ repo creado».** Es el síntoma de una copia del script **anterior a esta sección**, en la que `git` usaba la cuenta del llavero en vez de la de `gh`. El canónico es privado, así que GitHub contesta «not found» en lugar de «sin permiso». Vuelve a bajar el script.
