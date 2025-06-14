# -----------------------------
# 🧠 Neovim alias
# -----------------------------
if (Get-Alias vim -ErrorAction SilentlyContinue) {
    Remove-Item alias:vim -Force
}
Set-Alias vim nvim

# -----------------------------
# 🚀 Fastfetch config
# -----------------------------
if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
    fastfetch --config "C:\ProgramData\fastfetch\powershell.jsonc"
}

# -----------------------------
# 🎨 Oh My Posh
# -----------------------------
if (Test-Path "$env:POSH_THEMES_PATH\amro.omp.json") {
    oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\amro.omp.json" | Invoke-Expression
}

# -----------------------------
# 🧰 eza aliases (Unix-like)
# -----------------------------
foreach ($alias in @("ls", "l", "ll", "la", "lt", "ltr", "tree")) {
    if (Get-Alias $alias -ErrorAction SilentlyContinue) {
        Remove-Item "alias:$alias" -Force
    }
}

Set-Alias ls eza

function l { eza -l }
function ll { eza -lah }
function la { eza -a }
function lt { eza --tree }
function ltr { eza -lT --sort=modified }
function tree { eza --tree }

function lg { eza -al --git }
function ltg { eza -al --git --tree }

# -----------------------------
# ⚡ kfz: fzf-powered process killer
# -----------------------------
function kfz {
    $procList = Get-Process | Sort-Object -Property WS -Descending | 
        Select-Object Id, ProcessName, @{Name='Mem(MB)';Expression={[math]::Round($_.WS/1MB,2)}}

    $fzfInput = $procList | ForEach-Object {
        "{0} {1} {2}MB" -f $_.Id, $_.ProcessName, $_.'Mem(MB)'
    }

    $selected = $fzfInput | fzf --multi --reverse --preview "Get-Process -Id {1} | Format-List *" --preview-window=up:5:wrap

    if (-not $selected) { return }

    $pids = $selected | ForEach-Object { ($_ -split ' ')[0] }

    foreach ($processId in $pids) {
        try {
            Stop-Process -Id $processId -Force -ErrorAction Stop
            Write-Host "Killed process ID $processId"
        } catch {
            Write-Warning ("Failed to kill process ID " + $processId + ": " + $_)
        }
    }
}
