# ⚙️ Setup Guide

This guide explains how to apply your dotfiles configurations after installing all required tools.

## 🎯 Overview

The setup process involves creating symbolic links or copying configuration files to their appropriate locations on your system.

## 📍 File Locations

### Windows PowerShell Profile
```powershell
# Profile location
$PROFILE
# Usually: C:\Users\<username>\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
```

### Oh My Posh Theme
```powershell
# Theme directory (after installing Oh My Posh)
$env:POSH_THEMES_PATH
# Usually: C:\Users\<username>\AppData\Local\Programs\oh-my-posh\themes\
```

### Fastfetch Configuration
```powershell
# Windows fastfetch config location
C:\ProgramData\fastfetch\
# Or user-specific location
%USERPROFILE%\.config\fastfetch\
```

### Neovim Configuration
```powershell
# Windows Neovim config location
%USERPROFILE%\AppData\Local\nvim\
```

### WSL Configuration Files
```bash
# Home directory files
~/.zshrc
~/.config/fastfetch/config.jsonc
```

## 🔧 Setup Steps

### 1. Clone This Repository

```powershell
# Choose your preferred location
git clone <your-repo-url> C:\dotfiles
# Or
git clone <your-repo-url> %USERPROFILE%\dotfiles
```

### 2. PowerShell Profile Setup

#### Option A: Symbolic Link (Recommended)
```powershell
# Check if profile directory exists
$profileDir = Split-Path $PROFILE
if (!(Test-Path $profileDir)) {
    New-Item -ItemType Directory -Path $profileDir -Force
}

# Create symbolic link
New-Item -ItemType SymbolicLink -Path $PROFILE -Target "C:\dotfiles\configs\powershell\Microsoft.PowerShell_profile.ps1" -Force
```

#### Option B: Copy File
```powershell
# Copy the profile
Copy-Item "C:\dotfiles\configs\powershell\Microsoft.PowerShell_profile.ps1" -Destination $PROFILE -Force
```

### 3. Oh My Posh Theme Setup

#### Method 1: Copy to Themes Directory
```powershell
# Copy theme to Oh My Posh themes directory
Copy-Item "C:\dotfiles\configs\oh-my-posh\bluish-v2.omp.json" -Destination "$env:POSH_THEMES_PATH\bluish-v2.omp.json" -Force
```

#### Method 2: Set Custom Path
```powershell
# Or use direct path in your PowerShell profile
# oh-my-posh init pwsh --config "C:\dotfiles\configs\oh-my-posh\bluish-v2.omp.json" | Invoke-Expression
```

### 4. Fastfetch Configuration Setup

#### Windows Fastfetch
```powershell
# Create config directory if it doesn't exist
$fastfetchDir = "C:\ProgramData\fastfetch"
if (!(Test-Path $fastfetchDir)) {
    New-Item -ItemType Directory -Path $fastfetchDir -Force
}

# Copy PowerShell config
Copy-Item "C:\dotfiles\configs\fastfetch\powershell.jsonc" -Destination "$fastfetchDir\powershell.jsonc" -Force
```

#### WSL Fastfetch (Arch)
```bash
# Create config directory
mkdir -p ~/.config/fastfetch

# Create symbolic link or copy
ln -sf /mnt/c/dotfiles/configs/fastfetch/arch.jsonc ~/.config/fastfetch/config.jsonc
# Or copy
cp /mnt/c/dotfiles/configs/fastfetch/arch.jsonc ~/.config/fastfetch/config.jsonc
```

#### WSL Fastfetch (Ubuntu)
```bash
# Create config directory
mkdir -p ~/.config/fastfetch

# Create symbolic link or copy
ln -sf /mnt/c/dotfiles/configs/fastfetch/ubuntu.jsonc ~/.config/fastfetch/config.jsonc
# Or copy
cp /mnt/c/dotfiles/configs/fastfetch/ubuntu.jsonc ~/.config/fastfetch/config.jsonc
```

### 5. Neovim Configuration Setup

#### Windows Neovim
```powershell
# Create nvim config directory
$nvimDir = "$env:USERPROFILE\AppData\Local\nvim"
if (!(Test-Path $nvimDir)) {
    New-Item -ItemType Directory -Path $nvimDir -Force
}

# Copy or link the init file
Copy-Item "C:\dotfiles\configs\neovim\windows-neovim-init.lua" -Destination "$nvimDir\init.lua" -Force
```

#### WSL Neovim
```bash
# Create nvim config directory
mkdir -p ~/.config/nvim

# Create symbolic link or copy
ln -sf /mnt/c/dotfiles/configs/neovim/windows-neovim-init.lua ~/.config/nvim/init.lua
# Or copy
cp /mnt/c/dotfiles/configs/neovim/windows-neovim-init.lua ~/.config/nvim/init.lua
```

