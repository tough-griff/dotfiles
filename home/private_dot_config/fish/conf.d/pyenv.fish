command -sq pyenv || exit

status is-interactive && source (pyenv init - | psub)
