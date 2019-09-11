# Miscellaneous
abbralias cat 'bat'
abbralias df 'df -kh'
abbralias du 'du -khd1'
abbralias e 'edit'
abbralias ea 'edit --add'
abbralias tree 'tree -h -C --dirsfirst'
abbralias psa 'ps aux'
alias path 'echo "" $PATH\n'
abbralias where 'type -a'

eval (ssh-agent -c) >/dev/null

# Do this last...
eval (starship init fish)
