abbralias npmi "npm install"

abbralias ne "nodenv each -v"
abbralias npmle "nodenv each -v npm list -g --depth=0"

alias rrepl "env NODE_REPL_MODE=strict NODE_OPTIONS=\"--experimental-repl-await\" npx rrepl"

set -l bun_install "$HOME/.bun"
if test -d "$bun_install"
    set -gx BUN_INSTALL $bun_install
    set -gx PATH "$BUN_INSTALL/bin" $PATH
end

set -l deno_install "$HOME/.deno"
if test -d "$deno_install"
    set -gx DENO_INSTALL $deno_install
    set -gx PATH "$DENO_INSTALL/bin" $PATH
end
