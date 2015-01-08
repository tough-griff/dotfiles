#!/usr/bin/env bash

source '/usr/local/share/chruby/chruby.sh'

chruby $@
echo $(ruby --version)

echo "=== Updating RubyGems"
gem update --system
echo

gems=(bundler git-up pry awesome_print)
for gem in ${gems[*]}; do
  if ! gem list -i $gem > /dev/null 2>&1; then
    echo "=== Installing $gem"
    gem install $gem
  else
    echo "=== Updating $gem"
    gem update $gem
  fi
  echo
done

gem clean
gem list
