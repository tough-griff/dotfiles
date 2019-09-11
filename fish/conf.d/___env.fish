# bat
set -gx BAT_THEME "TwoDark"

# less
set -gx LESS "-F -g -i -M -R -S -w -X -z-4"

# localization
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

# editors
set -gx EDITOR vim
set -gx VISUAL code

# homebrew
set -gx CFLAGS "-I/usr/local/include"
set -gx LDFLAGS "-L/usr/local/lib"

# nodenv
set -gx NODENV_ROOT /usr/local/var/nodenv

# rbenv & ruby-build
set -gx RBENV_ROOT /usr/local/var/rbenv
set -gx RUBY_CONFIGURE_OPTS --disable-install-doc

# rust
set -gx RUSTUP_HOME /usr/local/var/rustup
set -gx CARGO_HOME "$RUSTUP_HOME"
