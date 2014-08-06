#!/usr/local/bin/zsh

if [[ "$TG_DOTFILES_FLAG" = "TRUE" ]]; then
  echo "Already installed. Aborting."
elif [[ -z $MYDOTDIR ]]; then
  echo "Must set MYDOTDIR prior to installing"
else
  echo "Installing Tough Griff dotfiles from $MYDOTDIR"

  # Zsh/Prezto installation
  echo "Installing Prezto and other Zsh configurations"
  ln -sv $MYDOTDIR/zsh/prezto "${ZDOTDIR:-$HOME}/.zprezto"

  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -sv "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

  chsh -s /usr/local/bin/zsh

  # Git
  echo "Installing Git dotfiles"
  for rcfile in $MYDOTDIR/git/*; do
    ln -sv "$rcfile" "$HOME/.${rcfile:t}"
  done

  # Ruby
  echo "Installing Ruby dotfiles"
  ln -sv $MYDOTDIR/ruby/aprc $HOME/.aprc
  ln -sv $MYDOTDIR/ruby/gemrc $HOME/.gemrc
  ln -sv $MYDOTDIR/ruby/pryrc  $HOME/.pryrc
  ln -sv $MYDOTDIR/ruby/rdebugrc  $HOME/.rdebugrc

  # .atom
  echo "Installing Atom config"
  ln -sv $MYDOTDIR/atom $HOME/.atom

  # .config
  echo "Installing base16-shell config files"
  mkdir -v $HOME/.config
  ln -sv $MYDOTDIR/config/base16-shell $HOME/.config/base16-shell

  # .hushlogin
  echo "Hushing login spam"
  ln -sv $MYDOTDIR/hushlogin $HOME/.hushlogin

  # bin directory
  echo "Installing personal bin directory"
  ln -sv $MYDOTDIR/bin $HOME/bin

  # Install Brewfile and Caskfile apps
  export HOMEBREW_CASK_OPTS="--caskroom=/usr/local/Caskroom"
  brew bundle $MYDOTDIR/Brewfile
  brew bundle $MYDOTDIR/Caskfile
fi
