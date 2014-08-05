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
echo "NOTE: /usr/local/bin/zsh must be added to /etc/shells"

echo "\nPlease configure git and run the following command:\n"
echo '`git clone --recursive https://github.com/tough-griff/dotfiles.git "$HOME/.dotfiles"`\n'
