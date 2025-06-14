## My Personal Dotfiles

Configuration files for my Windows development environment with WSL integration.

### Overview

This repository contains my dotfiles for:
- PowerShell with enhanced aliases and functions
- Fastfetch system information display
- Oh My Posh prompt theming
- Neovim with WSL clipboard integration
- WSL (Arch Linux & Ubuntu) with zsh configuration

### 📁 Structure

```
├── configs/
│   ├── powershell/         # PowerShell profile and modules
│   ├── fastfetch/          # System info configs (Windows, Arch, Ubuntu)
│   ├── oh-my-posh/         # Prompt themes
│   ├── neovim/             # Neovim configurations
│   └── wsl/                # WSL shell configurations
├── docs/                   # Documentation
└── final_review_gate.py    # Interactive review script
```

### 🚀 Quick Start

1. Install required tools - see [INSTALLATION.md](docs/INSTALLATION.md)
2. Apply configurations - see [SETUP.md](docs/SETUP.md)

### Features

#### PowerShell Enhancements
- Neovim integration (`vim` → `nvim`)
- Enhanced file listing with `eza`
- Interactive process management with `kfz`
- Git status integration

#### Oh My Posh Integration
I use Oh My Posh for:
- Consistent theming across Windows PowerShell and WSL environments
- Git integration showing branch status and changes at a glance
- Performance indicators displaying execution time for long-running commands
- Cross-platform compatibility ensuring the same prompt experience everywhere

#### WSL Integration
- Seamless clipboard sharing between Windows and WSL
- Configurations for both Arch Linux and Ubuntu
- Enhanced zsh experience with custom aliases

### 📚 Documentation

- [Installation Guide](docs/INSTALLATION.md)
- [Setup Guide](docs/SETUP.md)
- [Configuration Details](docs/README.md)

### About

This is my personal dotfiles repository, configured for my specific development workflow. These configurations are tailored to my environment and preferences.

Feel free to browse and adapt any configurations that might be useful for your setup.

### License

MIT License
