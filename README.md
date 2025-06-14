# 🏠 Personal Dotfiles for Windows & WSL

A curated collection of configuration files for a productive Windows development environment with WSL integration.

## 📋 Quick Overview

This dotfiles collection provides configurations for:
- **PowerShell** with enhanced aliases and functions
- **Fastfetch** system information display for multiple environments
- **Oh My Posh** beautiful prompt theming
- **Neovim** with WSL clipboard integration
- **WSL** (Arch Linux & Ubuntu) with zsh configuration

## 🗂️ Structure

```
├── configs/
│   ├── powershell/         # PowerShell profile and modules
│   ├── fastfetch/          # System info display configs (Windows, Arch, Ubuntu)
│   ├── oh-my-posh/         # Prompt themes
│   ├── neovim/             # Neovim configurations
│   └── wsl/                # WSL shell configurations
├── docs/                   # Documentation
└── final_review_gate.py    # Interactive review script
```

## 🚀 Quick Start

1. **Install Required Tools** - See [INSTALLATION.md](docs/INSTALLATION.md)
2. **Setup Configurations** - See [SETUP.md](docs/SETUP.md)
3. **Enjoy your enhanced terminal experience!**

## 📚 Documentation

- [📦 Installation Guide](docs/INSTALLATION.md) - What tools to install and how
- [⚙️ Setup Guide](docs/SETUP.md) - How to apply the configurations
- [🔧 Configuration Details](docs/README.md) - Detailed explanation of each config

## 💡 Features

### PowerShell Enhancements
- **Neovim alias** - `vim` → `nvim`
- **eza integration** - Better `ls` with colors and icons
- **Process killer** - `kfz` function for fzf-powered process management
- **Git integration** - Enhanced git status in file listings

### Terminal Aesthetics
- **Fastfetch** - Beautiful system information on startup
- **Oh My Posh** - Powerline-style prompt with git integration
- **Multi-environment** - Configs for Windows, Arch Linux, and Ubuntu

### Development Tools
- **WSL Integration** - Seamless clipboard sharing with Windows
- **Multiple distros** - Configs for both Arch Linux and Ubuntu
- **Shell enhancements** - Improved zsh experience with aliases and functions

## 🎯 Terminal Commands Reference

### WSL Launch Commands
```powershell
# Arch Linux
C:\Users\Hachiro-X\AppData\Local\Microsoft\WindowsApps\wt.exe --profile "archlinux"

# Ubuntu
C:\Users\Hachiro-X\AppData\Local\Microsoft\WindowsApps\wt.exe --profile "ubuntu"
```

### PowerShell Functions
- `l` - Long listing with eza
- `ll` - Long listing with hidden files
- `la` - All files
- `lt` - Tree view
- `lg` - Git status integration
- `kfz` - Interactive process killer with fzf

## ⚡ Quick Setup Commands

```powershell
# Clone this repository
git clone <your-repo-url> ~/dotfiles

# Follow the installation guide
# Then create symbolic links (see SETUP.md)
```

## 🤝 Contributing

Feel free to fork this repository and customize it for your own needs. Each configuration is modular and can be used independently.

## 📝 License

This project is open source and available under the [MIT License](LICENSE).
