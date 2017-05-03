# ~/.dotfiles
My personal configuration. ZSH, Atom, and more.

## Instructions
Download this repo and symlink everything with the commands below!

```sh
git clone --recursive https://github.com/tough-griff/dotfiles.git "${DOTDIR:="$HOME/dotfiles"}"
${DOTDIR:="$HOME/dotfiles"}/install.sh
```

## Personal files
Create a `~/.gitconfig.personal` file for saving your `git` username and email
configuration.

`.secrets` is where any secret environment variables can live.
