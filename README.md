# ~/.dotfiles

My personal configuration. `fish`, `Atom`, and more.

## Instructions

Download this repo and symlink everything with the commands below!

```sh
git clone --recursive https://github.com/tough-griff/dotfiles.git "${DOTDIR:="$HOME/dotfiles"}"
${DOTDIR:="$HOME/dotfiles"}/install.sh
```

## Personal files

Create a `~/.gitconfig.personal` file for saving your `git` username and email
configuration.

## Auto-Updates

See [this gist](https://gist.github.com/tough-griff/3cb387b151bfa1d405135f422f863a0a)
for a `launchctl` script to sync your dotfiles daily.
