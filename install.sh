#!/usr/bin/env bash

DOTDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) # Absolute path
DOTDIR_REL=${DOTDIR/#"$HOME"/"."}                    # Relative path

echo "# .config"
ln -sfv "$DOTDIR/beets" "$DOTDIR/fish" "$HOME/.config"
echo

echo "# git"
touch "$DOTDIR/git/.gitconfig.personal"
ln -sfv "$DOTDIR_REL/git/.gitconfig" "$DOTDIR_REL/git/.gitconfig.personal" "$DOTDIR_REL/git/.gitignore" "$HOME"
echo

echo "# js"
ln -sfv "$DOTDIR_REL/js/.noderc" "$HOME"
if type nodenv >/dev/null; then
  ln -sfv "$DOTDIR/js/version" "$(nodenv root)"
fi
echo

echo "# ruby"
ln -sfv "$DOTDIR_REL/ruby/.gemrc" "$DOTDIR_REL/ruby/.pryrc" "$DOTDIR_REL/ruby/.railsrc" "$DOTDIR_REL/ruby/.rubocop.yml" "$HOME"
if type rbenv >/dev/null; then
  ln -sfv "$DOTDIR/ruby/version" "$(rbenv root)"
fi
echo

echo "# misc"
ln -sfv "$DOTDIR_REL/.agignore" "$DOTDIR_REL/.hushlogin" "$DOTDIR_REL/.psqlrc" "$HOME"
echo

echo "# reverse links"
ln -sfv "$HOME/.config" "$HOME/.ssh" "$HOME/Library/LaunchAgents" "$DOTDIR"
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
