# Misc
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
abbr brewU 'brew update; and brew upgrade; and brew cleanup; and brew cask cleanup'

abbr cask 'brew cask'
abbr caskc 'brew cask cleanup'
abbr caski 'brew cask install'
abbr caskl 'brew cask list'
abbr casks 'brew cask search'
abbr caskx 'brew cask uninstall'

# Node
alias npmi 'npm install'
alias npmci 'npmc install'
alias npml 'npm ls --depth 0'
alias npmcl 'npmc ls --depth 0'

# Atom
alias apml 'apm list --installed'
alias apms 'apm search'

function apmi --description 'apm instal'
  apm install $argv;
  and apm list --installed --bare > $HOME/.atom/package.list
end

function apmu --description 'apm update'
  apm update --confirm false;
  and apm list --installed --bare > $HOME/.atom/package.list
end

function apmx --description 'apm uninstall'
  apm uninstall $argv;
  and apm list --installed --bare > $HOME/.atom/package.list
end

function edit
  set -q $argv[1]; and set -l dir '.'; or set -l dir $argv[1]
  atom-beta $dir
end
abbr e edit

function edit-add
  set -q $argv[1]; and set -l dir '.'; or set -l dir $argv[1]
  atom-beta --add $dir
end
abbr ea edit-add

test -e {$HOME}/.iterm2_shell_integration.fish;
and source {$HOME}/.iterm2_shell_integration.fish
