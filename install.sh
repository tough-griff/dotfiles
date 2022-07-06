#!/bin/sh

set -euf

if [ ! "$(command -v chezmoi)" ]; then
  if [ "$(command -v curl)" ]; then
    sh -c "$(curl -fsSL https://git.io/chezmoi)" -- -b "$HOME/bin"
  elif [ "$(command -v wget)" ]; then
    sh -c "$(wget -qO- https://git.io/chezmoi)" -- -b "$HOME/bin"
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi

  chezmoi="$HOME/bin/chezmoi"
else
  chezmoi=chezmoi
fi

exec $chezmoi init --apply --source="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
