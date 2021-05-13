function manp -w man -d "Open a specified man page in Preview"
    if test -e "$argv"
        echo "What manual page do you want?" && exit
    end

    man -t $argv | open -f -a Preview
end
