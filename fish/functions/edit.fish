function edit -d "Open a directory in \$VISUAL"
    set --query argv[-1] || set -a argv '.'
    $VISUAL $argv
end
