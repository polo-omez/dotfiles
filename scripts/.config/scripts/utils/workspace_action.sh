#!/usr/bin/env bash

# Obtener el workspace actual
curr_workspace="$(hyprctl activeworkspace -j | jq -r ".id")"
action="$1"
shift

# Validar argumentos
if [[ -z "${action}" || "${action}" == "--help" || "${action}" == "-h" || -z "$1" ]]; then
  echo "Usage: $0 <workspace|movetoworkspace> <target>"
  exit 1
fi

target="$1"
final_target=""
curr_group=$(( (curr_workspace - 1) / 9 ))

# =====================================================================
# 1. TRADUCIR EL TARGET
# =====================================================================
if [[ "$target" =~ ^r([-+][0-9]+)$ ]]; then
  offset="${BASH_REMATCH[1]}"
  final_target=$(( curr_workspace + offset ))
  
elif [[ "$target" =~ ^[0-9]+$ ]] && [ "$target" -le 9 ]; then
  final_target=$(( curr_group * 9 + target ))
  
elif [[ "$target" =~ ^[0-9]+$ ]]; then
  final_target="$target"
else
  exit 1
fi

# =====================================================================
# 2. VALIDACIONES
# =====================================================================
if [ "$final_target" -le 0 ]; then
  exit 0
fi

target_group=$(( (final_target - 1) / 9 ))

if [ "$curr_group" -ne "$target_group" ]; then
  exit 0
fi

# =====================================================================
# 3. CÁLCULO DE DIRECCIÓN Y ANIMACIÓN (LUA WAY)
# =====================================================================
diff=$(( final_target - curr_workspace ))
diff_abs=${diff#-} 

# Determinar estilo de animación
if [ "$diff_abs" -ge 3 ]; then
  anim="slidevert"
else
  anim="slide"
fi

# Creamos un archivo temporal con la función nativa de Lua para cambiar
# el estilo de la rama 'workspaces' en el árbol de animaciones.
TMP_LUA="/tmp/hypr_grid_anim.lua"
echo "hl.animation({ leaf = \"workspaces\", style = \"${anim}\" })" > "$TMP_LUA"

# Ejecutamos el archivo temporal. 
# (NOTA: Usamos un comando genérico de carga. Si tu fork de Hyprland Lua usa un dispatcher
# diferente para leer archivos en caliente, como hl.dsp.exec_lua, cámbialo aquí).
hyprctl dispatch "hl.dsp.source({ path = \"$TMP_LUA\" })"

# =====================================================================
# 4. EJECUCIÓN DEL MOVIMIENTO
# =====================================================================
if [[ "$action" == "workspace" ]]; then
  hyprctl dispatch "hl.dsp.focus({ workspace = \"${final_target}\" })"

elif [[ "$action" == "movetoworkspace" ]]; then
  hyprctl dispatch "hl.dsp.window.move({ workspace = \"${final_target}\", follow = true })"

fi
