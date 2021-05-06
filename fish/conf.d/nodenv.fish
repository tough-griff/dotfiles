if not command -q nodenv
    echo "nodenv: command not found. See https://github.com/nodenv/nodenv"
    exit
end

set -q NODENV_ROOT || set -gx NODENV_ROOT "$HOME/.nodenv"
command mkdir -p "$NODENV_ROOT/shims"
command mkdir -p "$NODENV_ROOT/versions"

status is-interactive && source (nodenv init - | psub)
