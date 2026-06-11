#!/usr/bin/env bash

# Путь к файлу-переключателю (создается в той же папке, что и config.kdl)
TARGET_FILE="$HOME/.config/niri/config/screencapture.kdl"

SELECTION="$(printf "󰄘 On\n󰞊 Off" | fuzzel --dmenu -l 5 --placeholder "$(uptime -p)" --hide-prompt --width=6 --lines=2)" || exit 0 

case $SELECTION in
    *"On")
        # Записываем работающее правило
        cat << 'EOF' > "$TARGET_FILE"
window-rule {
    match app-id=r#"^org\.telegram\.desktop$"#
    block-out-from "screen-capture"
}
EOF
        ;;
    *"Off")
        # Полностью очищаем файл, убирая правило из niri
        echo "" > "$TARGET_FILE"
        ;;
esac
