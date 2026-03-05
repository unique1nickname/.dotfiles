# Src: https://github.com/thnikk/fuzzel-scripts/blob/master/fuzzel-powermenu.sh

#!/usr/bin/env bash

SELECTION="$(printf "󰌾  Lock\n󰤄  Suspend\n󰈆  Log out\n󰑐  Reboot\n󰐥  Shutdown" | fuzzel --dmenu -l 5 --placeholder  "$(uptime -p)" --hide-prompt --width=12)" || exit 0 

case $SELECTION in
	*"Lock")
		swaylock;;
	*"Suspend")
		# swaylock & disown && systemctl suspend;;
		systemctl suspend;;
  *"Log out")
		niri msg action quit -s;;
	*"Reboot")
		systemctl reboot;;
	#*"Reboot to UEFI")
	#	systemctl reboot --firmware-setup;;
	*"Shutdown")
		systemctl poweroff;;
esac
