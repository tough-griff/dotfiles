set -gx RUSTUP_HOME "$BREW_PREFIX/var/rustup"
set -gx CARGO_HOME "$RUSTUP_HOME"

if test ! -f "$CARGO_HOME/bin/rustup"
    echo "rustup: command not found. See https://rustup.rs"
    exit
end

set -gx PATH "$CARGO_HOME/bin" $PATH

if test ! -f "$HOME/.config/fish/completions/rustup.fish"
    rustup completions fish >"$HOME/.config/fish/completions/rustup.fish"
end
