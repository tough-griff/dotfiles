function manp -w man -d "Open a specified man page in Preview"
    if test -z "$argv"
        echo "What manual page do you want?" && return
    end

    man -t "$argv" | open -f -a Preview
end