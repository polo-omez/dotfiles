#!/bin/bash

# Ruta a tus fondos
DIR="$HOME/Pictures/Wallpapers/roger"

# IMPORTANTE: Pon aquí el nombre exacto de tu monitor principal
MONITOR="eDP-1" 

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do
    
    if [[ "$line" == "workspace>>"* ]]; then
        WORKSPACE_NUM="${line#*>>}"
        
        if [[ "$WORKSPACE_NUM" -ge 1 && "$WORKSPACE_NUM" -le 9 ]]; then
            
            # Cambiar fondo con swww (con una transición suave tipo 'fade')
            awww img -o "$MONITOR" "$DIR/$WORKSPACE_NUM.png" --transition-type none
            
        fi
    fi
done
