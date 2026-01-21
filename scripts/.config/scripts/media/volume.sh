#!/bin/bash

#===============================================================================
# Volume & Media Control (Desktop Version)
# ~/.config/hypr/scripts/media/volume.sh
#===============================================================================

set -euo pipefail

# --- IMPORTANTE: Cargar la librería common.sh ---
# Esto busca el archivo en la carpeta ../lib/ relativa a este script
source "$(dirname "${BASH_SOURCE[0]}")/../lib/common.sh"

# --- Configuration ---
readonly VOLUME_STEP=5
readonly MAX_VOLUME=150
readonly NOTIFICATION_TIMEOUT=1500
readonly DOWNLOAD_ALBUM_ART=true
readonly SHOW_ALBUM_ART=true
readonly SHOW_MUSIC_IN_VOLUME=true

# Icons
readonly VOLUME_MUTE_ICON="󰕿 "
readonly VOLUME_LOW_ICON="󰖀 "
readonly VOLUME_HIGH_ICON="󰕾 "
readonly MIC_MUTE_ICON="󰍭 "
readonly MIC_UNMUTE_ICON="󰍬 "

# Global variables
album_art=""

# --- Validación de Dependencias (Usando common.sh) ---
validate_dependencies "pactl" "playerctl" "notify-send" "wget"

# --- Volume Functions ---
get_volume() {
    pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]{1,3}(?=%)' | head -1
}

get_mute_status() {
    pactl get-sink-mute @DEFAULT_SINK@ | grep -Po '(?<=Mute: )(yes|no)'
}

get_volume_icon() {
    local -r volume=$1
    local -r mute_status=$2
    
    if [[ "$mute_status" == "yes" || "$volume" -eq 0 ]]; then
        echo "$VOLUME_MUTE_ICON"
    elif (( volume < 50 )); then
        echo "$VOLUME_LOW_ICON"
    else
        echo "$VOLUME_HIGH_ICON"
    fi
}

show_volume_notification() {
    local -r volume=$(get_volume)
    local -r mute_status=$(get_mute_status)
    local -r volume_icon=$(get_volume_icon "$volume" "$mute_status")
    
    local body_text progress_value
    if [[ "$mute_status" == "yes" || "$volume" -eq 0 ]]; then
        body_text="Silenciado"
        progress_value=0
    else
        body_text="$volume%"
        progress_value=$volume
    fi
    
    # Add current song if enabled
    if [[ "$SHOW_MUSIC_IN_VOLUME" == "true" ]]; then
        local current_media
        current_media=$(playerctl -f "{{title}} - {{artist}}" metadata 2>/dev/null || echo "")
        if [[ -n "$current_media" ]]; then
            body_text="$body_text\nSonando: $current_media"
        fi
        
        if [[ "$SHOW_ALBUM_ART" == "true" && -n "$current_media" ]]; then
            get_album_art
        else
            album_art=""
        fi
    fi
    
    # Usamos la función send_notification de common.sh si quisieramos, 
    # pero mantendremos notify-send directo para controlar los hints específicos
    notify-send \
        --app-name="Volume" \
        --expire-time="$NOTIFICATION_TIMEOUT" \
        --transient \
        --hint="string:x-canonical-private-synchronous:volume" \
        --hint="int:value:$progress_value" \
        --hint="string:hlcolor:#d65d0e" \
        --icon="$album_art" \
        "$volume_icon Volumen" "$body_text"
}

# --- Microphone Functions ---
get_mic_mute_status() {
    pactl get-source-mute @DEFAULT_SOURCE@ | grep -Po '(?<=Mute: )(yes|no)'
}

get_mic_icon() {
    local -r mute_status=$1
    if [[ "$mute_status" == "yes" ]]; then
        echo "$MIC_MUTE_ICON"
    else
        echo "$MIC_UNMUTE_ICON"
    fi
}

