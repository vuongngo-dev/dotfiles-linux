# Features & Tech Stack

## ✨ Highlights & Key Features

- **Modular structure**: Separate folders for common configs, Niri, and Hyprland — easy to maintain and extend
- **Reproducible setup**: One-command installation using GNU Stow — ensures consistent environment across machines
- **Minimal & performant**: Optimized for Wayland, tiling workflow, and system administration tasks — low resource usage
- **System Engineer mindset**: Clean organization, version-controlled configs, and automation-ready (scripts, backup, switch WM)
- **Wayland-native**: Full Wayland support with modern protocols for better performance and security
- **Tiling workflow**: Efficient window management for productivity and multitasking
- **Customizable**: Extensive configuration options for personalization

## 🛠️ Tech Stack

[![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)](https://archlinux.org/)
[![Niri](https://img.shields.io/badge/Niri-Scroll_Tiling-FF6B6B?style=for-the-badge)](https://github.com/niri-wm/niri)
[![Hyprland](https://img.shields.io/badge/Hyprland-Wayland-00ADD8?style=for-the-badge)](https://hyprland.org/)
[![Waybar](https://img.shields.io/badge/Waybar-Status_Bar-4CAF50?style=for-the-badge)](https://github.com/Alexays/Waybar)
[![Rofi](https://img.shields.io/badge/Rofi-Launcher-9C27B0?style=for-the-badge)](https://github.com/davatorium/rofi)
[![Foot](https://img.shields.io/badge/Foot-Terminal-FF9800?style=for-the-badge)](https://codeberg.org/dnkl/foot)
[![Neovim](https://img.shields.io/badge/Neovim-Editor-57A143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)

- **OS**: Arch Linux (rolling release)
- **Window Manager**:
  - Primary: [Niri](https://github.com/niri-wm/niri) — Scrollable tiling Wayland compositor
  - Secondary: [Hyprland](https://hyprland.org/) — Dynamic tiling Wayland compositor
- **Status Bar**: [waybar](https://github.com/Alexays/Waybar) — Highly customizable Wayland bar
- **Launcher**: [rofi](https://github.com/davatorium/rofi) — Window switcher, application launcher and dmenu replacement
- **Notifications**: [swaync](https://github.com/ErikReider/SwayNotificationCenter) — Notification daemon for Wayland
- **Terminal**: [foot](https://codeberg.org/dnkl/foot) / [kitty](https://sw.kovidgoyal.net/kitty/) — Modern terminal emulators
- **Shell**: zsh / bash with custom configurations
- **Editor**: [neovim](https://neovim.io/) — Hyperextensible Vim-based text editor
- **Other**: bira (zsh theme), Git, Docker-ready environment

## 📁 Repository Structure

```bash
vuongngo/dotfiles/
├── .config/                   # Global shared configurations
│   ├── MangoHud/              # GPU overlay utility configs
│   ├── fastfetch/             # System information fetcher config
│   ├── foot/                  # Terminal emulator (Wayland-native)
│   ├── kitty/                 # GPU-based terminal emulator alternative
│   ├── nvim/                  # Neovim editor configs
│   ├── rofi/                  # Application launcher & menu configs
│   ├── clean.sh               # Cleanup script
│   ├── code-flags.conf        # VS Code flags configuration
│   └── electron-flags.conf    # Electron flags configuration
├── hyprland/                  # Hyprland window manager configs
│   ├── .config/               # Hyprland-specific settings
│   └── preview/               # Preview screenshots
├── niri/                      # Niri window manager configs (primary)
│   ├── .config/               # Niri KDL configuration files
│   └── preview/               # Preview screenshots
├── install/                   # Installation scripts
│   ├── install_bambo.sh       # Install Bamboo line tool
│   └── install_zsh.sh         # Install and configure Zsh shell
```
