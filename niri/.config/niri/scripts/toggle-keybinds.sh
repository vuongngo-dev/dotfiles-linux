#!/bin/bash

DIR="$HOME/.config/niri/config.d"
ON="$DIR/keybinds-on.kdl"
OFF="$DIR/keybinds-off.kdl"
ACTIVE="$DIR/keybinds.kdl"

# Kiểm tra xem symlink đang trỏ về đâu
if [ "$(readlink "$ACTIVE")" = "$OFF" ]; then
    # BẬT LẠI: Bẻ biển chỉ đường trỏ về file ON
    ln -sf "$ON" "$ACTIVE"
    notify-send -t 800 "Niri" "🔓 Đã BẬT phím tắt (Normal)"
else
    # TẮT: Bẻ biển chỉ đường trỏ về file rỗng (OFF)
    ln -sf "$OFF" "$ACTIVE"
    notify-send -t 800 "Niri" "🔒 Đã TẮT phím tắt (Passthrough)"
fi