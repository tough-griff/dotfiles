function fnm-each -d "Run a command with each installed fnm Node version"
    for v in (fnm list | string match -rg '^\* (v\S+)')
        set_color -o blue
        echo "$v:"
        set_color normal
        fnm exec --using=$v -- $argv
        echo
    end
end
