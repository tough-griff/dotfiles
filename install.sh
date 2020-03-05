#!/usr/bin/env bash

shopt -s extglob

DOTDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) # Absolute path

echo "# macos & homebrew"
if (! command -v brew >/dev/null 2>&1); then
    echo "## installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
(cd "$DOTDIR" && brew bundle)
echo

echo "# .config"
mkdir -p "$HOME/.config"
ln -sfv "$DOTDIR/beets" "$DOTDIR/fish" "$DOTDIR/starship.toml" "$HOME/.config"
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
ln -sfv "$DOTDIR/git/.gitconfig" "$DOTDIR/git/.gitconfig.personal" "$DOTDIR/git/.gitignore" "$HOME"
echo

echo "# js"
ln -sfv "$DOTDIR/js/.noderc" "$HOME"
if command -v nodenv >/dev/null 2>&1; then
    ln -sfv "$DOTDIR/js/version" "$(nodenv root)"
fi
echo

echo "# ruby"
ln -sfv "$DOTDIR/ruby/.gemrc" "$DOTDIR/ruby/.pryrc" "$DOTDIR/ruby/.railsrc" "$DOTDIR/ruby/.rubocop.yml" "$HOME"
if command -v rbenv >/dev/null 2>&1; then
    ln -sfv "$DOTDIR/ruby/version" "$(rbenv root)"
fi
echo

echo "# misc"
ln -sfv "$DOTDIR/.hushlogin" "$DOTDIR/.psqlrc" "$HOME"
echo

echo "# reverse links"
ln -sfv "$HOME/.config" "$HOME/Library/LaunchAgents" "$DOTDIR"
ln -sfv "$HOME/.npmrc" "$DOTDIR/js"
echo

echo "# autoupdate"
PLIST_URL="https://gist.githubusercontent.com/tough-griff/3cb387b151bfa1d405135f422f863a0a/raw/gyourick.UpdateDotfiles.plist"
WHOAMI=$(whoami)
PLIST="$WHOAMI.UpdateDotfiles.plist"
PLIST_LOG="$WHOAMI.UpdateDotfiles.log"
curl "$PLIST_URL" --output "$DOTDIR/$PLIST"
sed -i "" "s/gyourick/$WHOAMI/g" "$DOTDIR/$PLIST"
ln -sfv "$DOTDIR/$PLIST" "$HOME/Library/LaunchAgents/$PLIST"
touch "$HOME/Library/Logs/$PLIST_LOG"
ln -sfv "$HOME/Library/Logs/$PLIST_LOG" "$DOTDIR"
launchctl load -w "$HOME/Library/LaunchAgents/$PLIST"
echo
