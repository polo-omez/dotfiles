#!/bin/bash

GENERAL_CLASS="[w]aydrop-"
SPECIFIC_CLASS="[w]aydrop-cava"

if pgrep -f "$SPECIFIC_CLASS" > /dev/null; then
    
    pkill -f "$SPECIFIC_CLASS"
    
else
    pkill -f "$GENERAL_CLASS"
    
    alacritty --class waydrop-cava-left -e cava & 
    alacritty --class waydrop-cava-right -e cava &
    
fi
