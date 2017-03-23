#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
source /opt/boxen/env.sh
eval "$(fasd --init posix-alias)"

alias tree='tree -h -C --dirsfirst'

alias psa='ps aux'
function psg {
  ps aux | grep $@ | grep -v grep
}

function psu {
  ps -U "${1:-$USER}" -o 'pid,%cpu,%mem,command' "${(@)argv[2,-1]}"
}

alias path='echo -e ${PATH//:/\\n}'
alias fpath='echo -e ${FPATH//:/\\n}'
alias cdpath='echo -e ${CDPATH//:/\\n}'
alias manpath='echo -e ${MANPATH//:/\\n}'

# Homebrew
alias brewc='brew cleanup'
alias brewi='brew install'
alias brewl='brew list'
alias brews='brew search'
alias brewu='brew update && brew upgrade'
alias brewx='brew uninstall'

alias cask='brew cask'
alias caskc='brew cask cleanup'
alias caski='brew cask install'
alias caskl='brew cask list'
alias casks='brew cask search'
alias caskx='brew cask uninstall'

# Git
alias git='hub'
alias g='git'
alias ga='git add -A'
alias gam='git amend'
alias gb='git branch --verbose --verbose'
alias gba='git branch --all --verbose --verbose'
alias gc='git commit --message'
alias gci='git commit'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gd='git diff'
alias gdc='git diff --cached'
alias gf='git fetch --verbose --prune'
alias gfa='git fetch --all --verbose --prune'
alias gh='git hash'
alias ghc='git hash | pbcopy'
alias gl='git log --graph'
alias glb='git log --graph --branches'
alias gp='git push'
alias gpl='git pull'
alias gpu='git push --set-upstream'
alias gs='git status --short'
alias gsb='git show-branch'
alias gsh='git show'
alias gst='git status'
alias gu='git up'

function git-ignore-dir {
  local dir="$1"
  [[ -z "${dir}" ]] && dir='.'
  git ls-files -z ${dir} | xargs -0 git update-index --assume-unchanged
}
alias gigd='git-ignore-dir'

# Node
alias npmi='npm install'
alias npml='npm list --depth=0'
alias npmr='npm run'
alias npms='npm search'
alias npmu='npm update'
alias npmx='npm uninstall'

# apm (atom package manager)
function apmi {
  apm install $@ && apm list --installed --bare >! $HOME/.atom/package.list
}
alias apml='apm list --installed'
alias apms='apm search'
alias apmu='apm update --confirm false && apm list --installed --bare >! $HOME/.atom/package.list'
function apmx {
  apm uninstall $@ && apm list --installed --bare >! $HOME/.atom/package.list
}

# Opens file in EDITOR.
function edit {
  local dir="$1"
  [[ -z "${dir}" ]] && dir='.'
  atom ${dir}
}
alias e='edit'
function edit-add {
  local dir="$1"
  [[ -z  "${dir}" ]] && dir='.'
  atom --add ${dir}
}
alias ea='edit-add'
alias edf='edit ~/dotfiles'
alias ebc='edit ~/.bundle/config'
