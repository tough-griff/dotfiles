function each -w eval -d "Evaluate a command in each subdirectory"
    for dir in *
        if test -d "$dir"
            set_color -o blue
            echo "$dir:"
            set_color normal
            pushd "$dir" || break
            eval "$argv"
            echo
            popd
        end
    end
end
