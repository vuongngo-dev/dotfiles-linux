#!/usr/bin/env bash

# ==============================================================================
# TERMINAL COLOR CODES
# ==============================================================================
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}====================================================${NC}"
echo -e "${GREEN}    GNOME-HYPRLAND SYSTEM ENGINEER TOOLKIT        ${NC}"
echo -e "${BLUE}====================================================${NC}\n"

# ------------------------------------------------------------------------------
# THE ULTIMATE PACKAGE LIST (GTK Based & Optimized for Nitro 5)
# ------------------------------------------------------------------------------
ESSENTIAL_TOOLS=(
  # 1. System Monitors (The "Pro" CLI Suite)
  "fastfetch" # System info summary
  "btop"      # Process & Resource monitor
  "nvtop"     # GPU monitor for your GTX 1650

  # 2. File & Disk Management (GNOME/GTK Stack)
  "gnome-disk-utility" # Disk partitioning & S.M.A.R.T monitoring

  # 3. Media & Productivity (Pure GTK & High Performance)
  "gnome-text-editor"    # Modern "Notepad" (Libadwaita)
  "gnome-calculator"     # Feature-rich calculator
  "gnome-font-viewer"    # Preview and install fonts
  "gnome-calendar"       # Event management
  "gnome-clocks"         # Alarm, Timer, Stopwatch
  "loupe"                # Modern, fast image viewer
  "decibels"             # Minimalist music player (Replaces Elisa)
  "gnome-sound-recorder" # GNOME audio recorder (Replaces KRecorder)
  "showtime"             # Best video player for Hyprland
  "snapshot"		     # Camera


  # 4. Desktop UI & Theme Engine
  "nwg-look"                  # Core GTK Theme/Icon/Cursor manager
  "gsettings-desktop-schemas" # Essential for GNOME app settings

  # 5. Developer & Maintenance
  "neovim"         # Your primary coding environment
  "pacman-contrib" # System clean-up tools (paccache)
)

# ------------------------------------------------------------------------------
# EXECUTE INSTALLATION
# ------------------------------------------------------------------------------
echo -e "${YELLOW}[1/2] Syncing databases and deploying GNOME ecosystem...${NC}"
sudo pacman -Sy --needed --noconfirm "${ESSENTIAL_TOOLS[@]}"

# ------------------------------------------------------------------------------
# COMPLETION
# ------------------------------------------------------------------------------
echo -e "\n${BLUE}====================================================${NC}"
echo -e "${GREEN}[2/2] ✅ SYSTEM IS READY FOR WORK!${NC}"
echo -e "${BLUE}====================================================${NC}"
echo -e "${YELLOW}👉 Pro Tips for System Engineering:${NC}"
echo -e "   - Run 'nwg-look' to set your Deep Navy & Mint theme."
echo -e "   - Use 'baobab' to scan for large files on your SSD."
echo -e "   - 'evince' is now your primary tool for PDF documentation."
echo -e "   - Use 'paccache -r' to clean up old package files periodically."