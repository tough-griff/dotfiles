command -sq eza || exit

alias ls "eza -F --group-directories-first"
abbralias ll "ls -l"
abbralias la "ls -al"
abbralias lt "ls -al --tree"
