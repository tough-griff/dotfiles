function flushdns -d "Flush the macOS DNS cache"
    sudo dscacheutil -flushcache
    sudo killall -HUP mDNSResponder
end
