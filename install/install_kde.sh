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
echo -e "${GREEN}      KDE PLASMA MINIMAL INSTALLER (BACKUP)         ${NC}"
echo -e "${BLUE}====================================================${NC}\n"

# ------------------------------------------------------------------------------
# ESSENTIAL PACKAGES ONLY (No bloatware)
# ------------------------------------------------------------------------------
KDE_MINIMAL=(
    "plasma-desktop"       # Core desktop environment
    "sddm"                 # Login manager to switch between Hyprland/KDE
    "plasma-nm"            # Network management applet
    "kscreen"              # Display & Monitor management
    "kde-gtk-config"
    "bluedevil"            # Bluetooth GUI
    "dolphin"              # File manager (Great backup for Hyprland)
)

# ------------------------------------------------------------------------------
# EXECUTE INSTALLATION
# ------------------------------------------------------------------------------
echo -e "${YELLOW}[1/3] Installing KDE core components...${NC}"
sudo pacman -Sy --needed --noconfirm "${KDE_MINIMAL[@]}"

echo -e "\n${YELLOW}[2/3] Enabling SDDM Service...${NC}"
sudo systemctl enable sddm

# ------------------------------------------------------------------------------
# COMPLETION
# ------------------------------------------------------------------------------
echo -e "\n${BLUE}====================================================${NC}"
echo -e "${GREEN}[3/3] ✅ BACKUP DE IS READY!${NC}"
echo -e "${BLUE}====================================================${NC}"
echo -e "${YELLOW}👉 Choose 'Plasma (Wayland)' at the login screen when needed.${NC}"