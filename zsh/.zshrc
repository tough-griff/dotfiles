export OS="$(uname -s)"
export ARCH="$(uname -m)"

if [[ "$OS" == "Darwin" ]]; then
  if [[ "$ARCH" == "arm64" ]]; then
    export HOMEBREW_PREFIX="/opt/homebrew"
  else
    export HOMEBREW_PREFIX="/usr/local"
  fi
fi

[[ -x "$HOMEBREW_PREFIX/bin/brew" ]] && eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"

eval "$(starship init zsh)"
