# ~/.dotfiles
My personal configuration. ZSH, Atom, and more.

## Instructions
Download this repo and symlink everything with the commands below!

```sh
git clone https://github.com/tough-griff/dotfiles.git "${DOTDIR:="$HOME/dotfiles"}"
${DOTDIR:="$HOME/dotfiles"}/install.sh
```

`git update-index --assume-unchanged git/.gitconfig.personal` to ignore all
future changes to your personal git config.
