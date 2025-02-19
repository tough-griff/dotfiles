command -sq fnm || exit

fnm env --use-on-cd --version-file-strategy=recursive --shell fish | source
