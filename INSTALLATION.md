# Installation Guide & Troubleshooting

## 🚀 Detailed Installation & Setup

### Prerequisites

- **Arch Linux** with base system installed
- **Git** for cloning the repository
- **GNU Stow** for managing dotfiles
- **Basic packages**: zsh, neovim, rofi, waybar, etc.

### Step-by-Step Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/vuongngo/dotfiles.git
   cd dotfiles
   ```

2. **Install GNU Stow** (if not already installed):
   ```bash
   sudo pacman -S stow
   ```

3. **Stow configurations**:
   ```bash
   cd ~/dotfiles-linux
   
   # For Niri (primary setup)
   stow .config niri
   
   # Or for Hyprland (alternative setup)
   stow .config hyprland
   ```

4. **Run setup scripts**:
   ```bash
   ./install/install_zsh.sh     # Configure Zsh shell
   ./install/install_niri.sh    # Install Niri WM
   # or ./install/install_hyprland.sh for Hyprland
   ```

5. **Reload your window manager**:
   - **Niri**: `Super+Alt+R` or restart the session
   - **Hyprland**: `Super+Shift+Q` for quit, then relaunch

### Available Installation Scripts

- `install_zsh.sh`: Complete Zsh setup with plugins and themes
- `install_niri.sh`: Niri window manager installation
- `install_hyprland.sh`: Hyprland window manager installation
- `install_yay.sh`: Install Yay AUR helper
- `install_zram.sh`: Configure ZRAM for better memory management
- `install_gnome.sh`: GNOME desktop environment setup
- `install_kde`: KDE Plasma desktop setup
- `tool_health.sh`: System health check and diagnostics

## 🐛 Known Issues & Troubleshooting

### Common Problems
- **Wayland compatibility issues**: Some legacy applications may require XWayland
- **GPU driver problems**: Ensure proper drivers for hardware acceleration
- **Font rendering issues**: Install additional fonts for better display
- **Audio configuration**: PipeWire setup may need tweaking for some hardware

### Troubleshooting Steps
1. **Check system logs**:
   ```bash
   journalctl -xe  # View recent system logs
   ```
2. **Verify configurations**:
   - Ensure files are properly stowed: `ls -la ~/.config/`
   - Check syntax: `niri validate-config` or `hyprctl reload`
3. **Update system**:
   ```bash
   sudo pacman -Syu  # Update all packages
   ```
4. **Restart services**:
   ```bash
   systemctl --user restart pipewire  # Restart audio service
   ```

### Performance Optimization
- Use `install_zram.sh` for systems with limited RAM
- Monitor performance with MangoHud
- Run `tool_health.sh` for system diagnostics
