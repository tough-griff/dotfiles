# homebrew
set -gx CFLAGS "-I$BREW_PREFIX/include"
set -gx LDFLAGS "-L$BREW_PREFIX/lib"

abbralias brewc "brew cleanup"
abbralias brewi "brew install"
abbralias brewl "brew list"
abbralias brews "brew search"
abbralias brewu "brew update && brew upgrade"
abbralias brewx "brew uninstall"
abbralias brewU "brew update && brew upgrade && brew cleanup"
