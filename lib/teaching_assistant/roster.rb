#!/usr/local/bin/ruby

require 'nokogiri'
require 'teaching_assistant/student'

class Roster
  attr_accessor :students
  DEFAULT_ROSTER = "roster.xml"


  # Creates a new roster object
  # Reads in the roster file from the filename given and generates students for each 'student'
  # found in the roster file.
  # 
  # The default format is XML, but a roster can also be specified in YAML
  # If an invalid roster file is given, it raises InvalidRosterFileException
  def initialize(path = DEFAULT_ROSTER)
    @students = []
    doc = Nokogiri::XML File.open(path)
    doc.xpath("//student").each do |s|
      @students << Student.new(s.children[5].text, :lastname => s.children[3].text, :firstname => s.children[1].text) unless s.children[5].text.nil? || s.children[5].text.empty?
    end
    raise InvalidRosterFileException if @students.size == 0
  end 


  # Finds a roster file in the given directory.  Default is '.'
  # Assumes, by default, that the roster name is 'roster.xml'
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
