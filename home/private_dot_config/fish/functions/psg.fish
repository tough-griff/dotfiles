function psg -d "ps aux | grep"
    ps aux | grep $argv | grep -v grep
end
