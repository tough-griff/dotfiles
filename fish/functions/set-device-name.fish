function set-device-name -d "Set computer name (as done via System Preferences → Sharing)" -a host
    set -q host || set host (hostname -s)
    sudo -v

    echo "Setting computer name to $host"
    sudo systemsetup -setcomputername "$host"
    sudo scutil --set ComputerName "$host"
    sudo scutil --set HostName "$host"
    sudo scutil --set LocalHostName "$host"
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$argv"
end
