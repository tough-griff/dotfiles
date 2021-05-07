# Miscellaneous
alias 1p 'op'
abbralias c 'clear'
abbralias cat 'bat'
abbralias df 'df -kh'
abbralias du 'du -khd1'
abbralias e 'edit'
abbralias ea 'edit --add'
abbralias ip 'ipv4'
abbralias o 'open'
abbralias tree 'tree -h -C --dirsfirst'
abbralias psa 'ps aux'
alias path 'echo "" $PATH\n'
abbralias where 'type -a'

test -e "$HOME/.iterm2_shell_integration.fish" && source "$HOME/.iterm2_shell_integration.fish"
