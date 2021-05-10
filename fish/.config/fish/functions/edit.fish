function edit -d "Open a directory in VS Code" -w code
    test -n "$argv[-1]" || set -a argv "."
    code $argv
end
