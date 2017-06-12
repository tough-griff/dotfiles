# homebrew
set -x CFLAGS "-I/usr/local/include"
set -x LDFLAGS "-L/usr/local/lib"

# nodenv
set -x NODENV_ROOT /usr/local/var/nodenv

# rbenv & ruby-build
set -x RBENV_ROOT /usr/local/var/rbenv
set -x RUBY_CONFIGURE_OPTS --disable-install-doc

# SparkPost/gitplus
set -x PATH $PATH $HOME/SparkPost/gitplus/commands
