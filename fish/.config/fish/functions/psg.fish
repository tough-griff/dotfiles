function psg --description "ps aux | grep"
    ps aux | grep $argv | grep -v grep
end
