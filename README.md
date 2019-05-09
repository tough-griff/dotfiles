# Instructions
> See: https://gist.github.com/tough-griff/3cb387b151bfa1d405135f422f863a0a
- Save the `plist` file to `$HOME/Library/LaunchAgents/`, renamed appropriately 
(e.g. `username.UpdateSomeRepository.plist`)
- Copy `update.sh` to the repository you wish to sync. Change the message if you want.
- Replace user/machine specific variables in the `plist` file
  - Replace `gyourick` in your with your username (`whoami`).
  - Update the `<key>Program</key>` value to the path of your `update.sh`.
  - Change the time the script runs under `<key>StartCalendarInterval</key>`. `Hour` is in 24-hour time and uses your machine's local time.
- Run `launchctl load -w $HOME/Library/LaunchAgents/username.UpdateSomeRepository.plist`
