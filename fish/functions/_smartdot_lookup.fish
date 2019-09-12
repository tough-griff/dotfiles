function _smartdot_lookup -d "Returns the previous two characters relative to the cursor"
    set cur (commandline -C)
    set input (commandline -b)

    string sub --start (math "$cur - 1") --length 2 -- "$input" ^/dev/null
    or echo ''
end
