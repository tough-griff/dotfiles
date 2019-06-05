function edit --description "Open a directory in \$VISUAL"
    test -e "$argv[-1]"; or set -a argv '.'
    $VISUAL $argv
end
