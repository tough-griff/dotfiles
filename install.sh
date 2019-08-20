#!/usr/bin/env bash

cd $HOME

DOTDIR=${DOTDIR-"./dotfiles"}
DOTDIRABS=$(cd ${DOTDIR} && pwd)
PLIST_URL="https://gist.githubusercontent.com/tough-griff/3cb387b151bfa1d405135f422f863a0a/raw/gyourick.UpdateDotfiles.plist"
WHOAMI=$(whoami)

echo "beets"
echo "===="
(cd .config && ln -sfv ${DOTDIRABS}/beets)
echo

echo "fish"
echo "===="
(cd .config && ln -sfv ${DOTDIRABS}/fish)
echo

echo "git"
echo "===="
ln -sfv ${DOTDIR}/git/.gitconfig
touch ${DOTDIR}/git/.gitconfig.personal && ln -sfv ${DOTDIR}/git/.gitconfig.personal
ln -sfv ${DOTDIR}/git/.gitignore
echo

echo "js"
echo "===="
ln -sfv ${DOTDIR}/js/.noderc
if type nodenv >/dev/null; then
  echo "in $(nodenv root)"
  (cd $(nodenv root) && ln -sfv ${DOTDIRABS}/js/version)
  echo
fi

echo "ruby"
echo "===="
ln -sfv ${DOTDIR}/ruby/.gemrc
ln -sfv ${DOTDIR}/ruby/.pryrc
ln -sfv ${DOTDIR}/ruby/.railsrc
ln -sfv ${DOTDIR}/ruby/.rubocop.yml
echo

if type rbenv >/dev/null; then
  echo "in $(rbenv root)"
  (cd $(rbenv root) && ln -sfv ${DOTDIRABS}/ruby/version)
  echo
fi

echo "misc"
echo "===="
ln -sfv ${DOTDIR}/.agignore
ln -sfv ${DOTDIR}/.hushlogin
ln -sfv ${DOTDIR}/.psqlrc
echo

echo "reverse links"
echo "===="
(cd ${DOTDIR} && ln -sfv ${HOME}/.config)
(cd ${DOTDIR} && ln -sfv ${HOME}/.ssh)
(cd ${DOTDIR} && ln -sfv ${HOME}/Library/LaunchAgents)
echo

echo "setup autoupdate"
echo "===="
(
  cd ${DOTDIR}
  curl ${PLIST_URL} --output ${WHOAMI}.UpdateDotfiles.plist
  sed -i '' "s/gyourick/${WHOAMI}/g" ${WHOAMI}.UpdateDotfiles.plist
  (cd ${HOME}/Library/LaunchAgents && ln -sfv ${DOTDIRABS}/${WHOAMI}.UpdateDotfiles.plist)
  launchctl load -w ${HOME}/Library/LaunchAgents/${WHOAMI}.UpdateDotfiles.plist
)
