# Misc
alias cat bat
alias df 'df -kh'
alias du 'du -khd1'

alias where 'type -a'
alias tree 'tree -h -C --dirsfirst'
alias psa 'ps aux'

function psg
    ps aux | grep $argv | grep -v grep
end

alias path 'echo "" $PATH\n'

function mkcd
    mkdir $argv[1]
    cd $argv[1]
end

function cde
    cd $argv[1]
    edit .
end

function cdea
    cd $argv[1]
    edit-add .
end

function each
    for dir in *
        if test -d $dir
            echo $dir:
            cd $dir; and eval $argv
            echo
            cd ..
        end
    end
end

# Homebrew
abbr brewc 'brew cleanup'
abbr brewi 'brew install'
abbr brewl 'brew list'
abbr brews 'brew search'
abbr brewu 'brew update; and brew upgrade'
abbr brewx 'brew uninstall'
abbr brewU 'brew update; and brew upgrade; and brew cask upgrade; and brew cleanup'

abbr cask 'brew cask'
abbr caski 'brew cask install'
abbr caskl 'brew cask list'
abbr casks 'brew cask search'
abbr caskx 'brew cask uninstall'

# Node
alias npmi 'npm install'
alias npml 'npm ls --depth 0'

abbr ne 'nodenv each -v'
abbr npmle '/usr/local/bin/npm list -g --depth=0; and nodenv each -v npm list -g --depth=0'

# Atom
alias atom 'atom-beta'
alias apm 'apm-beta'
abbr apml 'apm-beta list --installed'
abbr apms 'apm-beta search'

function apmi --description 'apm install'
    apm-beta install $argv;
    and apm-beta list --installed --bare > $HOME/.atom/package.list
end

function apmu --description 'apm update'
    apm-beta update --confirm false;
    and apm-beta list --installed --bare > $HOME/.atom/package.list
end

function apmx --description 'apm uninstall'
    apm-beta uninstall $argv;
    and apm-beta list --installed --bare > $HOME/.atom/package.list
end

# Edit
function edit
    set -q $argv[1]; and set -l dir '.'; or set -l dir $argv[1]
    code $dir
end
abbr e edit

function edit-add
    set -q $argv[1]; and set -l dir '.'; or set -l dir $argv[1]
    code --add $dir
end
abbr ea edit-add

test -e {$HOME}/.iterm2_shell_integration.fish;
and source {$HOME}/.iterm2_shell_integration.fish




