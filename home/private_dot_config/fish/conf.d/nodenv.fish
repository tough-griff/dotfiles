command -sq nodenv || exit

status is-interactive && nodenv init - fish | source

set -gx NODE_BUILD_DEFINITIONS "$(brew --prefix node-build-update-defs)/share/node-build:$(brew --prefix node-build)/share/node-build"

abbralias ne "nodenv each -v"
abbralias npmle "nodenv each -v npm list -g --depth=0"

for v in (nodenv versions --bare)
    alias "node$v" "env NODENV_VERSION=$v node"
end
