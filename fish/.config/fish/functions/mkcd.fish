function mkcd -d "mkdir and cd into new directory" -a dir
    command mkdir -p "$dir" && cd "$dir"
end

