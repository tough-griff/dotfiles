#!/bin/sh

set -eu

# exit immediately if op is already in $PATH
if [ "$(command -v op)" ]; then
  exit
fi

case "$(uname -s)" in
Darwin)
  # commands to install op on Darwin
  brew install --cask 1password-cli
  ;;
Linux)
  # commands to install op on Linux
  if [ "$(command -v brew)" ]; then
    brew install --cask 1password-cli
  elif [ "$(command -v apt-get)" ]; then
    sudo apt-get install -y curl gpg
    curl -sS https://downloads.1password.com/linux/keys/1password.asc |
      sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" |
      sudo tee /etc/apt/sources.list.d/1password.list
    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/ &&
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol |
      sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc |
      sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
    sudo apt-get update && sudo apt-get install 1password-cli
  elif [ "$(command -v yum)" ]; then
    sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
    sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
    sudo dnf check-update -y 1password-cli && sudo dnf install 1password-cli
  elif [ "$(command -v apk)" ]; then
    echo https://downloads.1password.com/linux/alpinelinux/stable/ >>/etc/apk/repositories
    wget https://downloads.1password.com/linux/keys/alpinelinux/support@1password.com-61ddfc31.rsa.pub -P /etc/apk/keys
    apk update && apk add 1password-cli
  else
    echo "Could not find a supported package manager (apt, yum, apk) to install 1Password CLI."
    echo "Follow these instructions: https://www.1password.dev/cli/get-started#manual-3"
    exit 1
  fi
  ;;
*)
  echo "unsupported OS"
  exit 1
  ;;
esac
