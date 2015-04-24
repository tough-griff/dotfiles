export ZSHCONFIG="$HOME/dotfiles/zsh"

# Load supporting config files
source "$ZSHCONFIG/completion.zsh"
source "$ZSHCONFIG/highlighting_and_history.zsh"
source "$ZSHCONFIG/gnu_utils.zsh"
autoload -U colors && colors

# Set the TG Prompt
fpath=("$ZSHCONFIG/prompt" $fpath)
autoload -Uz promptinit && promptinit
prompt 'tg'

setopt AUTO_CD
setopt CDABLE_VARS
setopt CORRECT
setopt EXTENDED_GLOB
unsetopt CLOBBER

# Set the terminal and tab title
precmd () {
  tab_label=${PWD/${HOME}/\~}
  echo -ne "\e]2;${tab_label}\a"
  echo -ne "\e]1;${tab_label: -24}\a"
}

# Use fasd for ultra-fast navigation
if (( ${+commands[fasd]} )); then
  fasd_cache="$HOME/.fasd-init-zsh"
  if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
    eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)" >| "$fasd_cache"
  fi
  source "$fasd_cache"
  unset fasd_cache
fi

# source npm completions
if (( ${+commands[npm]} )); then
  eval "$(npm completion 2>/dev/null)"
fi

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
alias cdpath='echo -e ${cdpath//:/\\n}'
alias manpath='echo -e ${MANPATH//:/\\n}'
alias infopath='echo -e ${infoPATH//:/\\n}'

# Homebrew
alias brewc='brew cleanup'
alias brewC='brew cleanup --force'
alias brewi='brew install'
alias brewl='brew list'
alias brews='brew search'
alias brewu='brew upgrade'
alias brewU='brew update && brew upgrade'
alias brewx='brew remove'

# Git
alias g='git'
alias ga='git add -A'
alias gb='git branch --verbose'
alias gba='git branch --all --verbose'
alias gc='git commit --message'
alias gci='git commit'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gd='git diff'
alias gdc='git diff --cached'
alias gf='git fetch'
alias gfa='git fetch --all --verbose --prune'
alias gh='git hash'
alias gl='git log --graph'
alias gp='git push'
alias gpl='git pull'
alias gs='git status --short'
alias gsh='git show'
alias gst='git status'
alias gu='git up'

# Ruby
alias rb='ruby'
alias rbb='bundle'
alias rbbe='bundle exec'
alias rbbi='bundle install'
alias rbbu='bundle update'

# ZSH
alias zr="exec zsh"

# Misc
if (( ${+commands[hub]} )); then
  eval "$(hub alias -s)"
fi

if (( ${+commands[thefuck]} )); then
  alias fuck='$(thefuck $(fc -ln -1))'
fi

function mkcd {
  [[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
}

# Opens file in EDITOR.
function edit {
  local dir="$1"
  [[ -z "$dir" ]] && dir='.'
  $EDITOR $dir
}
alias e='edit'
alias edf='edit ~/dotfiles'
alias ebc='edit ~/.bundle/config'

# Execute commands for each file in current directory.
# $ each git up
function each {
  for dir in *; do
    echo "${dir}:"
    cd $dir
    $@
    cd ..
    echo
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
    firstletter=$(echo $ext | cut -c1-1)
    if [[ firstletter != "." ]]; then
      ext=".$ext"
    fi
    lines=`find-exec "*$ext" cat | wc -l`
    lines=${lines// /}
    total=$(($total + $lines))
    echo "Lines of code for ${fg[blue]}$ext${reset_color}: ${fg[green]}$lines${reset_color}"
  done
  echo "${fg[blue]}Total${reset_color} lines of code: ${fg[green]}$total${reset_color}"
}

# Show how much RAM application uses.
# $ ram safari
# # => safari uses 154.69 MBs of RAM.
function ram {
  local sum
  local items
  local app="$1"
  if [[ -z "$app" ]]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
      sum=$(($i + $sum))
    done
    sum=$(echo "scale=2; $sum / 1024.0" | bc)
    if [[ $sum != "0" ]]; then
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
  yes > $dn & yes > $dn & yes > $dn & yes > $dn &
  yes > $dn & yes > $dn & yes > $dn & yes > $dn &
}

# $ retry ping google.com
function retry {
  echo Retrying "$@"
  $@
  sleep 1
  retry $@
}

# Cleanup OS X crap
function rm-osx-cruft {
  find "${@:-$PWD}" \( \
    -type f -name '.DS_Store' -o \
    -type f -name '__MACOSX' \
  \) -print0 | xargs -0 rm -rf
}

# Displays the current Finder.app directory.
function cfd {
  osascript 2>/dev/null <<EOF
    tell application "Finder"
      return POSIX path of (target of first window as text)
    end tell
EOF
}

# Displays the current Finder.app selection.
function cfs {
  osascript 2>/dev/null <<EOF
    tell application "Finder" to set the_selection to selection
    if the_selection is not {}
      repeat with an_item in the_selection
        log POSIX path of (an_item as text)
      end repeat
    end if
EOF
}

# Opens man pages in Preview.app
function manp {
  local page
  if (( $# > 0 )); then
    for page in $@; do
      man -t "$page" | open -f -a Preview
    done
  else
    echo "What manual page do you want?" >&2
  fi
}

# Opens a new tab in iTerm in the current directory
# $ tab     (opens a new tab)
# $ tab ls  (opens a new tab and executes ls)
function tab {
  local cmd="cd $PWD; clear"
  (( $# )) && cmd="$cmd; $*"
  osascript 2>/dev/null <<EOF
    tell application "iTerm"
      set current_terminal to current terminal
      tell current_terminal
        launch session "Default Session"
        set current_session to current session
        tell current_session
          write text "$cmd"
        end tell
      end tell
    end tell
EOF
}

# added by travis gem
[[ -f /Users/griffin/.travis/travis.sh ]] && source /Users/griffin/.travis/travis.sh

# direnv goes last
if (( ${+commands[direnv]} )); then
  eval "$(direnv hook $0)"
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
