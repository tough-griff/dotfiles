# Installation

After cloning, run the installation script (`install.sh`). After the install
script has completed, restart your shell. Run `~/.config/fish/init.fish` to
initialize fish.

## Sync Instructions

By default this repo configures itself to automatically push any and all changes
every day at 2:15 PM. If you are not interested in this functionality, you can
disable it with the following command:

```sh
launchctl unload -w "$HOME/Library/LaunchAgents/$(whoami).UpdateDotfiles.plist"
```
