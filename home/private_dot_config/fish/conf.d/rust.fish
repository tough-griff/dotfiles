set -gx RUSTUP_HOME "$HOME/.rustup"
set -gx CARGO_HOME "$HOME/.cargo"

test -x "$CARGO_HOME/bin/rustup" || exit

set -gx PATH "$CARGO_HOME/bin" $PATH
