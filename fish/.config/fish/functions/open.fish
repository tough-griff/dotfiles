function open -w open -d "Open files and directories with macOS defaults"
    test -n "$argv[-1]" || set -a argv "."
    command open $argv
end
