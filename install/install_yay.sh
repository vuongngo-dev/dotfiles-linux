#!/usr/bin/env bash

# --- COLOR DEFINITIONS ---
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
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

echo -e "${RED}yay is not installed. Proceeding with automatic installation...${NC}"
sudo pacman -S --needed --noconfirm base-devel git
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -si --noconfirm
cd ~
rm -rf /tmp/yay
echo -e "${GREEN}yay installed successfully!${NC}"