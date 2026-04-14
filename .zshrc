# ==============================================================================
# 1. ENVIRONMENT & PATHS
# ==============================================================================
# Oh My Zsh Path
export ZSH="$HOME/.oh-my-zsh"

# System Paths
export PATH="$HOME/.local/bin:$PATH"
export CUDA_PATH="/opt/cuda"
export PATH="$PATH:$CUDA_PATH/bin"

# Load Cargo / Rust environment
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# API & Model Configs
export OPENCLAW_API_URL="http://localhost:11434"
export OPENCLAW_MODEL="gemma:latest"
export OPENCLAW_AUTH_TOKEN="ollama"


# ==============================================================================
# 2. OH-MY-ZSH CONFIGURATION
# ==============================================================================

# For the prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{red}%b%f'
setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f ${vcs_info_msg_0_}
> '

plugins=(git)

# Initialize Oh My Zsh
source $ZSH/oh-my-zsh.sh


# ==============================================================================
# 3. ALIASES
# ==============================================================================
# Quality of Life
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Dotfile Management
alias desktopconfig='/usr/bin/git --git-dir=$HOME/.dotfiles-desktop/ --work-tree=$HOME'

# Note-taking (Obsidian & Git Sync)
alias neonotes='NVIM_APPNAME=nvim-obsidian nvim'
alias notesync='cd ~/Documents/Vaults/OS-Notes/ && git add . && git commit -m "update $(date)" && git push'

# University of Texas Remote Access
alias utsshfs='sshfs alexw24@sapphire.cs.utexas.edu: ~/remote-sshfs/ -o cache=yes -o kernel_cache -o compression=yes -o auto_cache -o reconnect'
alias utssh='kitten ssh alexw24@sapphire.cs.utexas.edu'
alias utumount='fusermount3 -u ~/remote-sshfs/'


# ==============================================================================
# 4. PLUGINS & EXTERNAL SCRIPTS
# ==============================================================================
# ZSH Autosuggestions (from official repo)
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# OpenClaw Completion
[ -f "$HOME/.openclaw/completions/openclaw.zsh" ] && source "$HOME/.openclaw/completions/openclaw.zsh"


# ==============================================================================
# 5. STARTUP
# ==============================================================================
# Only run fastfetch in interactive sessions
[[ $- == *i* ]] && fastfetch
