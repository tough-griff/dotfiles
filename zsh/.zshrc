# Load supporting config files
autoload -U colors && colors
source "${ZSHCONFIG}/aliases-and-functions.zsh"
source "${ZSHCONFIG}/completion.zsh"
source "${ZSHCONFIG}/gnu-utils.zsh"
source "${ZSHCONFIG}/highlighting-and-history.zsh"
source "${ZSHCONFIG}/osx.zsh"

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
  _fasd_cache="$HOME/.fasd-init-zsh"
  if [ "$(command -v fasd)" -nt "${_fasd_cache}" -o ! -s "${_fasd_cache}" ]; then
    eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)" >| "${_fasd_cache}"
  fi
  source "${_fasd_cache}"
  unset _fasd_cache
fi

# https://github.com/Homebrew/homebrew-command-not-found
if brew command command-not-found-init > /dev/null; then
  eval "$(brew command-not-found-init)"
fi

# source npm completions
if (( ${+commands[npm]} )); then
  eval "$(npm completion 2>/dev/null)"
fi

# added by travis gem
if [[ -f "$HOME/.travis/travis.sh" ]]; then
  source "$HOME/.travis/travis.sh"
fi

# Added by iTerm2
if [[ $TERM_PROGRAM =~ "iTerm" && -f "$HOME/.iterm2_shell_integration.zsh" ]]; then
  source "$HOME/.iterm2_shell_integration.zsh"
fi

# Boxen
source /opt/boxen/env.sh

# direnv goes last
if (( ${+commands[direnv]} )); then
  eval "$(direnv hook $0)"
fi
