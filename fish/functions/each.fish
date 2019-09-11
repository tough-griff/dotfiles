function each --description "Evaluate a command in each subdirectory"
    for dir in *
        if test -d "$dir"
            echo "$dir":
            cd "$dir"
            and eval "$argv"
            echo
            cd ..
        end
    end
end

