# Contributing Guidelines

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

## 🤝 How to Contribute

This repository is primarily for personal use but welcomes improvements and suggestions. Feel free to:

1. **Fork the repository**
2. **Create a new branch** for your feature or bugfix
3. **Commit your changes** with descriptive messages
4. **Push your branch** and submit a **Pull Request**

You can also:
- Open issues for bugs or feature requests
- Share your own configurations or scripts that might be useful

## 🎨 Customization (For your own use)

If you fork this to create your own setup:
1. **Edit configurations**:
   - Edit files in the dotfiles directory
   - Stow creates symlinks, so changes apply immediately
   - Reload WM to apply certain changes
2. **Add your own configs**:
   - Create a folder in the root (e.g., `my-app/`)
   - Add your config files under `.config/` subdirectory
   - Run `stow my-app` to link them

## 🔗 Related Resources

- [Niri Documentation](https://github.com/niri-wm/niri)
- [Hyprland Documentation](https://hyprland.org/)
- [GNU Stow Guide](https://www.gnu.org/software/stow/)
- [Wayland Ecosystem](https://wayland.freedesktop.org/)
