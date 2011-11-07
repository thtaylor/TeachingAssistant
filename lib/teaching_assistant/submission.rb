#!/usr/local/bin/ruby
require 'open3'


class Submission
  attr_accessor :student, :lab, :filename, :worth, :score

  def initialize(student, lab_number, options = {})
    @student = student
    @lab = lab_number
    @filename = "submissions/#{@student}/lab#{@lab}/"
    @worth = options[:total_points] || options[:worth] || options[:points] || 100
  end

  def compile!
    line = ""
    stdin, stdout, stderr = Open3.popen3('make', chdir: @filename) 
    while line = stderr.gets
      return false if line
    end   
    [stdin, stdout, stderr].each { |io| io.close }
    true
  end

  def evaluate!
    @score = "100%"
  end
end
