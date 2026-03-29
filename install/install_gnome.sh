#!/usr/bin/env bash

# ==============================================================================
# TERMINAL COLOR CODES
# ==============================================================================
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}====================================================${NC}"
echo -e "${GREEN}      GNOME ULTRA-LITE INSTALLER (MINIMAL)         ${NC}"
echo -e "${BLUE}====================================================${NC}\n"

# ------------------------------------------------------------------------------
# THE "ZERO-BLOAT" PACKAGE LIST
# ------------------------------------------------------------------------------
GNOME=(
  # --- Core Desktop Shell ---
  "gnome-shell" # The heart of GNOME (no extra apps)
  "gdm"         # Login manager (best for GNOME-Hyprland sync)

  # --- Critical System Settings (Hardware Control) ---
  "gnome-control-center" # The main Settings app (Wifi, Bluetooth, Display)

  # --- Essential Services (The "Backbone") ---
  "gnome-keyring"     # Auto-unlock passwords for WiFi/GitHub
  "xdg-user-dirs-gtk" # Creates Downloads, Documents, etc.
  "networkmanager"    # Core network service

  # --- Theming Bridge ---
  "gsettings-desktop-schemas"
)

# ------------------------------------------------------------------------------
# EXECUTE DEPLOYMENT
# ------------------------------------------------------------------------------
echo -e "${YELLOW}[1/2] Syncing databases and deploying GNOME-Shell core...${NC}"
sudo pacman -Sy --needed --noconfirm "${GNOME[@]}"

# ------------------------------------------------------------------------------
# COMPLETION
# ------------------------------------------------------------------------------
echo -e "\n${BLUE}====================================================${NC}"
echo -e "${GREEN}[2/2] ✅ GNOME LITE IS READY!${NC}"
echo -e "${BLUE}====================================================${NC}"
echo -e "${YELLOW}👉 Profile: Deep Navy & Mint Ready${NC}"
echo -e "\n${YELLOW}👉 Next steps:${NC}"
echo -e "1. Reboot. Choose 'GNOME on Wayland' at the login screen."
echo -e "2. Use 'gnome-control-center' to manage your hardware."