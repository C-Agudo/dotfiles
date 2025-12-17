#!/usr/bin/env bash

# --- USO ---
# ./youtube_nvim.sh <workspace> [notas]
# workspace: número de workspace
# notas: ruta a la carpeta/archivo para abrir con Nvim (opcional)

WS="$1"
NOTES="$2"

if [ -z "$WS" ]; then
    echo "Uso: $0 <workspace> [notas]"
    exit 1
fi

TERM="${TERMINAL:-foot}"

# 1. Cambiar a workspace limpio
hyprctl dispatch workspace "$WS"
sleep 0.15

# 2. Abrir YouTube en Chrome
google-chrome-stable --new-window "https://www.youtube.com" &

# 3. Esperar a que se abra Chrome y moverla a la izquierda
echo "Esperando a que se abra Chrome..."
hyprctl dispatch waitforwindow class:^Google-chrome$
hyprctl dispatch "[class:Google-chrome] move workspace $WS; tile left"

# 4. Abrir Nvim a la derecha
sleep 0.2
if [ -n "$NOTES" ]; then
    "$TERM" -e nvim "$NOTES" &
else
    "$TERM" -e nvim &
fi

# 5. Esperar a que se abra Nvim y moverla a la derecha
echo "Esperando a que se abra Nvim..."
hyprctl dispatch waitforwindow class:^foot$  # reemplaza si usas otra terminal
hyprctl dispatch "[class:foot] move workspace $WS; tile right"

echo "¡Listo! YouTube a la izquierda y Nvim a la derecha."

