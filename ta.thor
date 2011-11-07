#!/usr/bin/env ruby

class TeachingAssistant < Thor::Group
  include Thor::Actions

  class_option :dirname, :default => '.' 

  def self.source_root
    File.realdirpath('.')
  end

  def create_file_structure
    empty_directory(options[:dirname])
    empty_directory(File.join(options[:dirname], "submissions"))
    empty_directory(File.join(options[:dirname], "solutions"))
  end

  def create_roster
    template "roster.hidden.yaml", "#{options[:dirname]}/roster.yaml"
  end 
      
end
