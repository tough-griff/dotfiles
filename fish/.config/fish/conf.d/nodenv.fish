command -sq nodenv || exit

command -sq brew && set -gx NODENV_ROOT "$BREW_PREFIX/var/nodenv"

command mkdir -p "$NODENV_ROOT/shims"
command mkdir -p "$NODENV_ROOT/versions"

status is-interactive && source (nodenv init - | psub)
