#!/bin/bash

# ============================================================
# Script: Niri Monitor Layout Switcher (Windows Style)
# Platform: Arch Linux x Niri (Wayland)
# ============================================================

# 1. Define options with Nerd Font icons
options="💻 PC screen only\n🖥️ Extend\n📺 Second screen only"

# 2. Launch Rofi
choice=$(echo -e "$options" | rofi -dmenu -i -p "📺 Project:" -theme ~/.config/rofi/scripts/monitor-layout/monitor-layout.rasi)

[ -z "$choice" ] && exit 0

# 3. Detect monitors using niri msg
# Niri outputs are typically named eDP-1, HDMI-A-1, etc.
LAPTOP=$(niri msg outputs | grep -o "eDP-[0-9]" | head -n 1)
EXTERNAL=$(niri msg outputs | grep -v "eDP" | grep -o "[A-Z]\+-[A-Z0-9]\+-[0-9]" | head -n 1)

# Fallback check for external monitor
if [ -z "$EXTERNAL" ]; then
    notify-send -u critical -i video-display "Display Error" "No external monitor detected!"
    exit 1
fi

case "$choice" in
    *"PC screen only"*)
        # Enable Laptop, Disable External
        niri msg action output-on "$LAPTOP"
        niri msg action output-off "$EXTERNAL"
        notify-send -h string:x-dunst-stack-tag:monitor -i computer "Display" "Switched to: PC Screen Only"
        ;;
        
    *"Extend"*)
        # Both ON - Niri handles positioning via config.kdl, 
        # but we ensure both are powered on.
        niri msg action output-on "$LAPTOP"
        niri msg action output-on "$EXTERNAL"
        notify-send -h string:x-dunst-stack-tag:monitor -i video-display "Display" "Switched to: Extend Mode"
        ;;
        
    *"Second screen only"*)
        # Disable Laptop, Enable External
        niri msg action output-on "$EXTERNAL"
        niri msg action output-off "$LAPTOP"
        notify-send -h string:x-dunst-stack-tag:monitor -i video-television "Display" "Switched to: External Only"
        ;;
esac