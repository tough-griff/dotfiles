# This file contains configs that don't warrant their own entry in conf.d

set -gx BAT_THEME TwoDark
set -gx LESS "-F -g -i -M -R -S -w -X -z-4"

alias 1p op
abbralias c clear
abbralias df "df -kh"
abbralias du "du -khd1"
abbralias e edit
abbralias ea "edit --add"
abbralias edf "cd $DOTDIR && edit ."
abbralias ip ipv4
alias ls "ls -Fv --color=auto --group-directories-first"
abbralias o open
alias tree "tree -aC --dirsfirst -I '.git|node_modules'"
abbralias psa "ps aux"
abbralias where "type -a"

starship init fish | source
