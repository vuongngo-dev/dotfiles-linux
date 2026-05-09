#!/bin/bash

# Kiểm tra xem prime-run có tồn tại không để tránh lỗi
if ! command -v prime-run &> /dev/null; then
    notify-send "Lỗi" "Không tìm thấy lệnh prime-run. Vui lòng cài đặt driver NVIDIA."
    exit 1
fi

rofi -show drun \
    -theme "$HOME/.config/rofi/config.rasi" \
    -run-list-command ". $HOME/.bashrc" \
    -run-command "prime-run {cmd}" \
    -display-drun "󰾲  GPU Mode" \
    -drun-display-format "{name}"
