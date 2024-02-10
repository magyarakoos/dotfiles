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

alias upd='sudo pacman -Sy'
alias update='sudo pacman -Syu && yay -Syu'

alias cppmain='[ -e main.cpp ] || { cp ~/.config/Code/User/snippets/template.cpp main.cpp && code main.cpp }'
alias cppcomp='g++ -o main -std=c++20 -Wall -Wextra -Werror -fsanitize=undefined -O3 -DLOCAL main.cpp'
alias cpprun='cppcomp && ./main && rm ./main'

alias clone='. git-clone.sh'
alias cred='git-cred.sh'
alias sy='git-sync.sh'
alias syrep='sync-repos.sh'
# --------------- #

# --- prompt --- #
# PS1='[\u@\h \W]\$ '
# https://bash-prompt-generator.org/
PROMPT_COMMAND='PS1_CMD1=$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2)'; PS1='\[\e[38;5;39m\]\W\[\e[38;5;44;1m\] λ \[\e[0;38;5;49m\]${PS1_CMD1}\n\[\e[95;1m\]❱ \[\e[0m\]\[\e[38;5;254m\]'
# -------------- #

# --- launch logic --- #
export PATH=$PATH:~/.bash
bind -s 'set completion-ignore-case on '
autosync-repos.sh >/dev/null 2>&1 &
disown
# -------------------- #
