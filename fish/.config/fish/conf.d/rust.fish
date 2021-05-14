if command -sq brew
    set -gx RUSTUP_HOME "$BREW_PREFIX/var/rustup"
    set -gx CARGO_HOME "$RUSTUP_HOME"
else
    set -gx CARGO_HOME "$HOME/.cargo"
end

test -f "$CARGO_HOME/bin/rustup" || exit

contains -- "$CARGO_HOME/bin" $PATH || set -gx PATH "$CARGO_HOME/bin" $PATH

if test ! -f "$HOME/.config/fish/completions/rustup.fish"
    rustup completions fish >"$HOME/.config/fish/completions/rustup.fish"
end
