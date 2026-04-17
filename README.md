# vuongngo/dotfiles

**My Arch Linux dotfiles** — managed with GNU Stow for reproducibility and modularity.

Focused on a clean, productive, and reliable daily driver using **Niri** (primary) and **Hyprland** (secondary) on Arch Linux.

## 🖼️ Previews

### Niri (Primary Window Manager)

<div align="center">
  <img src="niri/preview/preview00.png" alt="Niri Desktop Preview" width="800" style="border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
  <p><em>Scrollable tiling Wayland compositor with clean interface</em></p>
</div>

### Hyprland (Secondary Window Manager)

<div align="center">
  <img src="hyprland/preview/preview_01.png" alt="Hyprland Desktop Preview" width="800" style="border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
  <p><em>Feature-rich Wayland compositor with dynamic tiling</em></p>
</div>

## ✨ Highlights & Key Features

- **Modular structure**: Separate folders for common configs, Niri, and Hyprland — easy to maintain and extend
- **Reproducible setup**: One-command installation using GNU Stow — ensures consistent environment across machines
- **Minimal & performant**: Optimized for Wayland, tiling workflow, and system administration tasks — low resource usage
- **System Engineer mindset**: Clean organization, version-controlled configs, and automation-ready (scripts, backup, switch WM)
- **Wayland-native**: Full Wayland support with modern protocols for better performance and security
- **Tiling workflow**: Efficient window management for productivity and multitasking
- **Customizable**: Extensive configuration options for personalization

This repository demonstrates my ability to manage complex configurations as code — a core skill for Infrastructure as Code (IaC), automation, and reliable system design.

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
├── README.MD                  # This file
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
├── .git/                      # Git repository metadata
├── .gitignore                 # Git ignore rules
└── README.MD                  # Documentation file
```

## 🔧 Configuration Details

### Core Tools (`/.config/`)

- **nvim/**: Neovim configuration for development
- **rofi/**: Application launcher and menu system
- **foot/**: Lightweight terminal emulator optimized for Wayland
- **kitty/**: Alternative GPU-accelerated terminal with advanced features
- **fastfetch/**: Fast system information display (neofetch alternative)
- **MangoHud/**: GPU performance monitoring overlay
- **code-flags.conf**: VS Code optimization flags for better performance
- **electron-flags.conf**: Electron app optimization flags
- **clean.sh**: Utility script to clean temporary files and caches

### Window Manager Configs

#### Niri (Primary - `./niri/`)

Niri is a scrollable tiling Wayland compositor designed for usability and performance.

**Key Features:**
- Scrollable tiling layout with smooth animations
- Configurable workspaces and window management
- Built-in screenshot functionality
- Hotkey-based window switching and manipulation
- Support for multiple monitors with per-monitor configurations

**Configuration Structure:**
```
niri/
├── .config/
│   ├── config.kdl          # Main configuration file in KDL format
│   └── ...                 # Additional config files if needed
└── preview/                # Screenshots and previews
```

**Sample Keybindings (excerpt from config.kdl):**
```kdl
input {
    keyboard {
        xkb {
            layout "us"
            options "caps:escape"
        }
    }
    
    // Window management
    bind "Super+T" { spawn "foot"; }
    bind "Super+D" { spawn "rofi -show drun"; }
    bind "Super+Q" { close-window; }
    bind "Super+Shift+Q" { quit; }
    
    // Layout switching
    bind "Super+Space" { toggle-window-floating; }
    bind "Super+F" { maximize-column; }
    bind "Super+Shift+F" { fullscreen-window; }
}
```

**Layout Options:**
- Column-based tiling with scrollable workspaces
- Floating windows support
- Customizable gaps and borders
- Workspace switching with Super+1-9

#### Hyprland (Secondary - `./hyprland/`)

Hyprland is a dynamic tiling Wayland compositor with extensive customization options.

**Key Features:**
- Dynamic tiling with multiple layout modes
- Advanced window rules and animations
- Plugin system for extended functionality
- Multi-monitor support with per-monitor rules
- Extensive theming and visual customization

**Configuration Structure:**
```
hyprland/
├── .config/
│   ├── hypr/
│   │   ├── hyprland.conf    # Main configuration file
│   │   ├── hyprpaper.conf   # Wallpaper configuration
│   │   └── ...              # Additional config files
│   └── ...                  # Other Hyprland-related configs
└── preview/                 # Screenshots and previews
```

**Sample Configuration (excerpt from hyprland.conf):**
```bash
# Monitor configuration
monitor=,preferred,auto,auto

