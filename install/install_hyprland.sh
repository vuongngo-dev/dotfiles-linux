#!/usr/bin/env bash

# --- COLOR DEFINITIONS ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
LAVENDER='\033[0;35m'
NC='\033[0m'

# --- DISPLAY LOGO ---
show_logo() {
    clear
    echo -e "${LAVENDER}"
    cat << "EOF"
  ================================================
    _   ____  ______  _  _______  _  ___________ 
   | | / / / / / __ \/ |/ / ___/ / |/ / ___/ __ \
   | |/ / /_/ / /_/ /    / (_ / /    / (_ / /_/ /
   |___/\____/\____/_/|_/\___/ /_/|_/\___/\____/ 
  ================================================
EOF
    echo -e "${NC}"
    echo -e "${BLUE}>>> Starting System Installation ...${NC}"
    echo "------------------------------------------------"
}

# Call the function
show_logo

# ==============================================================================
# TERMINAL COLOR CODES
# ==============================================================================

echo -e "${BLUE}====================================================${NC}"
echo -e "${GREEN}      HYPRLAND ECOSYSTEM INSTALLER (ULTIMATE)       ${NC}"
echo -e "${BLUE}====================================================${NC}\n"

# ------------------------------------------------------------------------------
# PACKAGE LIST FOR A FULL HYPRLAND & HARDWARE EXPERIENCE
# ------------------------------------------------------------------------------
HYPR_PACKAGES=(
    # --- Core Compositor & Wayland Protocols ---
    "hyprland"                    # Core Wayland compositor (Main environment)
    "xdg-desktop-portal-hyprland" # Crucial for screen sharing and app communication
    "qt5-wayland" "qt6-wayland"   # Ensures Qt5/Qt6 apps run natively on Wayland

    # --- Thunar File Manager & Enhanced Plugins (Dolphin-like features) ---
    "gvfs" "gvfs-mtp" # Trash support, network mounting, and mobile devices

    # --- Desktop Environment & UI Components ---
    "waybar"              # Highly customizable status bar
    "rofi-wayland"        # Dynamic application launcher & menu
    "swaync"              # Notification daemon with built-in control center
    "swaybg"              # Lower-performance wallpaper daemon (animated)
    "hyprlock" "hypridle" # Modern screen locking and idle/sleep management

    # --- System Infrastructure & Hardware Integration ---
    "foot"                    # GPU-accelerated terminal emulator
    "polkit-gnome"            # Provides graphical password prompts (Auth)
    "wl-clipboard" "cliphist" # System clipboard manager and history
    "hyprshot"                # Efficient screenshot tool tailored for Hyprland
    "brightnessctl"           # CLI for controlling display brightness
    "pavucontrol"             # GUI for PulseAudio/Pipewire volume management
    "network-manager-applet"  # System tray icon for WiFi/Network control
    "blueman"                 # GUI for managing Bluetooth connections
    "libnotify"               # Core library for sending desktop notifications
    "wlsunset"                # Night light/Blue light filter for Wayland
)

# ------------------------------------------------------------------------------
# EXECUTE INSTALLATION
# ------------------------------------------------------------------------------
echo -e "${YELLOW}[1/3] Syncing repositories and deploying ecosystem...${NC}"
sudo pacman -Sy --needed --noconfirm "${HYPR_PACKAGES[@]}"

# ------------------------------------------------------------------------------
# COMPLETION SUMMARY
# ------------------------------------------------------------------------------
echo -e "\n${BLUE}====================================================${NC}"
echo -e "${GREEN}✅ HYPRLAND SYSTEM IS FULLY EQUIPPED!${NC}"
echo -e "${BLUE}====================================================${NC}"
echo -e "${YELLOW}👉 System Profile:${NC}"
echo -e "   - Device: Acer Nitro 5 (i5 11th Gen + GTX 1650)"
echo -e "   - Focus: System Engineering & Web Development"
echo -e "   - File Manager: Thunar (Configured for performance)"

echo -e "\n${YELLOW}👉 Important Post-Install Steps:${NC}"
echo -e "1. Reboot to ensure NVIDIA DRM modeset is active."
echo -e "2. Run 'nwg-look' to sync GTK themes for Thunar."
echo -e "3. Enjoy your Deep Navy & Mint productivity environment!${NC}"