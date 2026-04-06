#!/usr/bin/env bash

set -euo pipefail

WALL_DIR="$HOME/Pictures/wallpapers/walls/wallpapers"
STATE_FILE="$HOME/.cache/current_manga_wallpaper"

if [ ! -d "$WALL_DIR" ]; then
  echo "Wallpaper directory not found: $WALL_DIR"
  exit 1
fi

mapfile -t WALLS < <(find "$WALL_DIR" -type f \( \
  -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \
\) | sort)

if [ "${#WALLS[@]}" -eq 0 ]; then
  echo "No wallpapers found in $WALL_DIR"
  exit 1
fi

# Ensure daemon is running
if ! pgrep -x swww-daemon >/dev/null; then
  swww-daemon &
  sleep 1
fi

RANDOM_WALL="${WALLS[RANDOM % ${#WALLS[@]}]}"
printf '%s' "$RANDOM_WALL" > "$STATE_FILE"

swww img "$RANDOM_WALL" \
  --transition-type grow \
  --transition-fps 60 \
  --transition-duration 1