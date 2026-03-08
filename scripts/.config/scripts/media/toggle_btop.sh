#!/bin/bash

GENERAL_CLASS="[w]aydrop-"
SPECIFIC_CLASS="[w]aydrop-btop"

if pgrep -f "$SPECIFIC_CLASS" > /dev/null; then
    
    pkill -f "$SPECIFIC_CLASS"
    
else
    pkill -f "$GENERAL_CLASS"
    
    alacritty --class waydrop-btop -e btop
fi
