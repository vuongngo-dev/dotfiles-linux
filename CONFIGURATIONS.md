# Configuration Details

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

## 🔧 Window Manager Configs

### Niri (Primary - `./niri/`)

Niri is a scrollable tiling Wayland compositor designed for usability and performance.
- **Location**: `~/.config/niri/` (from `./niri/.config/`)
- **Format**: KDL (KDL Document Language)

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

### Hyprland (Secondary - `./hyprland/`)

Hyprland is a dynamic tiling Wayland compositor with extensive customization options.
- **Location**: `~/.config/hypr/` (from `./hyprland/.config/hypr/`)

**Sample Configuration (excerpt from hyprland.conf):**
```bash
# Applications
bind = $mainMod, Q, exec, kitty
bind = $mainMod, C, killactive,
bind = $mainMod, M, exit,
bind = $mainMod, E, exec, dolphin
bind = $mainMod, V, togglefloating,
bind = $mainMod, R, exec, rofi -show drun
```

## 🛠️ Core Tools Configs

### Shell Configuration (Zsh)
- **Location:** Managed by `install/install_zsh.sh` and symlinked via Stow
- **Theme**: Bira
- **Plugins**: git, docker, kubectl, python, pip, npm, yarn

### Terminal Configuration

#### Foot (Primary)
- **Location:** `~/.config/foot/`
- **Key Features:** Wayland-native, lightweight, fast, scrollback buffer, URL detection

#### Kitty (Alternative)
- **Location:** `~/.config/kitty/`
- **Key Features:** GPU-accelerated rendering, advanced features like tabs, splits, image display

### Editor Configuration (Neovim)
- **Location:** `~/.config/nvim/`
- **Plugin Manager:** lazy.nvim
- **Key Plugins:** nvim-lspconfig, mason.nvim, nvim-cmp, nvim-tree.lua, lualine.nvim, catppuccin-nvim

### Application Launcher (Rofi)
- **Location:** `~/.config/rofi/`
- **Configuration:** Custom themes (catppuccin-mocha), multiple modi, custom keybindings

### Status Bar (Waybar)
- **Location:** `~/.config/waybar/`
- **Modules:** Workspaces, Window title, System tray, Network status, Volume control, Battery indicator, CPU/RAM usage, Clock and calendar

### Notification Daemon (SwayNC)
- **Location:** `~/.config/swaync/`
- **Features:** Action buttons support, Do not disturb mode, Notification history

### Performance Monitoring (MangoHud)
- **Location:** `~/.config/MangoHud/`
- **Features:** Real-time GPU/CPU monitoring overlay, FPS counter

### System Information (Fastfetch)
- **Location:** `~/.config/fastfetch/`
- **Configuration:** Custom logo, selective module display
