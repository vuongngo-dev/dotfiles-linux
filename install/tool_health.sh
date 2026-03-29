#!/bin/bash

# Danh sách các gói cần cài đặt
PACKAGES=("lm_sensors" "smartmontools" "upower" "bc")

echo "--- Đang kiểm tra và cài đặt các công cụ hệ thống ---"

# Cập nhật cơ sở dữ liệu pacman trước khi cài
sudo pacman -Sy

for pkg in "${PACKAGES[@]}"; do
    if pacman -Qs "$pkg" >/dev/null; then
        echo -e "[✓] $pkg đã được cài đặt từ trước."
    else
        echo -e "[!] Đang cài đặt $pkg..."
        sudo pacman -S "$pkg" --noconfirm
    fi
done

echo "--- Cấu hình bổ sung ---"

# Tự động cấu hình lm_sensors (nhấn Enter cho tất cả câu hỏi)
echo "Đang cấu hình cảm biến nhiệt độ (sensors-detect)..."
sudo sensors-detect --auto >/dev/null

# Kích hoạt dịch vụ smartmontools để theo dõi ổ cứng liên tục
sudo systemctl enable --now smartd

echo "Hoàn tất! Bây giờ bạn có thể chạy script check-sys.sh của mình."