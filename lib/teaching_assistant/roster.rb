#!/usr/local/bin/ruby

require 'nokogiri'
require 'teaching_assistant/student'

class Roster
  attr_accessor :students
  DEFAULT_ROSTER = "roster.xml"

  def initialize(path = DEFAULT_ROSTER)
    @students = []
    doc = Nokogiri::XML File.open(path)
    doc.xpath("//student").each do |s|
      @students << Student.new(s.children[5].text, :lastname => s.children[3].text, :firstname => s.children[1].text) unless s.children[5].text.nil? || s.children[5].text.empty?
    end
    raise InvalidRosterFileException if @students.size == 0
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
