#!/bin/bash

# ==========================================
# TERMINAL COLOR PALETTE (TOKYO NIGHT THEME)
# ==========================================
BLUE='\033[38;2;122;162;247m'
PURPLE='\033[38;2;187;154;247m'
CYAN='\033[38;2;125;207;255m'
GREEN='\033[38;2;158;206;106m'
RED='\033[38;2;247;118;142m'
YELLOW='\033[38;2;224;175;104m'
RESET='\033[0m'
BOLD='\033[1m'

# Note: Ensure this variable points to the directory containing your install_*.sh files.
# If the master script is in the same directory as the individual scripts, use SCRIPT_DIR="."
SCRIPT_DIR="./install"

# ==========================================
# ORCHESTRATOR FUNCTION
# ==========================================
run_script() {
    local component_name=$1
    local script_file=$2
    local target_path="$SCRIPT_DIR/$script_file"

    echo -e "${CYAN}::${RESET} ${BOLD}Do you want to setup ${PURPLE}$component_name${RESET}? ${BOLD}[Y/n]${RESET}: \c"
    read option
    option=${option:-Y}

    if [[ "$option" == [Yy]* ]]; then
        if [[ -f "$target_path" ]]; then
            echo -e "${GREEN}==>${RESET} Executing $script_file..."
            chmod +x "$target_path"
            bash "$target_path"
            
            if [ $? -eq 0 ]; then
                echo -e "${GREEN}✔ Success:${RESET} $component_name ready."
            else
                echo -e "${RED}✘ Error:${RESET} $component_name deployment failed."
            fi
        else
            echo -e "${YELLOW}[!] Warning:${RESET} Script missing at: $target_path"
        fi
    else
        echo -e "${BLUE}>>${RESET} Skipped $component_name."
    fi
    echo -e "------------------------------------------------------"
}

# ==========================================
# MAIN MENU & EXECUTION FLOW
# ==========================================
clear
echo -e "${BLUE}${BOLD}"
echo "  █████╗ ██████╗  ██████╗██╗  ██╗"
echo " ██╔══██╗██╔══██╗██╔════╝██║  ██║"
echo " ███████║██████╔╝██║     ███████║"
echo " ██╔══██║██╔══██╗██║     ██╔══██║"
echo " ██║  ██║██║  ██║╚██████╗██║  ██║"
echo " ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝ SYSTEM ARCHITECTURE DEPLOYMENT"
echo -e "${RESET}"
echo -e "Automated Provisioning for Wayland & Core Development Environment..."
echo -e "======================================================\n"

# ---------------------------------------------------------
# PHASE 1: CORE SYSTEM & HARDWARE
# Setup foundational tools, build utilities, and hardware optimizations
# ---------------------------------------------------------
echo -e "${CYAN}${BOLD}[PHASE 1] CORE SYSTEM & HARDWARE${RESET}"
run_script "Yay (AUR Helper)" "install_yay.sh"
run_script "ZRAM (Memory Optimization)" "install_zram.sh"
run_script "Intel/Nvidia Drivers" "install_driver_intel_nvidia.sh"

# ---------------------------------------------------------
# PHASE 2: TERMINAL WORKSPACE
# Build a high-speed CLI environment before setting up the GUI
# ---------------------------------------------------------
echo -e "\n${CYAN}${BOLD}[PHASE 2] TERMINAL WORKSPACE${RESET}"
run_script "Zsh Shell Environment" "install_zsh.sh"
run_script "Neovim (Code Editor)" "install_package_nvim.sh"
run_script "Yazi (Terminal File Manager)" "install_package_yazi.sh"

# ---------------------------------------------------------
# PHASE 3: GRAPHICAL ENVIRONMENTS
# Optional installations for Desktop Environments and Compositors
# ---------------------------------------------------------
echo -e "\n${CYAN}${BOLD}[PHASE 3] GRAPHICAL ENVIRONMENTS (GUI)${RESET}"
run_script "Niri (Wayland Compositor)" "install_niri.sh"
run_script "Hyprland (Wayland Compositor)" "install_hyprland.sh"
run_script "GNOME Desktop (Base)" "install_gnome.sh"
run_script "GNOME Packages (Extensions & Tools)" "install_package_gnome.sh"
run_script "KDE Plasma Desktop" "install_kde.sh"

# ---------------------------------------------------------
# PHASE 4: LOCALIZATION & UTILITIES
# Language inputs and system-wide utilities
# ---------------------------------------------------------
echo -e "\n${CYAN}${BOLD}[PHASE 4] SYSTEM UTILITIES${RESET}"
run_script "Bamboo (Vietnamese Input)" "install_bambo.sh"

# Final Message
echo -e "\n${GREEN}${BOLD}✔ ALL DEPLOYMENT PHASES COMPLETED.${RESET}"
echo -e "Review logs above. Reboot recommended if drivers or Wayland compositors were updated."