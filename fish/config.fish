# Miscellaneous
alias cat bat
alias df 'df -kh'
alias du 'du -khd1'
alias e edit
alias ea 'edit --add'
alias tree 'tree -h -C --dirsfirst'
alias psa 'ps aux'
alias path 'echo "" $PATH\n'
alias where 'type -a'

eval (ssh-agent -c) >/dev/null

test -e $HOME/.iterm2_shell_integration.fish
and source $HOME/.iterm2_shell_integration.fish

eval (starship init fish)
