#!/usr/bin/env bash

# pulled from homebrew's installer
getc() {
  local save_state
  save_state=$(/bin/stty -g)
  /bin/stty raw -echo
  IFS= read -r -n 1 -d '' "$@"
  /bin/stty "$save_state"
}

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

echo "# macos & homebrew"
if ! command -v brew >/dev/null 2>&1; then
    echo "## installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
if command -v brew >/dev/null 2>&1; then
    brew bundle check || brew bundle install
    BREW_PREFIX=$(brew --prefix)
    echo

    # configure launchctl to have access to homebrew bin
    echo "## configuring launchctl"
    sudo launchctl config user path "$BREW_PREFIX/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    echo

    if ! grep -F -q "$BREW_PREFIX/bin" /etc/paths; then
        echo "## configuring path"
        echo "$BREW_PREFIX/bin" | cat - /etc/paths | sudo tee /etc/paths
        echo
    fi

    if ! grep -F -q "$BREW_PREFIX/bin/fish" /etc/shells; then
        echo "## configuring default shell"
        echo "$BREW_PREFIX/bin/fish" | sudo tee -a /etc/shells
        chsh -s "$BREW_PREFIX/bin/fish"
        echo
    fi
else
    echo "WARNING: Homebrew is still not in your PATH. Proceed anyway?"
    wait_for_user
    echo
fi

echo "# .config"
mkdir -p "$HOME/.config"
ln -sfv "$PWD/beets" "$PWD/fish" "$HOME/.config"
echo

echo "# .ssh"
mkdir -p "$HOME/.ssh" && chmod 700 "$HOME/.ssh" && touch "$HOME/.ssh/config.personal"
ln -sfv "$PWD/.ssh/config" "$HOME/.ssh"
if [[ ! -e "$HOME/.ssh/id_ed25519" ]]; then
    echo "## ssh key"
    ssh-keygen -t ed25519 -a 100 -C "$(whoami)@$(hostname)"
fi
if [[ ! -e "$HOME/.ssh/id_rsa" ]]; then
    echo "## ssh key (rsa)"
    ssh-keygen -t rsa -b 4096 -C "$(whoami)@$(hostname)"
fi
echo "## .ssh reverse links"
ln -sfv "$HOME"/.ssh/!(config) "$PWD/.ssh"
echo

echo "# git"
touch "$PWD/git/.gitconfig.personal"
ln -sfv "$PWD/git/.gitattributes" "$PWD/git/.gitconfig" "$PWD/git/.gitconfig.personal" "$PWD/git/.gitignore" "$HOME"
echo

echo "# js"
ln -sfv "$PWD/js/.noderc" "$HOME"
if command -v nodenv >/dev/null 2>&1; then
    ln -sfv "$PWD/js/version" "$(nodenv root)"
fi
echo

echo "# misc"
ln -sfv "$PWD/.hushlogin" "$PWD/.psqlrc" "$HOME"
echo

echo "# reverse links"
ln -sfv "$HOME/.config" "$HOME/Library/LaunchAgents" "$PWD"
ln -sfv "$HOME/.npmrc" "$PWD/js"
echo

echo "# autoupdate"
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
