command -sq rbenv || exit

status is-interactive && source (rbenv init - | psub)
