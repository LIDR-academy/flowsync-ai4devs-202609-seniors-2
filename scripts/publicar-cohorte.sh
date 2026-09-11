#!/usr/bin/env bash
# Publica las ramas del curso en el repo de un cohorte, en su cadencia.
#
# POR QUÉ EXISTE, y no es comodidad:
#   `s(N+1)/start` ES la solución de la sesión N. Verificado contra los SHA del
#   repo del curso: s2/start = s1/end, s3/start = s2/end, s5/start = s4/end
#   (s4/start desciende de s3/end y trae commits propios).
#   Por eso un repo de cohorte NO puede nacer con todas las ramas: sería repartir
#   el curso resuelto el primer día. Y tampoco puede nacer sin ninguna, porque
#   entonces el prework del alumno no tiene de dónde partir.
#   (`gh repo create --include-all-branches` es opt-in: sin él, una copia de
#   plantilla se lleva SOLO la rama por defecto. Aquí se usa eso a propósito.)
#
# Uso:
#   ./publicar-cohorte.sh crear    202610-seniors
#   ./publicar-cohorte.sh publicar 202610-seniors s2 start   # s1/end + s2/start
#   ./publicar-cohorte.sh publicar 202610-seniors s1 end     # lo mismo
#   ./publicar-cohorte.sh estado   202610-seniors
#
# Con la cuenta oficial de los TA (ai4devs@lidr.es, usuario LIDR-AI4Devs).
set -euo pipefail

ORG=LIDR-academy
FUENTE="$ORG/flowsync-ai4devs-fundacional"

# git con la MISMA cuenta que gh. Sin esto, `gh repo create` usa la cuenta de gh
# y el `git clone` de justo después usa la que haya en el llavero del sistema (el
# git de Apple trae `credential.helper=osxkeychain` de fábrica). Con varias
# cuentas de GitHub en la máquina son distintas, y como el fundacional es
# privado, GitHub responde «Repository not found» en vez de «sin permiso»: el
# repo del cohorte queda creado y sin s1/start. El `credential.helper=` vacío
# anula los helpers anteriores; `gh auth git-credential` da el token de la
# cuenta ACTIVA de gh (o de GH_TOKEN si está definido), sin tocar tu config.
git_gh () { git -c credential.helper= -c 'credential.helper=!gh auth git-credential' "$@"; }

# REGLA: los TA crean y publican con la cuenta oficial. Una cuenta de fuera de
# la organización no pasa; una de dentro que no sea la oficial pasa si lo
# confirma. Así una excepción a la regla es un SI, no un parche al script.
# Se compara el USUARIO y no el email porque gh no puede leer el email: el
# token de un `gh auth login` normal no trae el scope `user`, y el email
# público de la cuenta está vacío.
CUENTA_OFICIAL=LIDR-AI4Devs
EMAIL_OFICIAL=ai4devs@lidr.es

como_usar_la_oficial () {
  if [ -n "${GH_TOKEN:-}${GITHUB_TOKEN:-}" ]; then
    echo "  Tienes GH_TOKEN o GITHUB_TOKEN definido, y gana sobre la cuenta activa: quítalo o cámbialo."
  fi
  echo "  Los cohortes se crean y publican con la cuenta $EMAIL_OFICIAL (usuario $CUENTA_OFICIAL)."
  echo "    gh auth switch -u $CUENTA_OFICIAL      # si ya la tienes en gh (gh auth status las lista)"
  echo "    gh auth login                         # si no, y entra con $EMAIL_OFICIAL"
}