show_mic_notification() {
    local -r mute_status=$(get_mic_mute_status)
    local -r mic_icon=$(get_mic_icon "$mute_status")
    local status_text
    
    if [[ "$mute_status" == "yes" ]]; then
        status_text="Silenciado"
    else
        status_text="Activado"
    fi
    
    notify-send \
        --app-name="Microphone" \
        --expire-time="$NOTIFICATION_TIMEOUT" \
        --transient \
        --hint="string:x-canonical-private-synchronous:microphone" \
        "" "$mic_icon Microfono $status_text"
}

# --- Music Functions ---
get_album_art() {
    album_art=""
    local art_url
    art_url=$(playerctl -f "{{mpris:artUrl}}" metadata 2>/dev/null) || return
    
    [[ -z "$art_url" ]] && return
    
    if [[ "$art_url" == file://* ]]; then
        album_art="${art_url#file://}"
    elif [[ "$art_url" =~ ^https?:// && "$DOWNLOAD_ALBUM_ART" == "true" ]]; then
        local filename_safe
        filename_safe=$(basename "$art_url" | sed 's/[^a-zA-Z0-9._-]//g')
        [[ "$filename_safe" != *.* ]] && filename_safe="${filename_safe}.jpg"
        
        if [[ -n "$filename_safe" ]]; then
            local temp_path="/tmp/$filename_safe"
            if [[ ! -f "$temp_path" ]]; then
                wget --quiet -O "$temp_path" "$art_url" 2>/dev/null || return
            fi
            [[ -f "$temp_path" && -s "$temp_path" ]] && album_art="$temp_path"
        fi
    fi
}

show_music_notification() {
    local title artist album
    title=$(playerctl -f "{{title}}" metadata 2>/dev/null || echo "")
    artist=$(playerctl -f "{{artist}}" metadata 2>/dev/null || echo "")
    album=$(playerctl -f "{{album}}" metadata 2>/dev/null || echo "")
    
    [[ -z "$title" && -z "$artist" ]] && return
    
    local summary="$title"
    local body="$artist"
    [[ -n "$album" ]] && body="$body - $album"
    
    album_art=""
    [[ "$SHOW_ALBUM_ART" == "true" ]] && get_album_art
    
    notify-send \
        --app-name="Music Player" \
        --expire-time="$NOTIFICATION_TIMEOUT" \
        --transient \
        --icon="$album_art" \
        "$summary" "$body"
}

# --- Control Functions ---
volume_up() {
    pactl set-sink-mute @DEFAULT_SINK@ 0
    local current_volume
    current_volume=$(get_volume)
    
    if (( current_volume + VOLUME_STEP > MAX_VOLUME )); then
        pactl set-sink-volume @DEFAULT_SINK@ "${MAX_VOLUME}%"
    else
        pactl set-sink-volume @DEFAULT_SINK@ "+${VOLUME_STEP}%"
    fi
    show_volume_notification
}

volume_down() {
    pactl set-sink-volume @DEFAULT_SINK@ "-${VOLUME_STEP}%"
    show_volume_notification
}

volume_mute() {
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    show_volume_notification
}

mic_mute() {
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
    show_mic_notification
}

next_track() {
    playerctl next
    sleep 0.1
    show_music_notification
}

prev_track() {
    playerctl previous
    sleep 0.1
    show_music_notification
}

play_pause() {
    playerctl play-pause
    sleep 0.1
    show_music_notification
}

main() {
    local -r action="${1:-}"
    
    # Usamos el bloqueo de common.sh para evitar spam de teclas
    acquire_lock "/tmp/volume_script.lock"
    
    case "$action" in
        volume_up) volume_up ;;
        volume_down) volume_down ;;
        volume_mute) volume_mute ;;
        mic_mute) mic_mute ;;
        next_track) next_track ;;
        prev_track) prev_track ;;
        play_pause) play_pause ;;
        *)
            log_error "Acción desconocida: $action"
            echo "Uso: $0 {volume_up|volume_down|volume_mute|mic_mute|next_track|prev_track|play_pause}"
            exit 1
            ;;
    esac
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
