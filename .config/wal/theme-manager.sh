#!/bin/bash

# Script for managing themes using wallpaper

# Wallpaper directory
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# --- Functions ---

run_picker() {
    find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \) |
        sed "s|^$WALLPAPER_DIR/||" |
        rofi -dmenu -i -p "Select Wallpaper" |
        xargs -r -I {} "$0" "$WALLPAPER_DIR"/{}
}

# Function to reload all applications
reload_apps() {
    hyprctl reload

    killall waybar
    waybar &

    kitty @ set-colors -a "$OUTPUT_DIR/kitty.conf" &

    killall rofi
}

# --- Main Logic ---

# Check if a wallpaper path was provided.
if [ -z "$1" ]; then
    echo "Launching Rofi..."
    run_picker
else
    WALLPAPER_PATH="$1"

    if [ ! -f "$WALLPAPER_PATH" ]; then
        echo "ERROR: $WALLPAPER_PATH not found"
        exit 1
    fi

    wal -i "$WALLPAPER_PATH" -n

    reload_apps

    swww img --transition-type wipe --transition-duration 1.5 --transition-fps 240 --transition-angle 30 --transition-step 200 "$WALLPAPER_PATH"

    echo "All themes applied."
fi
