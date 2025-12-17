#!/usr/bin/env bash
set -e

WS="$1"
SOURCE="$2"
NOTES="$3"

if [ -z "$WS" ] || [ -z "$SOURCE" ]; then
    echo "Uso: video_nvim.sh <workspace> <video|carpeta> [notas]"
    exit 1
fi

TERM_CLASS="com.mitchellh.ghostty"
TERM_CMD="ghostty -e"

# 1. Cambiar workspace
hyprctl dispatch workspace "$WS"

# 2. Abrir NVIM primero (master)
if [ -n "$NOTES" ]; then
    NOTES_PATH="$(realpath "$NOTES")"
    NOTES_DIR="$( [ -d "$NOTES_PATH" ] && echo "$NOTES_PATH" || dirname "$NOTES_PATH" )"
    hyprctl dispatch exec "[tile]" "$TERM_CMD sh -c 'cd \"$NOTES_DIR\" && exec nvim \"$NOTES_PATH\"'"
else
    hyprctl dispatch exec "[tile]" "$TERM_CMD nvim"
fi

# Esperar a que nvim exista
hyprctl dispatch waitforwindow "class:^(${TERM_CLASS})$"

# 3. Preparar MPV
if [ -f "$SOURCE" ]; then
    MPV_CMD=(mpv "$(realpath "$SOURCE")")
elif [ -d "$SOURCE" ]; then
    PLAYLIST="$(mktemp)"
    find "$SOURCE" -maxdepth 1 -type f \
        \( -iname '*.mp4' -o -iname '*.mkv' -o -iname '*.webm' \) \
        | sort > "$PLAYLIST"
    [ ! -s "$PLAYLIST" ] && { echo "No hay vídeos"; exit 1; }
    MPV_CMD=(mpv --playlist="$PLAYLIST")
else
    echo "Fuente inválida"
    exit 1
fi

# 4. Abrir MPV a la izquierda del master (split-left)
hyprctl dispatch exec "[tile; split:left]" "${MPV_CMD[*]}"

# Esperar a que mpv exista
hyprctl dispatch waitforwindow "class:^(mpv)$"
