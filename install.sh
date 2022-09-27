#!/bin/sh

set -euf

chezmoi="chezmoi"

if [ ! "$(command -v chezmoi)" ]; then
  BIN_DIR="$HOME/bin"

  if [ "$(command -v curl)" ]; then
    sh -c "$(curl -fsSL https://git.io/chezmoi)" -- -b "$BIN_DIR"
  elif [ "$(command -v wget)" ]; then
    sh -c "$(wget -qO- https://git.io/chezmoi)" -- -b "$BIN_DIR"
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi

  chezmoi="$BIN_DIR/chezmoi"
fi

CHEZMOI_DIR="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
exec "$chezmoi" init --apply --source="$CHEZMOI_DIR"
