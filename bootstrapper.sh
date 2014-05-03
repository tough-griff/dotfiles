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
brew install zsh
