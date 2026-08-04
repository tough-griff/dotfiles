command -sq npm || exit

abbralias npmi "npm install"
abbralias npml "npm ls"

alias rrepl "env NODE_REPL_MODE=strict npx rrepl"

for v in (seq 6 10)
    alias "npm$v" "corepack npm@$v"
end
