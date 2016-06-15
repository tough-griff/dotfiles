# Aliases & Functions
# -------------------
# Disable correction.
alias ag='nocorrect ag'
alias cd='nocorrect cd'
alias cp='nocorrect cp'
alias gcc='nocorrect gcc'
alias gist='nocorrect gist'
alias grep='nocorrect grep'
alias heroku='nocorrect heroku'
alias ln='nocorrect ln'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias rm='nocorrect rm'

# Disable globbing.
alias bower='noglob bower'
alias bundle='noglob bundle'
alias fc='noglob fc'
alias find='noglob find'
alias ftp='noglob ftp'
alias history='noglob history'
alias locate='noglob locate'
alias notify='noglob notify'
alias rake='noglob rake'
alias rsync='noglob rsync'
alias scp='noglob scp'
alias sftp='noglob sftp'

# *nix
alias _='sudo'

alias l='ls -h --color=auto --group-directories-first'
alias ls='ls -h --color=auto --group-directories-first'
alias ll='ls -l'
alias la='ll -a'
alias l.='ll -d .*'
alias lsg='la | grep'

alias df='df -H'
alias du='du -h -d 1'

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
alias infopath='echo -e ${INFOPATH//:/\\n}'

# Homebrew
alias brewc='brew cleanup'
alias brewi='brew install'
alias brewl='brew list'
alias brews='brew search'
alias brewu='brew update && brew upgrade --all'
alias brewx='brew uninstall'

alias cask='brew cask'
alias caskc='brew cask cleanup'
alias caski='brew cask install'
alias caskl='brew cask list'
alias casks='brew cask search'
alias caskx='brew cask uninstall'

# Git
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

# Foreman
alias fm='foreman'
alias fms='foreman start'
alias fmsd='foreman start -f Procfile.dev'
alias fmsp='foreman start -e .env.prod'

# Ruby
alias rb='ruby'
alias rbb='bundle'
alias rbbe='bundle exec'
alias rbbi='bundle install'
alias rbbu='bundle update'

# Adds the current working directory as the source for a local gem git repo.
function bundle-set-local-gem {
  echo "$ bundle config \"local.${PWD##*/}\" \"$PWD\""
  bundle config "local.${PWD##*/}" "$PWD"
}
alias bslg='bundle-set-local-gem'

# Removes a given local gem git repo, given a gem name as the argument.
function bundle-unset-local-gem {
  echo "$ bundle config --delete \"local.$@\""
  bundle config --delete "local.$@"
}
alias bulg='bundle-unset-local-gem'

# Node
alias npmi='npm install'
alias npml='npm list --depth=0'
alias npmr='npm run'
alias npms='npm search'
alias npmu='npm update'
alias npmx='npm uninstall'

# apm (atom package manager)
function apmi {
  apm install $@ && apm list --installed --bare >! $HOME/.atom/package-list
}
alias apml='apm list --installed'
alias apms='apm search'
alias apmu='apm update --confirm false && apm list --installed --bare >! $HOME/.atom/package-list'
function apmx {
  apm uninstall $@ && apm list --installed --bare >! $HOME/.atom/package-list
}

# ZSH
alias zr="source ${0:a}"

alias electron='/Applications/Electron.app/Contents/MacOS/Electron'

alias wifi-password='wifi-password -q'

# Misc
if (( ${+commands[hub]} )); then
  eval "$(hub alias -s)"
fi

if (( ${+commands[thefuck]} )); then
  eval "$(thefuck --alias)"
fi

function mkcd {
  [[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
}

# Opens file in EDITOR.
function edit {
  local dir="$1"
  [[ -z "${dir}" ]] && dir='.'
  $EDITOR ${dir}
}
alias e='edit'
function edit-add {
  local dir="$1"
  [[ -z  "${dir}" ]] && dir='.'
  $EDITOR --add ${dir}
}
alias ea='edit-add'
alias edf='edit ~/dotfiles'
alias ebc='edit ~/.bundle/config'

# Execute commands for each file in current directory.
# $ each git up
function each {
  for dir in *; do
    if [[ -d ${dir} ]]; then
      echo "${dir}:"
      (cd ${dir} && eval "$@")
      echo
    fi
  done
}

# Find files and exec commands at them.
# $ find-exec .coffee cat | wc -l
# # => 9762
function find-exec {
  find . -type f -iname "*${1:-}*" -exec "${2:-file}" '{}' \;
}

# Better find(1)
function ff {
  find . -iname "*${1:-}*"
}

# Count code lines in some directory.
# $ loc py js css
# # => Lines of code for .py: 3781
# # => Lines of code for .js: 3354
# # => Lines of code for .css: 2970
# # => Total lines of code: 10105
function loc {
  local total
  local firstletter
  local ext
  local lines
  total=0
  for ext in $@; do
    firstletter=$(echo ${ext} | cut -c1-1)
    if [[ firstletter != "." ]]; then
      ext=".${ext}"
    fi
    lines=`find-exec "*${ext}" cat | wc -l`
    lines=${lines// /}
    total=$((${total} + ${lines}))
    echo "Lines of code for ${fg[blue]}${ext}${reset_color}: ${fg[green]}${lines}${reset_color}"
  done
  echo "${fg[blue]}Total${reset_color} lines of code: ${fg[green]}${total}${reset_color}"
}

# Show how much RAM application uses.
# $ ram safari
# # => safari uses 154.69 MBs of RAM.
function ram {
  local sum
  local items
  local app="$1"
  if [[ -z "${app}" ]]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in `ps aux | grep -i "${app}" | grep -v "grep" | awk '{print $6}'`; do
      sum=$((${i} + ${sum}))
    done
    sum=$(echo "scale=2; ${sum} / 1024.0" | bc)
    if [[ ${sum} != "0" ]]; then
      echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
    else
      echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
    fi
  fi
}

# Haxx
function compute {
  while true; do
    head -n 100 /dev/urandom
    sleep 0.1
  done | hexdump -C | grep "ca fe"
}

# Spam `say` with random words.
function sayrandom {
  while true; do
    perl -e 'open IN, "</usr/share/dict/words";rand($.) < 1 && ($n=$_) while <IN>;print $n' | say
    sleep 0.1
  done
}

# Load 8 cores at once.
function maxcpu {
  local dn=/dev/null
  yes > ${dn} & yes > ${dn} & yes > ${dn} & yes > ${dn} &
  yes > ${dn} & yes > ${dn} & yes > ${dn} & yes > ${dn} &
}

# $ retry ping google.com
function retry {
  echo Retrying "$@"
  $@
  sleep 1
  retry $@
}
