if ! command -s nodenv >/dev/null
    echo "nodenv: command not found. See https://github.com/nodenv/nodenv"
    exit 1
end

set --query NODENV_ROOT || set -gx NODENV_ROOT "$HOME/.nodenv"
command mkdir -p "$NODENV_ROOT/{shims,versions}"

status --is-interactive && source (nodenv init - | psub)
