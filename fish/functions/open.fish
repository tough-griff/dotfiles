function open -d "Open files and directories with macOS defaults" -w open
    test -n "$argv[-1]" || set -a argv "."
    command open $argv
end
