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

    # 3. Notify the user (Critical = stays on screen until acknowledged)
    notify-send -h string:x-dunst-stack-tag:power_save \
                -u critical \
                -i battery-caution-symbolic \
                "Power System" "MANUAL POWER SAVE: ACTIVE 🔋\nAnimations Throttled | CPU Throttled"
else
    # --- ⚡ RESTORE PERFORMANCE MODE ---
    rm "$FLAG"

    # 1. Restore CPU to performance (For SQL/Java workloads)
    powerprofilesctl set balanced

    # 2. Restore screen brightness to 80%
    brightnessctl set 80%

    # 3. Notify the user
    notify-send -h string:x-dunst-stack-tag:power_save \
                -u normal \
                -i battery-full-symbolic \
                "Power System" "NORMAL MODE: RESTORED ⚡\nBalanced Performance"
fi