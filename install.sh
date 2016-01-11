#!/bin/bash

DOTDIR=${DOTDIR:="./dotfiles"}

cd ${HOME}

# Atom
ln -sfv ${DOTDIR}/.atom

# git
ln -sfv ${DOTDIR}/git/.gitconfig
ln -sfv ${DOTDIR}/git/.gitignore

# ruby
ln -sfv ${DOTDIR}/ruby/.gemrc
ln -sfv ${DOTDIR}/ruby/.pryrc
ln -sfv ${DOTDIR}/ruby/.railsrc
ln -sfv ${DOTDIR}/ruby/.rubocop.yml

# zsh
ln -sfv ${DOTDIR}/zsh/.zlogin
ln -sfv ${DOTDIR}/zsh/.zshenv
ln -sfv ${DOTDIR}/zsh/.zshrc

# misc
ln -sfv ${DOTDIR}/.agignore
ln -sfv ${DOTDIR}/.hushlogin
ln -sfv ${DOTDIR}/.psqlrc
