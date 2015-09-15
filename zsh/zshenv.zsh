# Environment variables are sourced prior to loading zshrc
# --------------------------------------------------------
# Define the zsh configuration folder.
export ZSHCONFIG="$HOME/dotfiles/zsh"

# Define secret environment variables.
_secrets="$HOME/.secrets"
[[ -f "$_secrets" ]] && source $_secrets
unset _secrets

# Browser
# -------
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# Editors
# -------
export EDITOR='atom'
export VISUAL='atom'
export PAGER='less'

# Language
# --------
if [[ -z "$LANG" ]]; then
  eval "$(locale)"
fi

# Less
# ----
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Paths
# -----
typeset -gU cdpath fpath mailpath manpath path
typeset -gUT INFOPATH infopath

# Set the list of directories that cd searches.
cdpath=(
  $cdpath
)

# Set the list of directories zsh searches for functions.
fpath=(
  $ZSHCONFIG/prompt
  $fpath
)

# Set the list of directories that info searches for manuals.
infopath=(
  /usr/local/share/info
  /usr/share/info
  $infopath
)

# Set the list of directories that man searches for manuals.
manpath=(
  /usr/local/share/man
  /usr/share/man
  $manpath
  /Applications/Postgres.app/Contents/Versions/9.3/share/man/
  /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/share/man/
)

# Set the list of directories that zsh searches for programs.
path=(
  $HOME/bin
  $path
  /Applications/Postgres.app/Contents/Versions/9.4/bin
  /usr/local/share/git-core/contrib/diff-highlight
)

# Misc
# ----
# Temporary Files
if [[ -d "$TMPDIR" ]]; then
  export TMPPREFIX="${TMPDIR%/}/zsh"
  if [[ ! -d "$TMPPREFIX" ]]; then
    mkdir -p "$TMPPREFIX"
  fi
fi

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv

# nodenv
export NODENV_ROOT=/usr/local/var/nodenv

# CA Bundle
export SSL_CERT_FILE=/usr/local/etc/openssl/certs/ca-bundle.crt
