#!/bin/bash

if pgrep -f "[c]alcure-drop" > /dev/null
then
    # Si existe, lo matamos
    pkill -f "[c]alcure-drop"
else
    kitty --class calcure-drop -e calcure 
fi
