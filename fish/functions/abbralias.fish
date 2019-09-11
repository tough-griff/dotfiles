function abbralias --description "Add an alias when we abbreviate so that commonly used abbreviations continue to work in `eval` statements"
    abbr --add "$argv[1]" "$argv[2]"
    and alias "$argv[1]" "$argv[2]"
end
