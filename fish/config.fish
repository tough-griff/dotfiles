# This file contains configs that don't warrant their own entry in conf.d

set -gx BAT_THEME "TwoDark"
set -gx LESS "-F -g -i -M -R -S -w -X -z-4"

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
abbralias where 'type -a'

# ...do this last
test -e "$HOME/.iterm2_shell_integration.fish" && source "$HOME/.iterm2_shell_integration.fish"
