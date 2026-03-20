#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Error: You must run the script as root"
  exit 1
fi

ARCHIVO_DNS="/etc/resolv.conf"

case "$1" in
  google)
    cat <<EOF > $ARCHIVO_DNS
# Modified by script 
nameserver 8.8.8.8
nameserver 8.8.4.4
EOF
    echo "DNS updated to Google (8.8.8.8)."
    ;;
    
  cloudflare)
    cat <<EOF > $ARCHIVO_DNS
# Modified by script 
nameserver 1.1.1.1
nameserver 1.0.0.1
EOF
    echo "DNS updated to Cloudflare (1.1.1.1)."
    ;;
    
  *)
    echo "Incorrect promt."
    exit 1
    ;;
esac
