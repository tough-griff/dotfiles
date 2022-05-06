function fish_title
    echo "$(/usr/bin/uname -m) - $(status current-command) - $(pwd) - $(tty)"
end
