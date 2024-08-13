zstyle ':z4h:' auto-update      'no'
zstyle ':z4h:bindkey' keyboard  'pc'
zstyle ':z4h:' start-tmux       no
zstyle ':z4h:' term-shell-integration 'yes'
zstyle ':z4h:autosuggestions' forward-char 'accept'
zstyle ':z4h:fzf-complete' recurse-dirs 'no'
zstyle ':z4h:direnv'         enable 'no'
zstyle ':z4h:direnv:success' notify 'yes'

z4h init || return

# ------ PART SUBJECT TO MODIFICATION ------ #

# Define aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~ && c'
alias l='ls -A --color=auto'
alias c='printf "\033[2J\033[3J\033[1;1H"' # clears the scrollback buffer as well as the screen
alias tree='tree -a -I .git'
alias pq='pacman -Q | fzf'

vi() {
  # Try to use sudoedit
  if ! sudoedit "$@"; then
    # If sudoedit fails, use nvim instead
    nvim "$@"
  fi
}

ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=#6c30f5
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=#8e5cff
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=#69ff6b
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=#69ff6b
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]=fg=red
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]=fg=red
ZSH_HIGHLIGHT_STYLES[comment]=fg=#aaaaaa
ZSH_HIGHLIGHT_STYLES[path]=fg=#ab90e8
ZSH_HIGHLIGHT_STYLES[path_pathseparator]=fg=#6c30f5
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold

# Environment variables
export GPG_TTY=$TTY
export PATH=$PATH:~/.bash/
export EDITOR=nvim

# Source local files
z4h source ~/.env.zsh

# Define key bindings
z4h bindkey z4h-backward-kill-word  Ctrl+Backspace     Ctrl+H
z4h bindkey z4h-backward-kill-zword Ctrl+Alt+Backspace

# ------------------- END ------------------ #


# Autoload functions
autoload -Uz zmv

# Define functions and completions
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots

# Use additional Git repositories pulled in with `z4h install`.
# z4h source ohmyzsh/ohmyzsh/lib/diagnostics.zsh  # source an individual file
# z4h load   ohmyzsh/ohmyzsh/plugins/emoji-clock  # load a plugin
