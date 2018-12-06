# bat
set -x BAT_THEME "TwoDark"

# less
set -x LESS "-F -g -i -M -R -S -w -X -z-4"

# homebrew
set -x CFLAGS "-I/usr/local/include"
set -x LDFLAGS "-L/usr/local/lib"

# nodenv
set -x NODENV_ROOT /usr/local/var/nodenv

# rbenv & ruby-build
set -x RBENV_ROOT /usr/local/var/rbenv
set -x RUBY_CONFIGURE_OPTS --disable-install-doc

# rust
set -x RUSTUP_HOME /usr/local/var/rustup
set -x CARGO_HOME $RUSTUP_HOME

# SparkPost/gitplus
set -x PATH $PATH $HOME/SparkPost/gitplus/commands
