#=== Minimal bash configuration ===============================================================
# This is a minimal .bashrc file since zsh is the preferred shell
# If you find yourself in bash, consider running 'zsh' to switch to the preferred shell

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#=== Basic settings =======================================================================
# Check window size after each command
shopt -s checkwinsize

# Append to history file, don't overwrite
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

#=== Essential aliases ====================================================================
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'

#=== Path settings ========================================================================
# Add local bin to PATH
PATH="$PATH:$HOME/.local/bin"

#=== Essential environment variables ======================================================
# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" > /dev/null 2>&1
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" > /dev/null 2>&1

# DISPLAY configuration for WSL
export DISPLAY=$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}'):0.0

# Node options
export NODE_OPTIONS="--force-node-api-uncaught-exceptions-policy=true"

#=== Switch to preferred shell =============================================================
# Uncomment the following line to automatically switch to zsh (if installed and not already running zsh)
# if [ -x "$(command -v zsh)" ] && [ "$(ps -p $$ -o comm=)" != "zsh" ]; then
#   exec zsh
# fi
