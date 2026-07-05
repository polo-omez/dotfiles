#!/bin/bash
sleep 1
killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal-wlr
killall xdg-desktop-portal
# Levanta el portal de hyprland primero
/usr/lib/xdg-desktop-portal-hyprland &
sleep 2
# Levanta el portal general
/usr/lib/xdg-desktop-portal &
