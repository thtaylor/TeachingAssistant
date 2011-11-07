#!/usr/local/bin/ruby

class Roster

  DEFAULT_ROSTER = "roster.xml"

  def initialize(path = DEFAULT_ROSTER)
    raise InvalidRosterFileException
  end 

  def self.find
    return DEFAULT_ROSTER if File.exists?(DEFAULT_ROSTER)
    require 'find'
    Find.find('.') do |path|
      if path.include? DEFAULT_ROSTER
        return path
      end
    end
    nil
  end

end

class InvalidRosterFileException < RuntimeError
end
