# vuongngo/dotfiles

**My Arch Linux dotfiles** — managed with GNU Stow for reproducibility and modularity.

Focused on a clean, productive, and reliable daily driver using **Niri** (primary) and **Hyprland** (secondary) on Arch Linux.

![Niri Screenshot](screenshots/niri.png)
![Hyprland Screenshot](screenshots/hyprland.png)

## ✨ Highlights

- **Modular structure**: Separate folders for common configs, Niri, and Hyprland
- **Reproducible setup**: One-command installation using GNU Stow
- **Minimal & performant**: Optimized for Wayland, tiling workflow, and system administration tasks
- **System Engineer mindset**: Clean organization, version-controlled configs, and automation-ready (scripts, backup, switch WM)

This repository demonstrates my ability to manage complex configurations as code — a core skill for Infrastructure as Code (IaC), automation, and reliable system design.

## 🛠️ Tech Stack

- **OS**: Arch Linux (rolling release)
- **Window Manager**:
  - Primary: [Niri](https://github.com/niri-wm/niri) — Scrollable tiling Wayland compositor
  - Secondary: [Hyprland](https://hyprland.org/)
- **Status Bar**: Waybar
- **Launcher**: Fuzzel
- **Notifications**: Mako
- **Terminal**: Alacritty / Kitty
- **Shell**: Zsh / Bash
- **Editor**: Neovim
- **Other**: Starship, Git, Docker-ready environment

## 📁 Repository Structure

```bash
vuongngo/dotfiles/
├── README.md
├── install.sh                 # Optional one-click installer
├── common/                    # Shared configurations (waybar, mako, fuzzel, alacritty, starship, nvim...)
├── hyprland/                  # Hyprland-specific configs
├── niri/                      # Niri-specific configs (config.kdl)
├── scripts/                   # Utility scripts (backup, switch-wm, system maintenance...)
└── .gitignore
```
