command -v eza >/dev/null 2>&1 || return

alias ls='eza -F --group-directories-first'
alias ll='ls -l'
alias la='ls -al'
alias lt='ls -al --tree'
