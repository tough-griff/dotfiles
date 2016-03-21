# Load supporting config files
source "$ZSHCONFIG/completion.zsh"
source "$ZSHCONFIG/highlighting_and_history.zsh"
source "$ZSHCONFIG/gnu_utils.zsh"
autoload -U colors && colors

# Load aliases and functions.
source "$ZSHCONFIG/zshaliases.zsh"

# Set the TG Prompt
autoload -Uz promptinit && promptinit
prompt 'tg'

setopt AUTO_CD
setopt CDABLE_VARS
setopt CORRECT
setopt EXTENDED_GLOB
unsetopt CLOBBER

# configure less using lesspipe
if (( ${+commands[lesspipe.sh]} )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

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

# added by travis gem
if [[ -f /Users/griffin/.travis/travis.sh ]]; then
  source /Users/griffin/.travis/travis.sh
fi

# initialize rbenv
if (( ${+commands[rbenv]} )); then
  eval "$(rbenv init -)"
fi

# initialize nodenv
if (( ${+commands[nodenv]} )); then
  eval "$(nodenv init -)"
fi

# direnv goes last
if (( ${+commands[direnv]} )); then
  eval "$(direnv hook $0)"
fi
