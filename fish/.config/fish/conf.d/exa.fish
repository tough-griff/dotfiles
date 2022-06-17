command -sq exa || exit

alias ls "exa -F --group-directories-first"
abbralias ll "ls -l"
abbralias la "ls -al"
abbralias lt "ls -l --tree"