# Falla pronto y diciendo con qué cuenta, en vez de a medio crear.
CUENTA=""
comprobar_cuenta () {
  local accion="$1"
  if ! CUENTA=$(gh api user --jq .login 2>/dev/null); then
    if [ -n "${GH_TOKEN:-}${GITHUB_TOKEN:-}" ]; then
      echo "✗ Tienes GH_TOKEN o GITHUB_TOKEN definido y GitHub no lo acepta. Quítalo o cámbialo."
    else
      echo "✗ gh no está autenticado. Corre: gh auth login   (y entra con $EMAIL_OFICIAL)"
    fi
    exit 1
  fi

  # 1. ¿Es de la organización? Este endpoint pregunta por la cuenta autenticada,
  #    así que no depende de que su membresía sea pública. 404 = no es miembro.
  local membresia; membresia=$(gh api "user/memberships/orgs/$ORG" --jq .state 2>/dev/null || true)
  if [ "$membresia" != "active" ]; then
    if [ "$membresia" = "pending" ]; then
      echo "✗ La cuenta activa de gh, «${CUENTA}», tiene una invitación PENDIENTE a $ORG: acéptala en github.com/orgs/$ORG/invitation"
    else
      echo "✗ La cuenta activa de gh, «${CUENTA}», no pertenece a la organización $ORG."
    fi
    como_usar_la_oficial
    exit 1
  fi

  # 2. ¿Es la oficial? Solo se pregunta en lo que escribe; `estado` solo lee.
  local cuenta_min oficial_min
  cuenta_min=$(printf '%s' "$CUENTA" | tr '[:upper:]' '[:lower:]')
  oficial_min=$(printf '%s' "$CUENTA_OFICIAL" | tr '[:upper:]' '[:lower:]')
  if [ "$accion" != "estado" ] && [ "$cuenta_min" != "$oficial_min" ]; then
    echo "⚠️  Estás usando «${CUENTA}», que es de $ORG pero NO es la cuenta oficial de los TA."
    echo "    La regla es crear y publicar con $EMAIL_OFICIAL (usuario $CUENTA_OFICIAL):"
    echo "      gh auth switch -u $CUENTA_OFICIAL"
    local resp; read -r -p "    ¿Seguro que quieres seguir con «${CUENTA}»? (escribe SI): " resp
    [ "$resp" = "SI" ] || { echo "  Cancelado."; exit 1; }
  fi

  if ! gh api "repos/$FUENTE" >/dev/null 2>&1; then
    echo "✗ La cuenta activa de gh, «${CUENTA}», no ve $FUENTE."
    como_usar_la_oficial
    exit 1
  fi
  echo "Usando la cuenta de gh «${CUENTA}»."
}

etiqueta_valida () {
  # fecha + al menos un segmento de track. Sin track, los cohortes colisionan.
  [[ "$1" =~ ^[0-9]{6}(-[A-Za-z0-9]+)+$ ]] || {
    echo "✗ Etiqueta inválida: «$1»"
    echo "  Formato: AAAAMM-track   (p. ej. 202610-seniors, 202610-seniors-II)"
    echo "  El track NO es opcional: sin él, dos cohortes del mismo mes chocan."
    exit 1; }
}

repo_de () { echo "$ORG/flowsync-ai4devs-$1"; }

cmd_crear () {
  local et="$1"; etiqueta_valida "$et"
  local repo; repo=$(repo_de "$et")
  echo "Creando $repo desde ${FUENTE}…"
  gh repo create "$repo" --template "$FUENTE" --public \
     --description "FlowSync — cohorte $et. Forkea este repo, trabaja en tu rama y abre un PR. NO es el repo canónico." >/dev/null
  # SIN --include-all-branches: solo viene `main`. Es deliberado (ver cabecera).
  echo "  ✓ repo creado (solo main)"
  sleep 3   # GitHub tarda un instante en dejar el repo utilizable
  cmd_publicar "$et" s1 start
  echo
  echo "✓ Listo. El cohorte arranca con main + s1/start."
  echo "  Tras impartir cada módulo, un solo comando publica su solución y la partida del siguiente:"
  echo "    $0 publicar $et s2 start   # s1/end + s2/start  (s1 end hace lo mismo)"
  echo
  echo "  https://github.com/$repo"
}

