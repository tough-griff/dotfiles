function fish_title -a last_command
    set -l current_command (status current-command 2>/dev/null; or echo $_)
    set -l directory (string replace "$HOME" "~" (pwd))

    set title "$current_command — $directory"
    if test -n "$last_command"
        set title "$title ($last_command)"
    end

    echo "$title"
end
