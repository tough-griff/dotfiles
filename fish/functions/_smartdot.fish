function _smartdot -d 'Autocompletes "..." to "../.."'
    set -l token (commandline -t)
    set -l quoted (string match -r "[\'\"]" -- "$token" ^/dev/null; or echo "")
    set -l chars (string sub --start -3 -- "$token" ^/dev/null; or echo "")

    # If token contains a quoted string, we don't replace...
    # ...if the token is simply '..', replace...
    # ...otherwise, if the token ends with /.., replace
    if test -z "$quoted" -a \( "$token" = ".." -o "$chars" = "/.." \)
        commandline -i -- "/.."
    else
        commandline -i -- "."
    end
end
