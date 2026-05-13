#!/usr/bin/env bash

# Obtener el workspace actual
curr_workspace="$(hyprctl activeworkspace -j | jq -r ".id")"
action="$1"
shift ## El objetivo ahora está en $1

# Validar argumentos
if [[ -z "${action}" || "${action}" == "--help" || "${action}" == "-h" || -z "$1" ]]; then
  echo "Usage: $0 <workspace|movetoworkspace> <target>"
  exit 1
fi

target="$1"

# Si es un número puro (ej. 1, 2, 3), calculamos a qué decena de monitor pertenece
if [[ "$target" =~ ^[0-9]+$ ]]; then
  target=$((((curr_workspace - 1) / 10 ) * 10 + target))
fi

# =====================================================================
# EJECUCIÓN CON LA NUEVA SINTAXIS LUA (Hyprland 0.55+)
# =====================================================================
if [[ "$action" == "workspace" ]]; then
  # Comando Lua para navegar a un workspace
  hyprctl dispatch "hl.dsp.focus({ workspace = \"${target}\" })"

elif [[ "$action" == "movetoworkspace" ]]; then
  # Comando Lua para mover la ventana y viajar con ella (follow = true)
  hyprctl dispatch "hl.dsp.window.move({ workspace = \"${target}\", follow = true })"

else
  # Por si pasas algún otro comando especial
  echo "Acción no reconocida para la nueva sintaxis: $action"
  exit 1
fi
