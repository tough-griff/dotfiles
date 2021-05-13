function each -w eval -d "Evaluate a command in each subdirectory"
    for dir in *
        if test -d "$dir"
            set_color -o blue
            echo "$dir:"
            set_color normal
            cd "$dir" || break
            eval "$argv"
            echo
            cd ..
        end
    end
end
