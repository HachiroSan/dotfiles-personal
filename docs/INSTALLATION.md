# 📦 Installation Guide

This guide will help you install all the necessary tools to use these dotfiles effectively on Windows with WSL.

## 🛠️ Required Tools

### Windows Tools

#### 1. Windows Terminal
- **Method 1 (Recommended):** Install from Microsoft Store
- **Method 2:** Download from [GitHub Releases](https://github.com/microsoft/terminal/releases)

#### 2. PowerShell 7+
```powershell
# Using winget
winget install Microsoft.PowerShell

# Or download from: https://github.com/PowerShell/PowerShell/releases
```

#### 3. Oh My Posh
```powershell
# Using winget
winget install JanDeDobbeleer.OhMyPosh

# Or using PowerShell
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))
```

#### 4. Fastfetch
```powershell
# Using winget
winget install Fastfetch-cli.Fastfetch

# Or using scoop
scoop install fastfetch
```

#### 5. Neovim
```powershell
# Using winget
winget install Neovim.Neovim

# Or using scoop
scoop install neovim
```

#### 6. eza (Modern ls replacement)
```powershell
# Using winget
winget install eza-community.eza

# Or using scoop
scoop install eza
```

#### 7. fzf (Fuzzy finder)
```powershell
# Using winget
winget install junegunn.fzf

# Or using scoop
scoop install fzf
```

#### 8. Git (if not already installed)
```powershell
# Using winget
winget install Git.Git
```

### WSL Tools

#### 1. Install WSL 2
```powershell
# Run as Administrator
wsl --install

# Or install specific distributions
wsl --install -d Ubuntu
wsl --install -d Arch
```

#### 2. Arch Linux WSL Setup
```bash
# Update system
sudo pacman -Syu

# Install essential tools
sudo pacman -S git neovim eza fzf fastfetch zsh

# Install oh-my-zsh (optional but recommended)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### 3. Ubuntu WSL Setup
```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install essential tools
sudo apt install git neovim fzf zsh curl -y

# Install eza
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install eza

# Install fastfetch
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
sudo apt update
sudo apt install fastfetch

# Install oh-my-zsh (optional but recommended)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## 🔧 Additional Setup

### Windows Terminal Configuration
1. Open Windows Terminal
2. Go to Settings (Ctrl + ,)
3. Set PowerShell 7 as default profile
4. Configure WSL profiles for Arch and Ubuntu

### Font Installation (Recommended)
Install a Nerd Font for proper icon display:

```powershell
# Using oh-my-posh
oh-my-posh font install

# Or manually download from: https://www.nerdfonts.com/
# Recommended: FiraCode Nerd Font, JetBrainsMono Nerd Font
```

### WSL Clipboard Integration
For Neovim clipboard integration, install win32yank:

```bash
# In WSL
curl -sLo /tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/latest/download/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/
```

## ✅ Verification Commands

Test if tools are installed correctly:

### Windows (PowerShell)
```powershell
# Check versions
pwsh --version
oh-my-posh --version
fastfetch --version
nvim --version
eza --version
fzf --version
git --version
```

### WSL
```bash
# Check versions
nvim --version
eza --version
fzf --version
fastfetch --version
zsh --version
```

## 🚨 Troubleshooting

### Common Issues

#### 1. PowerShell Execution Policy
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### 2. Path Issues
Ensure tools are in your PATH. You may need to restart your terminal or add to PATH manually.

#### 3. WSL 2 Not Working
```powershell
# Enable required Windows features
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Set WSL 2 as default
wsl --set-default-version 2
```

#### 4. Font Rendering Issues
- Install a Nerd Font
- Set it in Windows Terminal settings
- Restart Windows Terminal

## 📋 Installation Checklist

- [ ] Windows Terminal
- [ ] PowerShell 7+
- [ ] Oh My Posh
- [ ] Fastfetch
- [ ] Neovim
- [ ] eza
- [ ] fzf
- [ ] Git
- [ ] WSL 2
- [ ] WSL distributions (Arch/Ubuntu)
- [ ] Nerd Font
- [ ] win32yank (for clipboard)

## 🔄 Next Steps

After installing all tools, proceed to [SETUP.md](SETUP.md) to configure your dotfiles. 