#!/bin/bash

# ============================================================
# Script: Manual Power Saving Toggle (Extreme Mode)
# Platform: Arch Linux x Niri (Wayland)
# ============================================================

# Temporary flag file to track the current state
FLAG="/tmp/niri_power_save_active"

if [ ! -f "$FLAG" ]; then
    # --- ENABLE POWER SAVING MODE ---
    touch "$FLAG"

    # 1. Throttle CPU to power-saver profile
    powerprofilesctl set power-saver

    # 2. Dim screen to 20% (Optimized for indoor study)
    brightnessctl set 20%

    # 3. Disable Niri animations to reduce GPU/CPU overhead
    # In Niri, setting slowdown to 0 or a very high number effectively stops them
    # But the official way is to 'set-column-width' to instant or use the msg action:
    niri msg action set-slowdown 10.0 # Extreme slowdown makes it feel instant/static

    # 4. Notify the user (Critical = stays on screen until acknowledged)
    notify-send -h string:x-dunst-stack-tag:power_save \
                -u critical \
                -i battery-caution-symbolic \
                "Power System" "MANUAL POWER SAVE: ACTIVE 🔋\nAnimations Throttled | CPU Throttled"
else
    # --- ⚡ RESTORE PERFORMANCE MODE ---
    rm "$FLAG"

    # 1. Restore CPU to performance (For SQL/Java workloads)
    powerprofilesctl set performance

    # 2. Restore screen brightness to 85%
    brightnessctl set 85%

    # 3. Restore Niri animations to normal speed
    niri msg action set-slowdown 1.0

    # 4. Notify the user
    notify-send -h string:x-dunst-stack-tag:power_save \
                -u normal \
                -i battery-full-symbolic \
                "Power System" "NORMAL MODE: RESTORED ⚡\nAnimations Enabled | Performance Peak"
fi