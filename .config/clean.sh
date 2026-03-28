#!/usr/bin/env bash

# ==============================================================================
# SCRIPT: arch-clean.sh
# DESCRIPTION: Advanced system maintenance & junk removal for Arch Linux
# ==============================================================================

# --- Terminal Colors ---
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# --- Variables ---
LOG_FILE="$HOME/.cache/system_cleanup.log"

# Function: Display space usage
check_space() {
  df -h / | awk 'NR==2 {print $4}'
}

echo -e "${BLUE}====================================================${NC}"
echo -e "${GREEN}    🛡️  ARCH SYSTEM ARCHITECT - CLEANUP TOOL        ${NC}"
echo -e "${BLUE}====================================================${NC}"

BEFORE=$(check_space)
echo -e "${YELLOW}Starting cleanup... Current free space: $BEFORE${NC}\n"

# ------------------------------------------------------------------------------
# 1. PACMAN PACKAGE MANAGER CLEANUP
# ------------------------------------------------------------------------------
echo -e "${BLUE}[1/5] Cleaning Pacman Cache...${NC}"
# paccache -r: Keeps only the last 3 versions of installed packages
# paccache -rk1: Keeps only the last 1 version of UNINSTALLED packages
if command -v paccache &>/dev/null; then
  sudo paccache -r && sudo paccache -rk1
else
  echo -e "${RED}Error: pacman-contrib not found. Installing...${NC}"
  sudo pacman -S --noconfirm pacman-contrib
fi

# ------------------------------------------------------------------------------
# 2. REMOVE ORPHANED DEPENDENCIES
# ------------------------------------------------------------------------------
echo -e "\n${BLUE}[2/5] Scanning for Orphaned Packages...${NC}"
ORPHANS=$(pacman -Qtdq)
if [ -n "$ORPHANS" ]; then
  echo -e "${YELLOW}Removing: $ORPHANS${NC}"
  sudo pacman -Rns $ORPHANS --noconfirm
else
  echo -e "${GREEN}No orphaned packages found.${NC}"
fi

# ------------------------------------------------------------------------------
# 3. SYSTEMD JOURNAL TRIMMING
# ------------------------------------------------------------------------------
echo -e "\n${BLUE}[3/5] Vacuuming Systemd Journal Logs...${NC}"
# Keep only 50MB of logs or logs from the last 2 days
sudo journalctl --vacuum-size=50M
sudo journalctl --vacuum-time=2d

# ------------------------------------------------------------------------------
# 4. USER-LEVEL CACHE & TRASH (Safe Removal)
# ------------------------------------------------------------------------------
echo -e "\n${BLUE}[4/5] Cleaning User Cache & Junk...${NC}"
# Cleaning Thunar/Dolphin thumbnails (safe to delete, they regenerate)
rm -rf ~/.cache/thumbnails/*
# Emptying the Trash bin
rm -rf ~/.local/share/Trash/*
# Cleaning VS Code cache (if you use it)
[ -d ~/.config/Code/CachedData ] && rm -rf ~/.config/Code/CachedData/*

# ------------------------------------------------------------------------------
# 5. BROKEN SYMBOLIC LINKS
# ------------------------------------------------------------------------------
echo -e "\n${BLUE}[5/5] Removing Broken Symbolic Links...${NC}"
# Search and delete links that point to nowhere in your Home dir
find ~/.local/bin -xtype l -delete 2>/dev/null

# ------------------------------------------------------------------------------
# SUMMARY
# ------------------------------------------------------------------------------
AFTER=$(check_space)
echo -e "\n${BLUE}====================================================${NC}"
echo -e "${GREEN}✅ CLEANUP FINISHED!${NC}"
echo -e "${YELLOW}Space before: $BEFORE | Space after: $AFTER${NC}"
echo -e "${BLUE}====================================================${NC}"
