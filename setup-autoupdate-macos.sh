#!/usr/bin/env bash

set -u

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

if [[ -z "${USER-}" ]]; then
  USER=$(id -un)
fi

# include `/usr/local/bin` in PATH since that's where gpg lives.
if [[ ! "$(launchctl getenv PATH)" == */usr/local/bin* ]]; then
  echo "## configuring launchctl"
  sudo launchctl config user path "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
  echo
fi

sed -e "s|USER|$USER|g" -e "s|PWD|$PWD|g" autoupdate/Library/LaunchAgents/sample.UpdateDotfiles.plist >"autoupdate/Library/LaunchAgents/$USER.UpdateDotfiles.plist"
touch "$HOME/Library/Logs/$USER.UpdateDotfiles.log"

mkdir -p "$HOME/Library/LaunchAgents"
stow -v autoupdate

launchctl list "$USER.UpdateDotfiles" >/dev/null 2>&1 && launchctl unload -w "$HOME/Library/LaunchAgents/$USER.UpdateDotfiles.plist"
launchctl load -w "$HOME/Library/LaunchAgents/$USER.UpdateDotfiles.plist"
