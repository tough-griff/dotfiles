function abbralias -a name cmd -d "Add an alias when we abbreviate so that commonly used abbreviations continue to work in `eval` statements"
    abbr -a -- $name $cmd && alias $name $cmd
end
