#!/usr/bin/env ruby

# Allows files to be required from the ~/dotfiles/ruby/ directory.
#  note: currently not requiring local files!
$LOAD_PATH << File.dirname(File.realpath(__FILE__))

begin
  require "awesome_print"
  AwesomePrint.pry!

  # Prompt configuration
  RUBY_STRING = "#{RUBY_ENGINE}-#{RUBY_VERSION}".freeze
  Pry.prompt = [
    lambda do |obj, level, _pry|
      "#{RUBY_STRING.redish} (#{obj}):#{level} #{'❯'.green} "
    end,
    lambda do |obj, level, _pry|
      "#{RUBY_STRING.redish} (#{obj}):#{level} #{'*'.green} "
    end,
  ]
rescue LoadError
  puts "gem install awesome_print # <-- highly recommended"
end

# List config
Pry.config.ls.heading_color = :magenta
Pry.config.ls.public_method_color = :green
Pry.config.ls.protected_method_color = :yellow
Pry.config.ls.private_method_color = :red

# Array and Hash ::toy functions
class Array
  def self.toy(n = 10, &block)
    block_given? ? Array.new(n, &block) : Array.new(n) { |i| i + 1 }
  end
end

class Hash
  def self.toy(n = 10, &block)
    array = block_given? ? Array.toy(n, &block) : Array.toy(n) { |c| (96 + (c + 1)).chr }
    Hash[Array.toy(n).zip(array)]
  end
end
