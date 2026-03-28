#!/usr/bin/env bash

# Define options with Nerd Font icons
lock="  Lock"
logout="  Logout"
suspend="  Suspend"
reboot="  Reboot"
shutdown="  Shutdown"

# Combined message for a professional look
message="System"
options="$lock\n$logout\n$suspend\n$reboot\n$shutdown"

# Launch Rofi
chosen="$(echo -e "$options" | rofi -dmenu -i -p "Power" \
    -theme ~/.config/rofi/scripts/power-menu/power-menu.rasi \
    -mesg "$message")"

case "$chosen" in
    "$lock")
        # Direct call to swaylock (using your Matrix green color -c 003300)
        swaylock -f -c 003300
        ;;
    "$logout")
        # Correct Niri action to exit the session
        niri msg action quit --skip-confirmation
        ;;
    "$suspend")
        # 1. Close SwayNC panel if open
        swaync-client -cp
        # 2. Lock screen first for security
        swaylock -f -c 003300 &
        sleep 1
        # 3. System-level suspend
        systemctl suspend
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$shutdown")
        systemctl poweroff
        ;;
esac