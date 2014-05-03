# dotfiles
My personal dotfiles and install scripts.

## installation
First, run the following bootstrap script:

```
sh -c "`curl -fsSL https://raw.githubusercontent.com/tough-griff/dotfiles/master/bootstrapper.sh`"
```

Then, once `git` and `zsh` are installed, clone the repository with:

```
git clone --recursive https://github.com/tough-griff/dotfiles.git "$HOME/.dotfiles"
```

Finally, run the install script:

```
cd $HOME/.dotfiles
./install.sh
```
