function set-device-name --description "Set computer name (as done via System Preferences → Sharing)"
    test -n "$argv"; or set argv (hostname -s)

    echo "Setting computer name to $argv"
    sudo scutil --set ComputerName $argv
    sudo scutil --set HostName $argv
    sudo scutil --set LocalHostName $argv
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $argv
end
