set --query RUSTUP_HOME || set -gx RUSTUP_HOME "$HOME/.rustup"
set --query CARGO_HOME || set -gx CARGO_HOME "$HOME/.cargo"
set -gx PATH "$CARGO_HOME/bin" $PATH

if ! command -s rustup >/dev/null
    echo "rustup: command not found. See https://rustup.rs"
    exit 1
end

if test ! -f "$HOME/.config/fish/completions/rustup.fish"
    rustup completions fish >"$HOME/.config/fish/completions/rustup.fish"
end
