#!/bin/sh

# bootstrapper.sh
# Sets up some initial requirements for the larger install.sh script
if test ! $(which brew); then
  echo "Installing Homebrew."
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
else
  echo "Homebrew is already installed."
fi

# Install zsh
brew install git zsh

# if [ ! -d "$HOME/.dotfiles" ]; then
  # echo "Cloning dotfiles."
  # git clone --recursive https://github.com/tough-griff/dotfiles.git "$HOME/.dotfiles"
# else
  # echo "Dotfiles repo alread exists."
# fi
