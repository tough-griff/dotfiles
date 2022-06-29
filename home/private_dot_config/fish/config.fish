# This file contains configs that don't warrant their own entry in conf.d
set -gx LESS "-F -g -i -M -R -S -w -X -z-4"
set -gx FORCE_COLOR 1
set -gx SSH_AUTH_SOCK "$HOME/.1password/agent.sock"

set -gx PATH "$HOME/bin" $PATH

abbralias c clear
abbralias df "df -kh"
abbralias du "du -khd1"
abbralias e edit
abbralias ea "edit --add"
abbralias edf "cd $DOTDIR && edit ."
abbralias ip ipv4
abbralias o open
abbralias tree "tree -aC --dirsfirst"
abbralias psa "ps aux"
abbralias where "type -a"

# clean up $PATH
set -l CLEAN_PATH
for entry in $PATH
    if not contains -- $entry $CLEAN_PATH
        set CLEAN_PATH $CLEAN_PATH $entry
    end
end
set PATH $CLEAN_PATH

# Do this last.
if command -sq starship
    starship init fish | source
end
