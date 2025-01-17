#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# --- aliases --- #
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias c='clear'
alias ~='cd ~ && c'
alias l='ls -A --color=auto'
alias rl='c && bash'
alias f='find . | fzf'
alias pq='pacman -Q | fzf'
alias public-ip='curl ifconfig.co/ip'

alias upd='sudo pacman -Sy'
alias update='sudo pacman -Syu && yay -Syu'

alias templ='( [ -e main.cpp ] || { cp ~/.config/nvim/templates/template.cpp main.cpp && vi main.cpp; } )'

alias clone='. git-clone'
alias cred='git-cred'
alias sy='git-sync'
alias syrep='sync-repos'

alias vi='nvim'
alias vim='nvim'

# --------------- #

# --- prompt --- #
# PS1='[\u@\h \W]\$ '
# https://bash-prompt-generator.org/
PROMPT_COMMAND='PS1_CMD1=$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2)'; PS1='\[\e[38;5;39m\]\W\[\e[38;5;44;1m\] λ \[\e[0;38;5;49m\]${PS1_CMD1}\n\[\e[95;1m\]❱ \[\e[0m\]\[\e[38;5;254m\]'
# -------------- #
# --- launch logic --- #

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
export PATH=$PATH:~/.bash/
export PATH=$PATH:/home/akos/.cargo/bin
export EDITOR=nvim
export PICO_SDK_PATH=~/.pico-sdk

bind -s 'set completion-ignore-case on '
autosync-repos >/dev/null 2>&1 &
disown
# -------------------- #
