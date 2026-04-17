#!/usr/bin/env bash

# Configuración de tu grid
ROWS=3
COLS=3
DIR=$1 # Recibe: left, up, down o right

update_arrow() {
    # Obtener el ID del workspace activo
    ws_id=$(hyprctl activeworkspace -j | jq '.id')

    # Si estamos fuera de la cuadrícula, no mostrar nada
    if ! [[ "$ws_id" =~ ^[0-9]+$ ]] || (( ws_id < 1 || ws_id > (ROWS*COLS) )); then
        echo '{"text": "", "tooltip": ""}'
        return
    fi

    row=$(( (ws_id - 1) / COLS ))
    col=$(( (ws_id - 1) % COLS ))

    icon=""

    # Solo asignar el icono si corresponde a la dirección solicitada
    case $DIR in
        "left")  if (( col > 0 )); then icon=""; fi ;;
        "up")    if (( row > 0 )); then icon=""; fi ;;
        "down")  if (( row < ROWS - 1 )); then icon=""; fi ;;
        "right") if (( col < COLS - 1 )); then icon=""; fi ;;
    esac

    # Si hay icono, enviarlo. Si no, enviar un JSON vacío (Waybar ocultará el módulo)
    if [[ -n "$icon" ]]; then
        echo "{\"text\": \"$icon\", \"tooltip\": \"Ir a $DIR\"}"
    else
        echo "{\"text\": \"\", \"tooltip\": \"\"}"
    fi
}

update_arrow

# Escuchar eventos
socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do
    if echo "$line" | grep -q "^workspace>>"; then
        update_arrow
    fi
done
