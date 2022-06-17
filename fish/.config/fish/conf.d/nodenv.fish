command -sq nodenv || exit

status is-interactive && source "$(nodenv init - | psub)"

set -gx NODE_BUILD_DEFINITIONS "$(brew --prefix node-build-update-defs)/share/node-build:$(brew --prefix node-build)/share/node-build"
