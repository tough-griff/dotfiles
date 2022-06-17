command -sq brew || exit

set -gx CFLAGS "-I$HOMEBREW_PREFIX/include"
set -gx LDFLAGS "-L$HOMEBREW_PREFIX/lib"

abbralias brewc "brew cleanup"
abbralias brewi "brew install"
abbralias brewl "brew list"
abbralias brews "brew search"
abbralias brewu "brew update && brew upgrade"
abbralias brewx "brew uninstall"
abbralias brewU "brew update && brew upgrade && brew cleanup"
