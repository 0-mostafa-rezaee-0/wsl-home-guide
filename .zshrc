#=== Path =========================================================================================
# This ensures WSL will look for executables like your cursor symlink in that folder.

export PATH="$HOME/.local/bin:$PATH"


#=== zsh ==========================================================================================

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load 
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

source "/opt/intel/oneapi/compiler/2023.1.0/env/vars.sh" intel64

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#=== alias ========================================================================================

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

##--- SaveBirds aliases ---------------------------------------------------------------------------
alias backend_SaveBirds="cd ~/SaveBirds.app/backend && source .venv/bin/activate && uvicorn main:app --reload"
alias frontend_SaveBirds="cd ~/SaveBirds.app/frontend && yarn serve"

##--- Git aliases ---------------------------------------------------------------------------------
alias gs="git status"
alias ga="git add"
alias ga.="git add ."
alias gc="git commit -m"
alias gpl="git pull"
alias gps="git push"

##--- Docker aliases ------------------------------------------------------------------------------

### --- Image Management ---
alias di="    docker images    --format 'table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}\t{{.CreatedSince}}'"
alias dia="   docker images -a --format 'table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}\t{{.CreatedSince}}'"
alias drmi="  docker rmi"

drmia() {     docker rmi $(docker images -aq)       }  # Remove All Images
drmif() {                                              # Remove All dangling images
 local images=$(docker images -q -f dangling=true)
 if [ -n "$images" ]; then
   echo "Removing dangling images: $images"
   docker rmi $images
 else
   echo "No dangling images to remove."
 fi
}

### --- Container Management ---
alias dps="   docker ps     --format 'table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}'"
alias dpsa="  docker ps -a  --format 'table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}'"
alias dpsaq=" docker ps -aq --format 'table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}'"

alias dst="   docker start"
alias dsp="   docker stop"
alias drm="   docker rm"

dsta() {      docker start $(docker ps -aq)   }  # Start  All Containers
dspa() {      docker stop  $(docker ps -aq)   }  # Stop   All Containers
drma() {      docker rm    $(docker ps -aq)   }  # Remove All Containers

### --- Docker Compose Commands ---
alias dcu="   docker compose up   -d --build"
alias dcd="   docker compose down"

### --- Docker Exec Bash ---
deb() {       docker exec -it "$1" bash   }

##--- cdw "your-windows-path" ---------------------------------------------------------------------
# To get to a windows path
# cdw "your-windows-path"
# Example: cw "C:\Users" 
# Note: cw "C:\" dose not work. simply use cd /mnt/c or cw "C:\\"
cdw() {   cd "$(wslpath "$1")"   }

#=== Disable terminal bell sounds =================================================================
# Disable terminal bell sounds
unsetopt beep

#=== Node version manager and display settings ====================================================
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# DISPLAY configuration for WSL
export DISPLAY=$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}'):0.0
