#!/usr/bin/env bash

# pulled from homebrew's installer
getc() {
  local save_state
  save_state=$(/bin/stty -g)
  /bin/stty raw -echo
  IFS= read -r -n 1 -d '' "$@"
  /bin/stty "$save_state"
}

# pulled from homebrew's installer
wait_for_user() {
  local c
  echo "Press RETURN to continue or any other key to abort"
  getc c
  # we test for \r and \n because some stuff does \r instead
  if ! [[ "$c" == $'\r' || "$c" == $'\n' ]]; then
    exit 1
  fi
}

shopt -s extglob

cd "$(dirname "${BASH_SOURCE[0]}")" || exit

echo "Ensuring repository is up to date..."
git pull origin main
echo

if ! command -v brew >/dev/null 2>&1; then
    echo "## installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
if command -v brew >/dev/null 2>&1; then
    brew bundle check || brew bundle install
    BREW_PREFIX=$(brew --prefix)
    BREW_BIN="$BREW_PREFIX/bin"
    echo

    if [[ ! $(launchctl getenv PATH) == *$BREW_BIN* ]]; then
        echo "## configuring launchctl"
        sudo launchctl config user path "$BREW_BIN:/usr/bin:/bin:/usr/sbin:/sbin"
        echo
    fi

    if ! grep -F -q "$BREW_BIN" /etc/paths; then
        echo "## configuring path"
        echo "$BREW_BIN" | cat - /etc/paths | sudo tee /etc/paths
        echo
    fi

    if ! grep -F -q "$BREW_BIN/fish" /etc/shells; then
        echo "## configuring default shell"
        echo "$BREW_BIN/fish" | sudo tee -a /etc/shells
        chsh -s "$BREW_BIN/fish"
        echo
    fi
else
    echo "WARNING: Homebrew is still not in your PATH. Proceed anyway?"
    wait_for_user
    echo
fi

if ! command -v stow >/dev/null 2>&1; then
    echo "ERROR: Unable to locate stow, aborting installation."
fi

stow -v editorconfig

mkdir -p "$HOME/.config/fish/completions" "$HOME/.config/fish/conf.d" "$HOME/.config/fish/functions"
stow -v fish

touch "$PWD/git/.gitconfig.personal"
stow -v git

stow -v login
stow -v node
stow -v psql

mkdir -p "$HOME/.ssh" && chmod 700 "$HOME/.ssh" && touch "$HOME/.ssh/config.personal"
stow -v ssh
if [[ ! -e "$HOME/.ssh/id_ed25519" ]]; then
    echo "generating ssh key"
    ssh-keygen -t ed25519 -a 100 -C "$(whoami)@$(hostname)"
fi
if [[ ! -e "$HOME/.ssh/id_rsa" ]]; then
    echo "generating ssh key (rsa)"
    ssh-keygen -t rsa -b 4096 -C "$(whoami)@$(hostname)"
fi

echo "creating reverse links"
ln -sfv "$HOME/.aws" "$HOME/.config" "$HOME/.ssh" "$PWD"
echo

echo "### macos autoupdate ###"
WHOAMI=$(whoami)
PLIST="$WHOAMI.UpdateDotfiles.plist"
PLIST_LOG="$WHOAMI.UpdateDotfiles.log"
sed "s/WHOAMI/$WHOAMI/g" "$PWD/sample.UpdateDotfiles.plist" > "$PWD/$PLIST"
ln -sfv "$PWD/$PLIST" "$HOME/Library/LaunchAgents/$PLIST"
touch "$HOME/Library/Logs/$PLIST_LOG"
ln -sfv "$HOME/Library/Logs/$PLIST_LOG" "$PWD"
launchctl list "$WHOAMI.UpdateDotfiles" >/dev/null 2>&1 && launchctl unload -w "$HOME/Library/LaunchAgents/$PLIST"
launchctl load -w "$HOME/Library/LaunchAgents/$PLIST"
echo

echo "Installation complete!"
echo "Exit and start a new terminal session to continue..."
