if command -sq fnm
    fnm env --use-on-cd --version-file-strategy=recursive --shell fish | source
end

if command -sq npm
    abbralias npmi "npm install"
    abbralias npml "npm ls"

    alias rrepl "env NODE_REPL_MODE=strict npx rrepl"

    for v in (seq 6 10)
        alias "npm$v" "corepack npm@$v"
    end
end

if command -sq bun
    fish_add_path -gP "$(bun pm bin --global 2>/dev/null)"
end
