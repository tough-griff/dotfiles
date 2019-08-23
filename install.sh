#!/usr/bin/env bash

shopt -s extglob

DOTDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) # Absolute path
DOTDIR_REL=${DOTDIR/#"$HOME"/"."}                    # Relative path

echo "# macos & homebrew"
if (! command -v brew >/dev/null 2>&1); then
  echo "## installing homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
(cd "$DOTDIR/macos" && brew bundle)
echo

echo "# .config"
ln -sfv "$DOTDIR/beets" "$DOTDIR/fish" "$HOME/.config"
echo

echo "# .ssh"
mkdir -p "$HOME/.ssh" && chmod 700 "$HOME/.ssh" && touch "$HOME/.ssh/config.personal"
ln -sfv "$DOTDIR/.ssh/config" "$HOME/.ssh"
if [[ ! -e "$HOME/.ssh/id_ed25519" ]]; then
  echo "## ssh key"
  ssh-keygen -t ed25519 -a 100 -C "$(whoami)@$(hostname)"
fi
echo "## reverse links"
ln -sfv "$HOME"/.ssh/!(config) "$DOTDIR/.ssh"
echo

echo "# git"
touch "$DOTDIR/git/.gitconfig.personal"
ln -sfv "$DOTDIR_REL/git/.gitconfig" "$DOTDIR_REL/git/.gitconfig.personal" "$DOTDIR_REL/git/.gitignore" "$HOME"
echo

echo "# js"
ln -sfv "$DOTDIR_REL/js/.noderc" "$HOME"
if command -v nodenv >/dev/null 2>&1; then
  ln -sfv "$DOTDIR/js/version" "$(nodenv root)"
fi
echo

echo "# ruby"
ln -sfv "$DOTDIR_REL/ruby/.gemrc" "$DOTDIR_REL/ruby/.pryrc" "$DOTDIR_REL/ruby/.railsrc" "$DOTDIR_REL/ruby/.rubocop.yml" "$HOME"
if command -v rbenv >/dev/null 2>&1; then
  ln -sfv "$DOTDIR/ruby/version" "$(rbenv root)"
fi
echo

echo "# misc"
ln -sfv "$DOTDIR_REL/.agignore" "$DOTDIR_REL/.hushlogin" "$DOTDIR_REL/.psqlrc" "$HOME"
echo

echo "# reverse links"
ln -sfv "$HOME/.config" "$HOME/Library/LaunchAgents" "$DOTDIR"
echo

echo "# autoupdate"
PLIST_URL="https://gist.githubusercontent.com/tough-griff/3cb387b151bfa1d405135f422f863a0a/raw/gyourick.UpdateDotfiles.plist"
WHOAMI=$(whoami)
PLIST="$WHOAMI.UpdateDotfiles.plist"
PLIST_PATH="$DOTDIR/$PLIST"
curl "$PLIST_URL" --output "$PLIST_PATH"
sed -i "" "s/gyourick/$WHOAMI/g" "$PLIST_PATH"
ln -sfv "$PLIST_PATH" "$HOME/Library/LaunchAgents/$PLIST"
launchctl load -w "$HOME/Library/LaunchAgents/$PLIST"
echo