### 6. WSL Shell Configuration

#### Arch Linux
```bash
# Backup existing .zshrc if it exists
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.zshrc.backup

# Create symbolic link or copy
ln -sf /mnt/c/dotfiles/configs/wsl/.zshrc ~/.zshrc
# Or copy
cp /mnt/c/dotfiles/configs/wsl/.zshrc ~/.zshrc

# Source the new configuration
source ~/.zshrc
```

#### Ubuntu
```bash
# Same process as Arch
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.zshrc.backup
ln -sf /mnt/c/dotfiles/configs/wsl/.zshrc ~/.zshrc
# Or copy
cp /mnt/c/dotfiles/configs/wsl/.zshrc ~/.zshrc
source ~/.zshrc
```

## 🔄 Automated Setup Script

Create this PowerShell script for quick setup:

```powershell
# setup.ps1
param(
    [string]$DotfilesPath = "C:\dotfiles"
)

Write-Host "🚀 Setting up dotfiles..." -ForegroundColor Green

# PowerShell Profile
$profileDir = Split-Path $PROFILE
if (!(Test-Path $profileDir)) {
    New-Item -ItemType Directory -Path $profileDir -Force
}
New-Item -ItemType SymbolicLink -Path $PROFILE -Target "$DotfilesPath\configs\powershell\Microsoft.PowerShell_profile.ps1" -Force
Write-Host "✅ PowerShell profile linked" -ForegroundColor Green

# Oh My Posh Theme
Copy-Item "$DotfilesPath\configs\oh-my-posh\bluish-v2.omp.json" -Destination "$env:POSH_THEMES_PATH\bluish-v2.omp.json" -Force
Write-Host "✅ Oh My Posh theme copied" -ForegroundColor Green

# Fastfetch
$fastfetchDir = "C:\ProgramData\fastfetch"
if (!(Test-Path $fastfetchDir)) {
    New-Item -ItemType Directory -Path $fastfetchDir -Force
}
Copy-Item "$DotfilesPath\configs\fastfetch\powershell.jsonc" -Destination "$fastfetchDir\powershell.jsonc" -Force
Write-Host "✅ Fastfetch config copied" -ForegroundColor Green

# Neovim
$nvimDir = "$env:USERPROFILE\AppData\Local\nvim"
if (!(Test-Path $nvimDir)) {
    New-Item -ItemType Directory -Path $nvimDir -Force
}
Copy-Item "$DotfilesPath\configs\neovim\windows-neovim-init.lua" -Destination "$nvimDir\init.lua" -Force
Write-Host "✅ Neovim config copied" -ForegroundColor Green

Write-Host "🎉 Setup complete! Restart your terminal to see changes." -ForegroundColor Yellow
```

## ✅ Verification

### Test PowerShell Configuration
```powershell
# Restart PowerShell and check if:
# 1. Fastfetch displays on startup
# 2. Oh My Posh prompt is active
# 3. vim alias works (should open nvim)
# 4. eza aliases work (ls, ll, la, etc.)
# 5. kfz function is available
```

### Test WSL Configuration
```bash
# In WSL, check if:
# 1. fastfetch works
# 2. zsh is your shell
# 3. Neovim opens correctly
# 4. Clipboard integration works in nvim
```

## 🔧 Customization

### Modifying Configurations
1. Edit files in the `configs/` directory
2. Changes will automatically apply if using symbolic links
3. If using copies, re-run the setup script

### Adding New Configurations
1. Add new config files to appropriate `configs/` subdirectories
2. Update this setup guide
3. Update the main README

## 🚨 Troubleshooting

### Common Issues

#### 1. Symbolic Link Creation Failed
```powershell
# Run PowerShell as Administrator
# Or use copy method instead
```

#### 2. Oh My Posh Theme Not Loading
- Ensure Oh My Posh is installed
- Check the theme path in your PowerShell profile
- Verify the theme file exists

#### 3. Fastfetch Not Running
- Check if fastfetch is in your PATH
- Verify config file location
- Ensure PowerShell profile is loading

#### 4. WSL Configurations Not Working
- Check if files are accessible from WSL
- Verify symbolic links work between Windows and WSL
- Use copy method if symbolic links fail

## 📋 Setup Checklist

- [ ] Repository cloned
- [ ] PowerShell profile configured
- [ ] Oh My Posh theme installed
- [ ] Fastfetch configurations applied
- [ ] Neovim configuration set up
- [ ] WSL shell configurations applied
- [ ] All configurations tested and working

## 🎯 Next Steps

- Customize configurations to your preferences
- Add additional tools and configurations
- Set up backup and sync strategy
- Share your improvements back to the repository 