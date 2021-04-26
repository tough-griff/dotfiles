function edit -d "Open a directory in \$VISUAL"
    test -e "$argv[-1]" || set -a argv "."
    $VISUAL $argv
end
