set -l rustup_home ''
if test -z "$RUSTUP_HOME"
    set rustup_home "$HOME/.rustup"
    set -x RUSTUP_HOME "$HOME/.rustup"
else
    set rustup_home "$RUSTUP_HOME"
end

set -l cargo_home ''
if test -z "$CARGO_HOME"
    set cargo_home "$HOME/.cargo"
    set -x CARGO_HOME "$HOME/.cargo"
else
    set cargo_home "$CARGO_HOME"
end

set -x PATH $cargo_home/bin $PATH
