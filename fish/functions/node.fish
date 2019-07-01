function node --description "Runs an improved node interpreter when no arguments are provided"
    test -e "$argv[-1]"; or set -a argv "$DOTDIR/js/repl.js"
    command node $argv
end
