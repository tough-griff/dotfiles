# Installation

Clone the repo to your desired location, like `~/dotfiles`. The `install.sh`
script will then install required dependencies, configure your default shell to
`fish`, and symlink included files to their appropriate locations.

```sh
git clone https://github.com/tough-griff/dotfiles.git && cd dotfiles && ./install.sh
```

Once the install script has completed, start a new terminal session. `fish`, the
new default shell, should detect that it has not been appropriately initialized
and configure itself. This time a new terminal session should not be necessary.

To update this repo accordingly you can simply re-run the `install.sh` script.

## Sync Instructions

By default this repo configures itself to automatically push any and all changes
every day at 2:15 PM. If you are not interested in this functionality, you can
disable it with the following command:

```sh
launchctl unload -w "$HOME/Library/LaunchAgents/$(whoami).UpdateDotfiles.plist"
```
