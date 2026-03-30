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
echo -e "${GREEN}   VIETNAMESE TYPING ENGINE INSTALLER (FCITX5)      ${NC}"
echo -e "${BLUE}====================================================${NC}\n"

# ------------------------------------------------------------------------------
# PACKAGE LIST FOR WAYLAND COMPATIBILITY
# ------------------------------------------------------------------------------
FCITX5_PACKAGES=(
    "fcitx5"               # The core input method framework
    "fcitx5-configtool"    # GUI configuration tool (very important)
    "fcitx5-gtk"           # Support for GTK applications (GNOME apps, Thunar, etc.)
    "fcitx5-qt"            # Support for Qt applications (KDE apps, Telegram, etc.)
    "fcitx5-bamboo"        # The absolute best Vietnamese input engine (Telex/VNI)
)

# ------------------------------------------------------------------------------
# EXECUTE INSTALLATION
# ------------------------------------------------------------------------------
echo -e "${YELLOW}[1/2] Syncing databases and installing Fcitx5 ecosystem...${NC}"
# All packages are available in the official Arch repositories
sudo pacman -Sy --needed --noconfirm "${FCITX5_PACKAGES[@]}"

# ------------------------------------------------------------------------------
# COMPLETION
# ------------------------------------------------------------------------------
echo -e "\n${BLUE}====================================================${NC}"
echo -e "${GREEN}[2/2] ✅ INSTALLATION COMPLETE!${NC}"
echo -e "${BLUE}====================================================${NC}"
echo -e "${YELLOW}👉 Remember to add environment variables to your hyprland.conf.${NC}"
echo -e "${YELLOW}👉 Run 'fcitx5-configtool' to add the Bamboo engine and start typing!${NC}"