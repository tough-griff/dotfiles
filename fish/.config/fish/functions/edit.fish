function edit -w code -d "Open a directory in VS Code"
    test -n "$argv[-1]" || set -a argv "."
    code $argv
end
