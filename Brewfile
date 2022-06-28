# Usage: `brew bundle`

tap "homebrew/bundle"
tap "homebrew/core"

# core deps
brew "bash"
brew "bat"
brew "bfg"
brew "direnv"
brew "exa"
brew "fd"
brew "fish"
brew "gh"
brew "git"
brew "git-delta"
brew "git-filter-repo"
brew "git-lfs"
brew "hr"
brew "htop"
brew "httpie"
brew "jq"
brew "less"
brew "shellcheck"
brew "shfmt"
brew "starship"
brew "stow"
brew "the_silver_searcher"
brew "thefuck"
brew "tree"
brew "wget"
brew "xz"
brew "yq"
brew "zsh"

# don't install these in a GitHub Codespace
unless ENV["CODESPACES"]
  tap "nodenv/nodenv"

  brew "nodenv"
  brew "pyenv"
  brew "rbenv"
  brew "readline"

  brew "nodenv/nodenv/node-build-update-defs"
  brew "nodenv/nodenv/nodenv-aliases"
  brew "nodenv/nodenv/nodenv-default-packages"
  brew "nodenv/nodenv/nodenv-each"
end

# macOS specifics
if RUBY_PLATFORM.include?('darwin')
  tap "homebrew/cask"
  tap "homebrew/cask-fonts"
  tap "homebrew/services"
  tap "teamookla/speedtest"

  brew "mas"
  brew "p7zip"
  brew "rename"
  brew "svn"
  brew "wifi-password"
  brew "teamookla/speedtest/speedtest"

  # Install Applications
  cask "1password"
  cask "1password-cli"
  cask "aerial"
  cask "alfred"
  cask "appcleaner"
  cask "balenaetcher"
  cask "bartender"
  cask "choosy"
  cask "contexts"
  cask "discord"
  cask "displaperture"
  cask "firefox"
  cask "google-chrome"
  cask "gpg-suite-no-mail"
  cask "iterm2"
  cask "keyboard-cleaner"
  cask "ngrok"
  cask "postico"
  cask "postman"
  cask "rectangle"
  cask "scroll-reverser"
  cask "slack"
  cask "spotify"
  cask "visual-studio-code"
  cask "vlc"
  cask "xquartz"

  # Music
  # cask "kid3"
  # cask "xld"

  # Fonts
  cask "font-fira-code"
  cask "font-fira-code-nerd-font"
  cask "font-hasklig"
  cask "font-source-code-pro"
  cask "font-source-sans-pro"
  cask "font-source-serif-pro"

  # Install Mac App Store Applications
  mas "1Password for Safari", id: 1569813296
  mas "AdGuard for Safari", id: 1440147259
  mas "Amphetamine", id: 937984704
  mas "Hush", id: 1544743900
  mas "Keynote", id: 409183694
  mas "Keyword Search", id: 1558453954
  mas "Numbers", id: 409203825
  mas "Pages", id: 409201541
  mas "Spark", id: 1176895641
  mas "Speedtest", id: 1153157709
  mas "The Unarchiver", id: 425424353
end
