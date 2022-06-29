set -gx RUSTUP_HOME "$HOME/.rustup"
set -gx CARGO_HOME "$HOME/.cargo"

test -f "$CARGO_HOME/bin/rustup" || exit

set -gx PATH "$CARGO_HOME/bin" $PATH

if not test -f "$HOME/.config/fish/completions/rustup.fish"
    rustup completions fish >"$HOME/.config/fish/completions/rustup.fish"
end
