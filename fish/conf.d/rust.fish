set -q RUSTUP_HOME || set -gx RUSTUP_HOME "$HOME/.rustup"
set -q CARGO_HOME || set -gx CARGO_HOME "$HOME/.cargo"
set -gx PATH "$CARGO_HOME/bin" $PATH

if not command -q rustup
    echo "rustup: command not found. See https://rustup.rs"
    exit
end

if test ! -f "$HOME/.config/fish/completions/rustup.fish"
    rustup completions fish >"$HOME/.config/fish/completions/rustup.fish"
end
