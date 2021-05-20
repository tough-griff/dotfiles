command -sq nodenv || exit

status is-interactive && source (nodenv init - | psub)