# Environment variables
env = XCURSOR_SIZE,24
env = QT_QPA_PLATFORMTHEME,qt6ct

# Keybindings
$mainMod = SUPER

# Applications
bind = $mainMod, Q, exec, kitty
bind = $mainMod, C, killactive,
bind = $mainMod, M, exit,
bind = $mainMod, E, exec, dolphin
bind = $mainMod, V, togglefloating,
bind = $mainMod, R, exec, rofi -show drun
bind = $mainMod, P, pseudo,
bind = $mainMod, J, togglesplit,

# Window rules
windowrule = float, ^(pavucontrol)$
windowrule = float, ^(blueman-manager)$
windowrule = float, ^(nm-connection-editor)$

# Animations
animations {
    enabled = yes
    bezier = myBezier, 0.05, 0.9, 0.1, 1.05
    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}
```

### Shell Configuration (Zsh)

**Location:** Managed by `install/install_zsh.sh` and symlinked via Stow

**Features:**
- Zsh with Oh My Zsh framework
- Bira theme for clean, informative prompt
- Useful plugins: git, docker, kubectl, etc.
- Custom aliases and functions
- Environment variables for development

**Key Configurations:**
```bash
# Theme
ZSH_THEME="bira"

# Plugins
plugins=(git docker kubectl python pip npm yarn)

# Custom aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'

# Environment
export EDITOR='nvim'
export VISUAL='nvim'
export PATH="$HOME/.local/bin:$PATH"
```

### Terminal Configuration

#### Foot (Primary Terminal)
**Location:** `~/.config/foot/`

**Key Features:**
- Wayland-native terminal emulator
- Lightweight and fast
- Customizable colors and fonts
- Scrollback buffer
- URL detection and launching

**Sample Configuration (foot.ini):**
```ini
[main]
font=JetBrains Mono:size=11
dpi-aware=yes

[colors]
alpha=0.9
background=1e1e2e
foreground=c0caf5

# Color palette (Catppuccin Mocha)
regular0=1e1e2e  # black
regular1=f38ba8  # red
regular2=a6e3a1  # green
regular3=f9e2af  # yellow
regular4=89b4fa  # blue
regular5=f5c2e7  # magenta
regular6=94e2d5  # cyan
regular7=c0caf5  # white

bright0=45475a   # bright black
bright1=f38ba8   # bright red
bright2=a6e3a1   # bright green
bright3=f9e2af   # bright yellow
bright4=89b4fa   # bright blue
bright5=f5c2e7   # bright magenta
bright6=94e2d5   # bright cyan
bright7=c0caf5   # bright white
```

#### Kitty (Alternative Terminal)
**Location:** `~/.config/kitty/`

**Key Features:**
- GPU-accelerated rendering
- Advanced features like tabs, splits, image display
- Extensive customization options
- Fast and feature-rich

### Editor Configuration (Neovim)

**Location:** `~/.config/nvim/`

**Features:**
- Lua-based configuration
- LSP support for multiple languages
- Tree-sitter for syntax highlighting
- Telescope for fuzzy finding
- Custom keybindings and plugins

**Plugin Manager:** lazy.nvim

**Key Plugins:**
- LSP: nvim-lspconfig, mason.nvim
- Completion: nvim-cmp
- File Explorer: nvim-tree.lua
- Status Line: lualine.nvim
- Theme: catppuccin-nvim

### Application Launcher (Rofi)

**Location:** `~/.config/rofi/`

**Configuration:**
- Custom themes and colors
- Multiple modi (drun, window, etc.)
- Keybindings for navigation
- Font and layout customization

**Sample Configuration:**
```bash
rofi.theme: ~/.config/rofi/themes/catppuccin-mocha.rasi

