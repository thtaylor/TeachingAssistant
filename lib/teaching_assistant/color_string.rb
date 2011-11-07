#!/usr/local/bin/ruby

# This class allows for colorization of strings by extending the string class
# Please NOTE this only works on *nix style platforms due to the nature of
# the colorization that is taking place
class String

  COLORS = {
    :orange       => "\e[1m\e[31m",
    :dark_orange  => "\e[0m\e[31m",
    :light_green  => "\e[1m\e[32m",
    :green        => "\e[32m",
    :yellow       => "\e[1m\e[33m",
    :brown        => "\e[0m\e[33m",
    :light_blue   => "\e[1m\e[34m",
    :blue         => "\e[34m",
    :purple       => "\e[0m\e[35m",
    :light_purple => "\e[1m\e35m",
    :cyan         => "\e[0m\e36m"
  }

  # Strictly a private method.  Handles the colorization of the text by appending the start and stop
  # escape characters on the string
  def colorize!(color_code) "#{COLORS[color_code]}#{self.to_s}\e[0m" ; end
end

