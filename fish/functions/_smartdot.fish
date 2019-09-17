function _smartdot -d 'Autocompletes "..." to "../.."'
    set -l cur (commandline -C)
    set -l token (commandline -t)
    set -l buffer (commandline -b)

    # If token contains a quoted string, we don't replace...
    set -l match (string match -r "[\'\"]" -- "$token" ^/dev/null; or echo "")
    # ...otherwise, if we just typed ..., replace it with ../..
    set -l chars (string sub --start (math "$cur - 1") --length 2 -- "$buffer" ^/dev/null; or echo "")

    if [ -z "$match" -a "$chars" = ".." ]
        commandline -i -- "/.."
    else
        commandline -i -- "."
    end
end
