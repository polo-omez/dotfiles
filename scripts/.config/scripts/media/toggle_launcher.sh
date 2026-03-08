#!/bin/bash

GENERAL_CLASS="[w]aydrop-"
SPECIFIC_CLASS="wofi"

if pgrep -f "$SPECIFIC_CLASS" > /dev/null; then
    
    echo "found a wofi process"
    pkill -f "$SPECIFIC_CLASS"
    
else
    pkill -f "$GENERAL_CLASS"
    
    wofi --show drun --matching --insensitive
fi
