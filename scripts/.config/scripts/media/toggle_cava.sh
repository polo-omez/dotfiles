#!/bin/bash

if pgrep -f "[c]ava-drop-*" > /dev/null
then
    # Si existe, lo matamos
    pkill -f "[c]ava-drop-*"
else
    alacritty --class cava-drop-left -e cava & kitty --class cava-drop-right -e cava

fi

