#!/bin/zsh

if [ "$TG_DOTFILES_FLAG" == "TRUE" ]; then
  echo "Already installed."
else
  echo "Installing Tough Griff dotfiles"
  cd $HOME

  # Zsh/Prezto installation
  echo "Installing Prezto and other Zsh configurations"
  ln -sv .dotfiles/zsh/prezto .zprezto

  setopt EXTENDED_GLOB
  for rcfile in .zprezto/runcoms/^README.md(.N); do
    ln -sv "$rcfile" ".${rcfile:t}"
  done

  # Vim
  echo "Installing Vim configurations"
  ln -sv .dotfiles/vim .vim
  ln -sv .dotfiles/vim/vimrc .vimrc

  # Git
  echo "Installing Git dotfiles"
  ln -sv .dotfiles/git/gitconfig .gitconfig
  ln -sv .dotfiles/git/gitconfig.user .gitconfig.user
  ln -sv .dotfiles/git/gitignore .gitignore

  # Ruby
  echo "Installing Ruby dotfiles"
  ln -sv .dotfiles/ruby/aprc .aprc
  ln -sv .dotfiles/ruby/gemrc .gemrc
  ln -sv .dotfiles/ruby/pryrc .pryrc

  # .config
  echo "Installing base16-shell config files"
  mkdir -v .config
  cd .config
  ln -sv ../.dotfiles/config/base16-shell

  # .hushlogin
  echo "Hushing login spam"
  cd $HOME
  ln -sv .dotfiles/hushlogin .hushlogin
fi
