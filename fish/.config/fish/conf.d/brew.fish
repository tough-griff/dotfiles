command -sq brew || exit

set -gx HOMEBREW_NO_ENV_HINTS true

abbralias brewc "brew cleanup"
abbralias brewi "brew install"
abbralias brewl "brew list"
abbralias brews "brew search"
abbralias brewu "brew update && brew upgrade"
abbralias brewx "brew uninstall"
abbralias brewU "brew update && brew upgrade && brew cleanup"
