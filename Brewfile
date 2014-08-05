# Install command-line tools using Homebrew
# Usage: `brew bundle Brewfile`

# Make sure we're using the latest Homebrew, and upgrade any existing formulae
update
upgrade

# Install GNU core utilities
# Add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils
install moreutils
install findutils
install gnu-sed --default-names

# Install new Bash and Zsh
install bash
install zsh

# Install more recent versions of some OS X tools
install vim --override-system-vi
install homebrew/dupes/grep

# Install other useful binaries
install ack
install fasd
install git
install hr
install httpie
install hub
install lynx
install node
install p7zip
install pigz
install pv
install python
install python3
install rename
install the_silver_searcher
install tree
install webkit2png
install wget --enable-iri
install xz

# Install less useful but fun binaries
install cmatrix
install cowsay
install figlet
install fortune

# Remove outdated versions from the cellar
cleanup
