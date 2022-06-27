#!/bin/bash

find_brew() {
  if [[ $(uname -s) == Darwin ]]; then
    if [[ -x /opt/homebrew/bin/brew ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -x /usr/local/bin/brew ]]; then
      eval "$(/usr/local/bin/brew shellenv)"
    fi
  else
    if [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    elif [[ -x "$HOME/.linuxbrew/bin/brew" ]]; then
      eval "$("$HOME/.linuxbrew/bin/brew" shellenv)"
    fi
  fi

  if [[ -n "$HOMEBREW_PREFIX" && -x "$HOMEBREW_PREFIX/bin/brew" ]]; then
    echo "Using Homebrew at $HOMEBREW_PREFIX"
    return 0
  else
    echo "Unable to locate Homebrew"
    return 1
  fi
}

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

if [[ -n "$(command -v git)" ]]; then
  echo "Ensuring repository is up to date..."
  git pull origin main
  echo
fi

find_brew

if [[ -z "$(command -v brew)" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo

  find_brew || exit 1
fi

brew bundle check || brew bundle install --no-lock
echo

if [[ -z "$(command -v stow)" ]]; then
  echo "ERROR: Unable to locate stow, aborting installation."
  exit 1
fi

# bash
stow -v bash

# fish
mkdir -p "$HOME/.config/fish/completions" "$HOME/.config/fish/conf.d" "$HOME/.config/fish/functions"
if [[ -z "$CODESPACES" ]]; then
  FISH_PATH="$(command -v fish)"
  if ! grep -F -q "$FISH_PATH" /etc/shells; then
    echo "Configuring /etc/shells"
    echo "$FISH_PATH" | sudo tee -a /etc/shells
    echo
  fi
  if [[ "$SHELL" != "$FISH_PATH" ]]; then
    echo "Configuring default shell: $FISH_PATH"
    chsh -s "$FISH_PATH"
    echo
  fi
fi
stow -v fish

# git
mkdir -p "$HOME/.config/git"
touch git/.gitconfig
stow -v git

# node
mkdir -p "$HOME/.nodenv"
stow -v node

# ssh
mkdir -p "$HOME/.ssh" && chmod 700 "$HOME/.ssh"
if [[ "$(uname -s)" == Darwin ]]; then
  mkdir -p "$HOME/.1password" && ln -sf "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock" "$HOME/.1password/agent.sock"
fi
touch ssh/.ssh/config.personal
stow -v ssh

# starship
stow -v starship

# zsh
stow -v zsh

# miscellanous dotfiles
stow -v misc

# create "reverse" links so we can view config directories from this repo
ln -sf "$HOME/.config" "$HOME/.ssh" "$HOME/.nodenv" .

echo "Installation complete!"
echo "Exit and start a new terminal session to continue..."
