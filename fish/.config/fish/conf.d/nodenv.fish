command -sq nodenv || exit

set -gx NODE_BUILD_DEFINITIONS "$(brew --prefix node-build-update-defs)/share/node-build:$(brew --prefix node-build)/share/node-build"

status is-interactive && source "$(nodenv init - | psub)"
