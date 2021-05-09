function path -d 'Output PATH with each entry on a new line'
    echo $PATH | sed "s/[[:space:]\+:]/\n/g"
end
