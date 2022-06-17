export OS="$(uname -s)"
export ARCH="$(uname -m)"

if [[ "$OS" == "Darwin" ]]; then
  if [[ -x "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x "/usr/local/bin/brew" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

if [[ -n "$(command -v starship)" ]]; then
  eval "$(starship init zsh)"
fi
