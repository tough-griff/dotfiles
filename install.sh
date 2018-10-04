#!/usr/bin/env bash

cd $HOME

DOTDIR=${DOTDIR-"./dotfiles"}
DOTDIRABS=$(cd ${DOTDIR} && pwd)

echo "Atom"
echo "===="
ln -sfv ${DOTDIR}/.atom
echo

echo "Hyper"
echo "====="
ln -sfv ${DOTDIR}/hyper/.hyper.js
echo

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
[[ -f ${DOTDIR}/git/.gitconfig.personal ]] && ln -sfv ${DOTDIR}/git/.gitconfig.personal
ln -sfv ${DOTDIR}/git/.gitignore
echo

if type nodenv >/dev/null; then
  echo "js"
  echo "===="
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
[[ -f ${DOTDIR}/.secrets ]] && ln -sfv ${DOTDIR}/.secrets
echo

echo "reverse links"
echo "===="
(cd ${DOTDIR} && ln -sfv ${HOME}/.config)
echo
