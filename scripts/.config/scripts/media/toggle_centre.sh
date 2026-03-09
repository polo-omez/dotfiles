#!/bin/bash

GENERAL_CLASS="[w]aydrop-"
SPECIFIC_CLASS="[w]aydrop-centre"

if pgrep -f "$SPECIFIC_CLASS" > /dev/null; then
    
    pkill -f "$SPECIFIC_CLASS"
    
else
    pkill -f "$GENERAL_CLASS"
    
    kitty --class waydrop-centre -o="background_opacity=1.0" --session ~/.config/kitty/control_centre.conf
fi
