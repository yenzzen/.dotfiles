#!/bin/bash

DIR="$HOME/Pictures/Wallpapers/"

if [ ! -d "$DIR" ]; then
    echo "Erro: Diretório não encontrado: $DIR"
    exit 1
fi

if ! pgrep -x "swww-daemon" > /dev/null; then
    swww init &
    sleep 1
fi

SELECTED=$(find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | sort | \
while read -r file; do
    echo -en "$file\0icon\x1f$file\n"
done | rofi -dmenu -i -theme ~/.config/rofi/minimal.rasi -p "Wallpaper" -show-icons -format s)

if [ -z "$SELECTED" ]; then
    exit 0
fi

echo "Aplicando wallpaper: $SELECTED"

swww img "$SELECTED" --transition-type grow --transition-pos 0.5,0.5 --transition-step 90 --transition-fps 60

matugen image "$SELECTED"