# Keybindings
rofi.kb-primary-paste: "Control+V,Shift+Insert"
rofi.kb-secondary-paste: "Control+v,Insert"
rofi.kb-clear-line: "Control+w"
rofi.kb-move-front: "Control+a"
rofi.kb-move-end: "Control+e"
rofi.kb-move-word-back: "Alt+b"
rofi.kb-move-word-forward: "Alt+f"
rofi.kb-move-char-back: "Left,Control+b"
rofi.kb-move-char-forward: "Right,Control+f"
```

### Status Bar (Waybar)

**Location:** `~/.config/waybar/`

**Modules:**
- Workspaces
- Window title
- System tray
- Network status
- Volume control
- Battery indicator
- CPU/RAM usage
- Clock and calendar

**Sample Configuration (config.jsonc):**
```jsonc
{
    "layer": "top",
    "position": "top",
    "height": 30,
    "spacing": 4,
    "modules-left": ["hyprland/workspaces", "hyprland/window"],
    "modules-center": ["clock"],
    "modules-right": ["pulseaudio", "network", "cpu", "memory", "battery", "tray"],
    
    "hyprland/workspaces": {
        "format": "{name}",
        "on-click": "activate"
    },
    
    "clock": {
        "format": "{:%H:%M %m/%d/%Y}",
        "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>"
    },
    
    "cpu": {
        "format": "CPU {usage}%"
    },
    
    "memory": {
        "format": "RAM {}%"
    },
    
    "battery": {
        "states": {
            "warning": 30,
            "critical": 15
        },
        "format": "{capacity}% {icon}",
        "format-icons": ["", "", "", "", ""]
    }
}
```

### Notification Daemon (SwayNC)

**Location:** `~/.config/swaync/`

**Features:**
- Modern notification center for Wayland
- Customizable appearance
- Action buttons support
- Do not disturb mode
- Notification history

### Performance Monitoring (MangoHud)

**Location:** `~/.config/MangoHud/`

**Features:**
- Real-time GPU/CPU monitoring overlay
- FPS counter and performance metrics
- Customizable display options
- Works with any application

### System Information (Fastfetch)

**Location:** `~/.config/fastfetch/`

**Configuration:**
- Custom logo and color scheme
- Selective module display
- Hardware and software information
- Fast and lightweight alternative to neofetch

### Installation & Setup (`./install/`)

- **install_zsh.sh**: Configure Zsh shell with plugins and themes
- **install_bambo.sh**: Install Bamboo utility for build/deployment tasks

### Environment Files

- **.config/**: User-level configurations following XDG Base Directory specification for clean organization
- **.gitignore**: Excludes large files, temporary caches, sensitive data, and OS-specific files

## 🚀 Installation & Setup

### Prerequisites

- **Arch Linux** with base system installed
- **Git** for cloning the repository
- **GNU Stow** for managing dotfiles
- **Basic packages**: zsh, neovim, rofi, waybar, etc.

### Quick Installation

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
   # For Niri (primary)
   stow .config niri

   # For Hyprland (secondary)
   stow .config hyprland
   ```

4. **Run setup scripts**:
   ```bash
   ./install/install_zsh.sh     # Configure Zsh shell
   ./install/install_niri.sh    # Install Niri WM
   # or ./install/install_hyprland.sh for Hyprland
   ```

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

## 🤝 Contributing

This repository is primarily for personal use but welcomes improvements and suggestions. Feel free to:

- Open issues for bugs or feature requests
- Submit pull requests for enhancements
- Share your own configurations or scripts

## 📄 License

This project is licensed under the MIT License. See LICENSE file for details (if applicable).

````

3. **Link configurations with GNU Stow**:

