#!/bin/bash

if pgrep -f "[p]eaclock-drop" > /dev/null
then
    # Si existe, lo matamos
    pkill -f "[p]eaclock-drop"
else
    kitty --class peaclock-drop -e peaclock
fi
