# Installation

Clone the repo to your desired location, like `~/dotfiles`. The `install`
script will then install required dependencies, configure your default shell to
`fish`, and symlink included files to their appropriate locations.

```sh
git clone https://github.com/tough-griff/dotfiles.git && cd dotfiles && ./install
```

Once the install script has completed, start a new terminal session. `fish`, the
new default shell, should detect that it has not been appropriately initialized
and configure itself. This time a new terminal session should not be necessary.

To update this repo accordingly you can simply re-run the `install` script.

> NOTE: when adding any new files or functions to your fish config, you will
> need to re-run the `stow fish` command

## Sync Instructions

This repository offers the option to configure a `launchd` script to
automatically commit and push any changes daily.

For this to work, you should fork the repository for yourself and then run the
following script:

```sh
./setup-autoupdate
```

You can view logs for the update script at
`$HOME/Library/Logs/username.UpdateDotfiles.log`

If at any point you wish to disable the auto-update script, run:

```sh
launchctl unload -w "$HOME/Library/LaunchAgents/$(whoami).UpdateDotfiles.plist"
```

## macOS Defaults

The legendary `~/.macos` script is pulled from https://github.com/mathiasbynens/dotfiles/blob/main/.macos
with a few tweaks to my liking. Run it with:

```sh
./macos
```
