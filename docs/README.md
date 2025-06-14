# 🔧 Configuration Details

Detailed documentation for each configuration file in this dotfiles collection.

## 📁 configs/powershell/

### Microsoft.PowerShell_profile.ps1

Your PowerShell profile that enhances the terminal experience with:

#### Features:
- **🧠 Neovim Integration**
  - Removes default `vim` alias
  - Sets `vim` → `nvim` for consistent editing experience

- **🚀 Fastfetch Display**
  - Automatically runs fastfetch on startup if available
  - Uses custom PowerShell configuration (`powershell.jsonc`)

- **🎨 Oh My Posh Prompt**
  - Loads custom theme `amro.omp.json` (now `bluish-v2.omp.json`)
  - Beautiful powerline-style prompt with git integration

- **🧰 eza Aliases (Unix-like)**
  - `ls` → `eza` (modern ls replacement)
  - `l` → `eza -l` (long format)
  - `ll` → `eza -lah` (long format with hidden files)
  - `la` → `eza -a` (show all files)
  - `lt` → `eza --tree` (tree view)
  - `ltr` → `eza -lT --sort=modified` (tree sorted by modification time)
  - `tree` → `eza --tree` (tree view)
  - `lg` → `eza -al --git` (with git status)
  - `ltg` → `eza -al --git --tree` (tree with git status)

- **⚡ kfz Function**
  - Interactive process killer using fzf
  - Shows processes sorted by memory usage
  - Multi-select capability
  - Preview window with detailed process information

#### Usage Examples:
```powershell
# List files with colors and icons
ls

# Long listing with git status
lg

# Interactive process killer
kfz

# Tree view of directory
lt
```

## 📁 configs/fastfetch/

### powershell.jsonc
Fastfetch configuration for Windows PowerShell environment.

#### Features:
- **Windows Logo** - Custom 8-line height Windows logo
- **Custom Title** - `HachiroSan@windows`
- **Colorful Dividers** - Rainbow emoji separators
- **System Information Modules:**
  - OS information with triangle icon (▲)
  - Kernel with water drop icon (💧)
  - Packages with devil emoji (😈) - shows winget packages
  - Shell with arrow (❯)
  - Terminal with laptop icon (💻)
  - Window Manager with desktop icon (🖥️)
  - Uptime with stopwatch (⏱️)
  - Date/Time with calendar (📅)

### arch.jsonc
Fastfetch configuration for Arch Linux WSL.

#### Features:
- Arch Linux specific branding
- Package information for pacman
- System information relevant to Arch environment

### ubuntu.jsonc
Fastfetch configuration for Ubuntu WSL.

#### Features:
- Ubuntu specific branding
- Package information for apt
- System information relevant to Ubuntu environment

## 📁 configs/oh-my-posh/

### bluish-v2.omp.json
A modern, bluish-themed Oh My Posh configuration.

#### Features:
- **Transient Prompt** - Clean single-line prompt after command execution
- **Multi-segment Powerline** - Professional segmented appearance
- **Dynamic Segments:**
  - **OS Icon** - Shows current operating system
  - **User@Host** - Session information with cyan accent
  - **Battery** - Color-coded battery status (charging/discharging/full)
  - **Path** - Current directory with folder icon
  - **Git Status** - Branch, upstream status, and stash count
  - **Python Environment** - Active virtual environment
  - **Node.js** - Node version and package manager
  - **Root Indicator** - Warning when running as administrator
  - **Kubernetes** - Context and namespace information
  - **Exit Status** - Shows error status when commands fail

#### Color Scheme:
- Primary: Cyan (`#26C6DA`)
- Secondary: Blue-gray (`#546E7A`)
- Accent: Light blue (`#a2beef`, `#14c2dd`, `#a2c4e0`)
- Warning: Yellow (`#FFD700`, `#ffff66`)
- Error: Red (`#f1184c`)

## 📁 configs/neovim/

### windows-neovim-init.lua
Neovim configuration for Windows with WSL clipboard integration.

#### Features:
- **WSL Clipboard Integration**
  - Uses `win32yank.exe` for seamless clipboard sharing
  - Copy operations: `win32yank.exe -i --crlf`
  - Paste operations: `win32yank.exe -o --lf`
  - Handles both `+` and `*` registers
  - Cache disabled for real-time sync

#### Requirements:
- `win32yank.exe` must be installed and accessible from WSL
- Works with both Windows and WSL Neovim instances

## 📁 configs/wsl/

### .zshrc
Zsh configuration for WSL environments (Arch Linux & Ubuntu).

#### Features:
Based on your existing zsh configuration with enhancements for WSL environments.

## 🎯 Customization Guide

### Modifying Colors
To change the Oh My Posh theme colors:
1. Edit `configs/oh-my-posh/bluish-v2.omp.json`
2. Modify the `foreground` and `background` properties
3. Reload your PowerShell profile

### Adding New Aliases
To add PowerShell aliases:
1. Edit `configs/powershell/Microsoft.PowerShell_profile.ps1`
2. Add your alias after the existing ones:
```powershell
Set-Alias myalias mycommand
```

### Customizing Fastfetch
To modify system information display:
1. Edit the appropriate `configs/fastfetch/*.jsonc` file
2. Add/remove modules in the `modules` array
3. Customize icons and formatting

### Adding New Functions
Add PowerShell functions to your profile:
```powershell
function MyFunction {
    param([string]$Parameter)
    # Your code here
}
```

## 🔄 Environment Variables

The configurations reference these environment variables:
- `$env:POSH_THEMES_PATH` - Oh My Posh themes directory
- `$PROFILE` - PowerShell profile path
- `$env:USERPROFILE` - User home directory

## 🚨 Dependencies

### Required Tools:
- **PowerShell 7+** - For profile functionality
- **Oh My Posh** - For prompt theming
- **Fastfetch** - For system information
- **eza** - For enhanced file listings
- **fzf** - For fuzzy finding in kfz function
- **Neovim** - For vim alias
- **win32yank** - For clipboard integration

### Optional Enhancements:
- **Nerd Font** - For proper icon display
- **Windows Terminal** - For best experience
- **Git** - For version control features

## 🎨 Screenshots and Examples

### PowerShell with Full Configuration:
```
🔴🟠🟡🟢🔵🟣⚪⚫

HachiroSan@windows

▲ Windows 11
💧 Windows NT
😈 150 (winget)
❯ PowerShell 7.3.0
💻 Windows Terminal
🖥️ Desktop Window Manager
⏱️ 2 hours, 30 minutes
📅 2024-01-15 14:30:45

🔴🟠🟡🟢🔵🟣⚪⚫

  HachiroSan@windows  📁 ~/Projects  main ↑  🔴 
➜
```

### Enhanced Directory Listings:
```powershell
PS> ll
drwxr-xr-x   - hachiro 15 Jan 14:30  .git
.rw-r--r-- 1.2k hachiro 15 Jan 14:25  README.md
.rw-r--r-- 2.0k hachiro 15 Jan 14:20  Microsoft.PowerShell_profile.ps1
```

This documentation provides comprehensive details about each configuration file and how to customize them for your specific needs. 