cmd_publicar () {
  local et="$1" mod="$2" tipo="$3"; etiqueta_valida "$et"
  [[ "$mod"  =~ ^s[1-7]$        ]] || { echo "✗ Módulo inválido: «${mod}» (s1..s7)"; exit 1; }
  [[ "$tipo" =~ ^(start|end)$   ]] || { echo "✗ Tipo inválido: «${tipo}» (start|end)"; exit 1; }
  local repo rama n; repo=$(repo_de "$et"); rama="$mod/$tipo"; n="${mod#s}"

  local tmp; tmp=$(mktemp -d); trap 'rm -rf "${tmp:-}"' EXIT
  git_gh clone -q --bare "https://github.com/$FUENTE.git" "$tmp/src"
  existe () { git -C "$tmp/src" rev-parse --verify -q "refs/heads/$1" >/dev/null; }
  existe "$rama" || { echo "✗ «${rama}» no existe en $FUENTE"; exit 1; }

  # Tras impartir el Módulo K se publican JUNTAS sK/end y s(K+1)/start: el alumno
  # necesita la solución y la rama de partida del siguiente, que desciende de
  # ella. Por separado, una de las dos se olvidaba. Se llega al par por
  # cualquiera de sus dos ramas:
  #   publicar s2 start  → s1/end + s2/start
  #   publicar s1 end    → s1/end + s2/start   (lo mismo)
  # Si la otra mitad no existe en el canónico, sale sola la pedida: s1/start (no
  # hay Módulo 0) y s5/end (no hay s6/start).
  local fin ini
  if [ "$tipo" = "end" ]; then fin="$rama"; ini="s$((n+1))/start"
  else fin="s$((n-1))/end"; ini="$rama"; fi
  local ramas=() b
  for b in "$fin" "$ini"; do
    if existe "$b"; then ramas+=("$b")
    elif [ "$b" != "s0/end" ]; then echo "  (No hay «${b}» en el canónico: se publica solo «${rama}».)"; fi
  done

  # GUARDARRAÍL: lo que reparte una solución no se ve en el nombre de la rama.
  #   sN/end         → la solución del Módulo N
  #   sN/start, N>1  → la solución del Módulo N-1, que es su base
  local modulo=""
  if [ "$tipo" = "end" ]; then modulo="$n"
  elif [ "$n" -gt 1 ]; then modulo=$((n-1)); fi
  if [ -n "$modulo" ]; then
    local lista="«${ramas[0]}»"
    if [ ${#ramas[@]} -gt 1 ]; then lista="$lista y «${ramas[1]}»"; fi
    echo "⚠️  ATENCIÓN: vas a publicar $lista en $repo."
    echo "    Eso entrega la SOLUCIÓN del Módulo $modulo. Hazlo solo si el Módulo $modulo ya se impartió."
    if [ ${#ramas[@]} -gt 1 ]; then
      local extra; extra=$(git -C "$tmp/src" rev-list --count "refs/heads/$fin..refs/heads/$ini")
      if ! git -C "$tmp/src" merge-base --is-ancestor "refs/heads/$fin" "refs/heads/$ini"; then
        echo "    ⚠️  «${ini}» NO desciende de «${fin}»: no es la cadena habitual del curso, revísala."
      elif [ "$extra" -gt 0 ]; then
        local sig_mod="${ini%%/*}"
        echo "    «${ini}» trae además $extra commit(s) propios: el punto de partida del Módulo ${sig_mod#s}."
      fi
    fi
    local resp; read -r -p "    ¿Seguir? (escribe SI): " resp
    [ "$resp" = "SI" ] || { echo "  Cancelado."; exit 1; }
  fi

  # nunca --force: si ya está publicada y alguien trabajó encima, esto falla en vez de pisarlo
  local r
  for r in "${ramas[@]}"; do
    if git_gh -C "$tmp/src" push -q "https://github.com/$repo.git" "refs/heads/$r:refs/heads/$r" 2>/dev/null; then
      echo "  ✓ $r publicada en $repo"
    else
      if gh api "repos/$repo/branches/${r/\//%2F}" >/dev/null 2>&1; then
        echo "  = $r ya estaba publicada y no ha cambiado. Nada que hacer."
      else
        echo "✗ No se pudo publicar $r con la cuenta «${CUENTA}». ¿Tiene permiso de escritura en $repo?"; exit 1
      fi
    fi
  done
}

cmd_estado () {
  local et="$1"; etiqueta_valida "$et"
  local repo; repo=$(repo_de "$et")
  echo "Ramas publicadas en $repo:"
  gh api "repos/$repo/branches" --jq '.[].name' 2>/dev/null | sort | sed 's/^/  /' \
    || { echo "✗ No existe $repo"; exit 1; }
}

# ---------------------------------------------------------------------------
# Este script vive en la máquina del TA, así que PUEDE QUEDARSE VIEJO. Y lo que
# se queda viejo es el guardarraíl: una copia de antes del aviso de "esto
# destapa la solución del módulo anterior" publica sin preguntar y nadie se
# entera. Por eso se compara contra la copia del repositorio antes de actuar.
comprobar_version () {
  local remoto
  remoto=$(gh api "repos/$FUENTE/contents/scripts/publicar-cohorte.sh" --jq '.content' 2>/dev/null | base64 -d 2>/dev/null) || return 0
  [ -n "$remoto" ] || return 0
  # Ambos lados por sustitución de comando, que recorta el salto final igual en
  # los dos: comparar el archivo tal cual contra "$(...)" daba siempre distinto.
  local local_txt; local_txt=$(cat "$0")
  if [ "$(printf '%s' "$remoto" | shasum -a 256)" != "$(printf '%s' "$local_txt" | shasum -a 256)" ]; then
    echo "✗ Tu copia de este script NO coincide con la del repositorio."
    echo "  No sigo: la diferencia puede estar en los avisos que impiden repartir una solución antes de tiempo."
    echo "  Actualízala:"
    echo "    gh api repos/$FUENTE/contents/scripts/publicar-cohorte.sh --jq .content | base64 -d > \"$0\""
    exit 1
  fi
}
comprobar_version

case "${1:-}" in crear|publicar|estado) comprobar_cuenta "$1" ;; esac

case "${1:-}" in
  crear)    shift; cmd_crear "$@" ;;
  publicar) shift; cmd_publicar "$@" ;;
  estado)   shift; cmd_estado "$@" ;;
  *) sed -n '2,/^set -euo/{/^#/p;}' "$0" | sed 's/^# \{0,1\}//'; exit 1 ;;
esac
