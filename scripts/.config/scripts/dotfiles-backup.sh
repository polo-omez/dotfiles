#!/bin/bash

# 1. Ir a la carpeta
cd ~/dotfiles || exit

# 2. Comprobar si hay cambios
if [[ `git status --porcelain` ]]; then
    # Hay cambios: Preparar, Confirmar y Subir
    git add .
    git commit -m "Backup automático: $(date '+%Y-%m-%d %H:%M:%S')"
    git push origin main
    
    # 3. Avisarte (Opcional, requiere libnotify)
    notify-send "Dotfiles Backup" "Configuración subida a GitHub correctamente ☁️"
else
    # No hay cambios: No hacer nada (o avisar si eres paranoico)
    echo "No hay cambios que guardar."
fi
