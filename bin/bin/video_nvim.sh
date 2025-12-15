#!/usr/bin/env bash

WS="$1"
SOURCE="$2"
NOTES="$3"

if [ -z "$WS" ] || [ -z "$SOURCE" ]; then
  echo "Uso: video_nvim.sh <workspace> <video|carpeta> [notas]"
  exit 1
fi

TERM="${TERMINAL:-foot}"

# 1. Workspace limpio
hyprctl dispatch workspace "$WS"
sleep 0.15

# 2. Preparar argumento de mpv
MPV_ARG=""
if [ -f "$SOURCE" ]; then
    MPV_ARG="\"$SOURCE\""
elif [ -d "$SOURCE" ]; then
    # Crear playlist temporal con todos los vídeos de la carpeta
    PLAYLIST=$(mktemp)
    find "$SOURCE" -maxdepth 1 -type f \( -iname '*.mp4' -o -iname '*.mkv' -o -iname '*.webm' \) -print0 | sort -z | xargs -0 -I{} echo "{}" > "$PLAYLIST"
    if [ ! -s "$PLAYLIST" ]; then
        echo "No se encontraron vídeos en $SOURCE"
        exit 1
    fi
    MPV_ARG="--playlist=\"$PLAYLIST\""
else
    echo "Error: $SOURCE no es un archivo ni un directorio válido"
    exit 1
fi

# 3. Abrir mpv (primer tile, izquierda)
hyprctl dispatch exec "[tile]" "mpv $MPV_ARG"
sleep 0.3
hyprctl dispatch focuswindow "class:^(mpv)$"
sleep 0.1

# 4. Abrir nvim a la derecha
if [ -n "$NOTES" ]; then
    hyprctl dispatch exec "[tile; split:right]" "$TERM nvim \"$NOTES\""
else
    hyprctl dispatch exec "[tile; split:right]" "$TERM nvim"
fi
