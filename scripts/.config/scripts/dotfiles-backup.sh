#!/bin/bash

# 1. Exportar la variable DBUS para que notify-send funcione desde segundo plano en Hyprland
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

# 2. Ir a la carpeta (Asegúrate de que la ruta sea correcta)
cd ~/dotfiles || exit

# 3. Comprobar si hay cambios
if [[ `git status --porcelain` ]]; then
    # Hay cambios: Preparar, Confirmar y Subir
    git add .
    git commit -m "Backup automático: $(date '+%Y-%m-%d %H:%M:%S')"
    
    # Nota: Asegúrate de que tu repo local usa SSH (git@github.com...) y no HTTPS
    # para que no te pida usuario/contraseña y se quede bloqueado.
    git push origin main
    
    # 4. Avisarte
    notify-send "Dotfiles Backup" "Configuración subida a GitHub correctamente ☁️"
else
    # No hay cambios: No hacer nada
    echo "No hay cambios que guardar."
fi
