#!/usr/bin/env zsh

cd $HOME

DOTDIR=${DOTDIR:="./dotfiles"}
DOTDIRABS=$(cd ${DOTDIR} && pwd)

echo "Atom"
echo "===="
ln -sfv ${DOTDIR}/.atom
echo

echo "git"
echo "===="
ln -sfv ${DOTDIR}/git/.gitconfig
[[ -f ${DOTDIR}/git/.gitconfig.personal ]] && ln -sfv ${DOTDIR}/git/.gitconfig.personal
ln -sfv ${DOTDIR}/git/.gitignore
echo

if (( ${+commands[nodenv]} )); then
  echo "js"
  echo "===="
  echo $(nodenv root)
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
  (cd $(rbenv root) && ln -sfv ${DOTDIRABS}/ruby/version)
  echo
fi

echo "zsh"
echo "===="
setopt EXTENDED_GLOB
ln -sfv ${DOTDIR}/zsh/.zprezto
for rcfile in ${DOTDIR}/zsh/.zprezto/runcoms/^README.md(.N); do
  ln -sfv "$rcfile" ".${rcfile:t}"
done
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
