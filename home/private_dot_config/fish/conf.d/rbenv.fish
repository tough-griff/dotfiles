command -sq rbenv || exit

status is-interactive && rbenv init - fish | source
