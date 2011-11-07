#!/usr/local/bin/ruby

require 'yaml'
require 'teaching_assistant/student'

class Roster
  attr_accessor :students
  DEFAULT_ROSTER = "roster.yaml"


  # Creates a new roster object
  # Reads in the roster file from the filename given and generates students for each 'student'
  # found in the roster file.
  # 
  # If an invalid roster file is given, it raises InvalidRosterFileException
  def initialize(path = DEFAULT_ROSTER)
    @students = []
    begin
      list = YAML::load(File.read(path))
    rescue
      raise InvalidRosterFileException, "Couldn't parse YAML"
    end
    list.each_pair do |username, data|
      @students << Student.new(username, :lastname => data['lastname'], :firstname => data['firstname']) unless username.nil?
    end
    raise InvalidRosterFileException if @students.size == 0
  end 


  # Finds a roster file in the given directory.  Default is '.'
  # Assumes, by default, that the roster name is 'roster.yaml'
  def self.find(dir = '.', filepath = DEFAULT_ROSTER)
    return filepath if File.exists?(filepath)
    require 'find'
    Find.find(dir) do |path|
      if path.include? filepath
        return path
      end
    end
    nil
  end

end

class InvalidRosterFileException < RuntimeError
end
