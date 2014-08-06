#!/usr/local/bin/zsh

if [ "$TG_DOTFILES_FLAG" = "TRUE" ]; then
  echo "Already installed. Aborting."
else
  echo "Installing Tough Griff dotfiles"

  # Zsh/Prezto installation
  echo "Installing Prezto and other Zsh configurations"
  ln -sv $HOME/.dotfiles/zsh/prezto "${ZDOTDIR:-$HOME}/.zprezto"

  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -sv "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

  chsh -s /usr/local/bin/zsh

  # Git
  echo "Installing Git dotfiles"
  for rcfile in $HOME/.dotfiles/git/*; do
    ln -sv "$rcfile" "$HOME/.${rcfile:t}"
  done

  # Ruby
  echo "Installing Ruby dotfiles"
  ln -sv $HOME/.dotfiles/ruby/aprc $HOME/.aprc
  ln -sv $HOME/.dotfiles/ruby/gemrc $HOME/.gemrc
  ln -sv $HOME/.dotfiles/ruby/pryrc  $HOME/.pryrc
  ln -sv $HOME/.dotfiles/ruby/rdebugrc  $HOME/.rdebugrc

  # .config
  echo "Installing base16-shell config files"
  mkdir -v $HOME/.config
  ln -sv $HOME/.dotfiles/config/base16-shell $HOME/.config/base16-shell

  # .hushlogin
  echo "Hushing login spam"
  ln -sv $HOME/.dotfiles/hushlogin $HOME/.hushlogin

  # bin directory
  echo "Installing personal bin directory"
  ln -sv $HOME/.dotfiles/bin $HOME/bin

  # Install Brewfile and Caskfile apps
  export HOMEBREW_CASK_OPTS="--caskroom=/usr/local/Caskroom"
  brew bundle $HOME/.dotfiles/Brewfile
  brew bundle $HOME/.dotfiles/Caskfile
fi
