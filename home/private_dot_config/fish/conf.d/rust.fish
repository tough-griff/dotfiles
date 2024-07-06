set -gx RUSTUP_HOME "$HOME/.rustup"
set -gx CARGO_HOME "$HOME/.cargo"

test -x "$CARGO_HOME/bin/rustup" || exit

fish_add_path -gP "$CARGO_HOME/bin"
