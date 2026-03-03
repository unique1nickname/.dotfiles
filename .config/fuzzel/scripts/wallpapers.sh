#!/usr/bin/env bash
NIRI_CONF_DIR="$HOME/.config/niri" 
WALL_DIR="$HOME/.config/niri/wallpapers"
SELECTION="$(ls "$WALL_DIR" | fuzzel --dmenu --placeholder  "Choose Wallpapers")" || exit 0 

# ls /home/saveliy/.config/niri/wallpapers | fuzzel -d

if [ -n "$SELECTION" ]; then
    # Убиваем старый процесс swaybg, чтобы не плодить их
	FULL_WALL_DIR="$WALL_DIR/$SELECTION"
    pkill swaybg
    
    # Запускаем новый процесс в фоне
    swaybg -i "$FULL_WALL_DIR" -m fill &
    ln -sf "$FULL_WALL_DIR" "$NIRI_CONF_DIR/current_wallpaper"
fi





# #!/usr/bin/env bash
# 
# # Путь к папке с обоями
# WALL_DIR="$HOME/Pictures/Wallpapers"
# 
# # Выбираем файл через fuzzel
# # find выводит полные пути, чтобы swaybg их точно нашел
# SELECTED=$(find "$WALL_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) | fuzzel -d -p "Выберите обои: ")
# 
# # Если выбор сделан (нажат Enter, а не Esc)
# if [ -n "$SELECTED" ]; then
#     # Убиваем старый процесс swaybg, чтобы не плодить их
#     pkill swaybg
#     
#     # Запускаем новый процесс в фоне
#     swaybg -i "$SELECTED" -m fill &
# fi
