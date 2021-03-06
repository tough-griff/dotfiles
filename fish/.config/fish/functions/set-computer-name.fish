function set-computer-name -a host -d "Set computer name (as done via System Preferences → Sharing)"
    set -q host || set host (hostname -s)

    echo "Setting computer name to $host. This requires sudo"
    sudo -v

    sudo systemsetup -setcomputername "$host" >/dev/null
    sudo scutil --set ComputerName "$host"
    sudo scutil --set HostName "$host"
    sudo scutil --set LocalHostName "$host"
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$host"
end
