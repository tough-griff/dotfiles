function abbralias -d "Add an alias when we abbreviate so that commonly used abbreviations continue to work in `eval` statements" -a name cmd
    abbr --add "$name" "$cmd" && alias "$name" "$cmd"
end
