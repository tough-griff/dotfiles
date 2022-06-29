command -sq pyenv || exit

status is-interactive && pyenv init - fish | source
