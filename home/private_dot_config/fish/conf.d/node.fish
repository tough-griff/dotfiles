abbralias npmi "npm install"
abbralias npml "npm ls"

alias rrepl "env NODE_REPL_MODE=strict npx rrepl"

for v in (seq 6 10)
    alias "npm$v" "corepack npm@$v"
end

set -l bun_install "$HOME/.bun"
if test -d "$bun_install"
    set -gx BUN_INSTALL $bun_install
    fish_add_path -gP "$BUN_INSTALL/bin"
end

set -l deno_install "$HOME/.deno"
if test -d "$deno_install"
    set -gx DENO_INSTALL $deno_install
    fish_add_path -gP "$DENO_INSTALL/bin"
end
