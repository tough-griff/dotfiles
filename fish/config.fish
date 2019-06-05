# Misc
alias cat bat
alias df 'df -kh'
alias du 'du -khd1'
alias e edit
alias ea 'edit --add'
alias tree 'tree -h -C --dirsfirst'
alias psa 'ps aux'
alias path 'echo "" $PATH\n'
alias where 'type -a'

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

test -e {$HOME}/.iterm2_shell_integration.fish;
and source {$HOME}/.iterm2_shell_integration.fish
