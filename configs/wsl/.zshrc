# Path to your oh-my-zsh installation (uncomment and set if using oh-my-zsh)
# export ZSH="$HOME/.oh-my-zsh"

# Set Zsh theme (choose one, or use Oh My Posh if desired)
# export ZSH_THEME="agnosterzak"   # or antares, comfyline, etc.

# Add your PATH here if oh-my-posh is not in a location already in your PATH
# Example: If oh-my-posh is installed to /usr/local/bin or ~/.local/bin, add it like so:
export PATH="$HOME/.local/bin:$PATH"

# Oh My Posh prompt initialization with your custom theme
eval "$(oh-my-posh init zsh --config ~/.poshthemes/bluish-v2.omp.json)"

# Run fastfetch with specific config at shell startup
fastfetch --config hypr

# Enable plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Source Oh My Zsh if installed (uncomment if using)
# source $ZSH/oh-my-zsh.sh

# zsh-autosuggestions plugin
if [ -f ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# zsh-syntax-highlighting plugin
if [ -f ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# PyEnv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Aliases
alias vim='nvim'
alias ls='lsd'

# Add your custom aliases and exports below
alias ll='ls -la'
alias cls='clear'

# TheFuck
eval $(thefuck --alias)
#Fuzzyfinder
source <(fzf --zsh)

kfz() {
  local pid
  pid=$(ps -eo pid,user,comm,args --sort=-%mem | fzf --reverse --multi --preview 'ps -p $(awk "{print \$1}" <<< {}) -o pid,ppid,%cpu,%mem,etime,cmd' | awk '{print $1}')
  [[ -n "$pid" ]] && kill -9 $pid
}