```bash
cd ~/dotfiles-linux

# For Niri (primary setup)
stow niri
stow -t ~/ .  # Symlink .config files

# Or for Hyprland (alternative setup)
stow hyprland
stow -t ~/ .  # Symlink .config files
````

4. **Reload your window manager**:
   - **Niri**: `Super+Alt+R` or restart the session
   - **Hyprland**: `Super+Shift+Q` for quit, then relaunch

## 📋 Configuration Files

### Niri Configuration

- **Location**: `~/.config/niri/` (from `./niri/.config/`)
- **Format**: KDL (KDL Document Language)
- **Features**: Layout management, keybindings, appearance, monitor settings

### Shell Configuration (Zsh)

- **Managed by**: `install/install_zsh.sh`
- **Includes**: Theme (bira), plugins, aliases, environment variables

### Terminal Emulators

- **Foot**: Lightweight, Wayland-native terminal
- **Kitty**: Feature-rich GPU-accelerated terminal with advanced features

### Editor (Neovim)

- **Location**: `~/.config/nvim/`
- **Purpose**: Development and text editing with LSP support

### Application Launcher (Rofi)

- **Location**: `~/.config/rofi/`
- **Features**: Fast application launching, theme customization

## 🎨 Customization

1. **Switch window managers**:

   ```bash
   # Unlink current WM
   stow -D niri

   # Link new WM
   stow hyprland
   ```

2. **Edit configurations**:
   - Edit files in the dotfiles directory
   - Stow creates symlinks, so changes apply immediately
   - Reload WM to apply certain changes

3. **Add your own configs**:
   - Create a folder in the root (e.g., `my-app/`)
   - Add your config files under `.config/` subdirectory
   - Run `stow my-app` to link them

## 🔍 Key Files Overview

| File/Folder          | Purpose                   | Notes                            |
| -------------------- | ------------------------- | -------------------------------- |
| `.config/nvim/`      | Neovim editor setup       | Development environment          |
| `.config/rofi/`      | Application launcher      | Fast menu system                 |
| `.config/foot/`      | Terminal emulator         | Lightweight Wayland native       |
| `.config/kitty/`     | Alternative terminal      | GPU-accelerated with features    |
| `.config/fastfetch/` | System info display       | Neofetch alternative             |
| `.config/MangoHud/`  | GPU performance monitor   | In-game overlay utility          |
| `niri/`              | Niri WM configuration     | Primary window manager           |
| `hyprland/`          | Hyprland WM configuration | Secondary window manager         |
| `install/`           | Setup scripts             | Automated installation helpers   |
| `.gitignore`         | Git rules                 | Excludes secrets and large files |

## 📝 Usage Tips

- **Fast application launch**: `Super` + `D` (rofi launcher)
- **Terminal**: `Super` + `T` (opens foot terminal by default)
- **Switch apps**: `Super` + `Tab` or `Alt` + `Tab`
- **Reload config**: Check your WM documentation for reload keys
- **View logs**: Use `journalctl -u niri.user-session` or Hyprland logs

## 🔗 Related Resources

- [Niri Documentation](https://github.com/niri-wm/niri)
- [Hyprland Documentation](https://hyprland.org/)
- [GNU Stow Guide](https://www.gnu.org/software/stow/)
- [Wayland Ecosystem](https://wayland.freedesktop.org/)

## 📚 Project Purpose

This repository demonstrates:

- **Infrastructure as Code**: Managing system configurations as version-controlled code
- **Modular Design**: Separate, reusable components (Niri, Hyprland, common tools)
- **Automation**: Scripted setup for reproducibility across systems
- **DevOps Mindset**: Clean organization, documentation, and deployment strategy

Perfect for anyone looking to:

- Understand professional dotfiles management
- Set up Arch Linux with Wayland window managers
- Version control system configurations
- Create reproducible development environments

## ✍️ Contributing

Feel free to fork and adapt these configs to your own needs. If you find issues or want to contribute improvements, feel free to open a PR or issue.

## 📄 License

These dotfiles are provided as-is for learning and reference purposes. Feel free to use, modify, and distribute according to your needs.

---

**Last Updated**: March 2026 | **OS**: Arch Linux | **Primary WM**: Niri
