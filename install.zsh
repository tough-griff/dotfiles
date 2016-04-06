#!/usr/bin/env zsh

cd ${HOME}

DOTDIR=${DOTDIR:="./dotfiles"}
DOTDIRABS=$(cd $DOTDIR && pwd)

echo "Atom"
echo "===="
ln -sfv ${DOTDIR}/.atom
echo

echo "git"
echo "===="
ln -sfv ${DOTDIR}/git/.gitconfig
ln -sfv ${DOTDIR}/git/.gitconfig.personal
ln -sfv ${DOTDIR}/git/.gitignore
echo

echo "js"
echo "===="
ln -sfv ${DOTDIR}/js/.eslintrc.js
echo

if (( ${+commands[nodenv]} )); then
  echo $(nodenv root)
  (cd $(nodenv root) && ln -sfv ${DOTDIRABS}/js/default-packages)
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

if (( ${+commands[rbenv]} )); then
  echo $(rbenv root)
  (cd $(rbenv root) && ln -sfv ${DOTDIRABS}/ruby/default-gems)
  (cd $(rbenv root) && ln -sfv ${DOTDIRABS}/ruby/version)
  echo
fi

echo "zsh"
echo "===="
ln -sfv ${DOTDIR}/zsh/.zlogin
ln -sfv ${DOTDIR}/zsh/.zshenv
ln -sfv ${DOTDIR}/zsh/.zshrc
echo

echo "misc"
echo "===="
ln -sfv ${DOTDIR}/.agignore
ln -sfv ${DOTDIR}/.haml-lint.yml
ln -sfv ${DOTDIR}/.hushlogin
ln -sfv ${DOTDIR}/.psqlrc
ln -sfv ${DOTDIR}/.scss-lint.yml
[[ -f ${DOTDIR}/.secrets ]] && ln -sfv ${DOTDIR}/.secrets
echo
