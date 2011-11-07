#!/usr/local/bin/ruby
require 'open3'


class Submission
  attr_accessor :student, :lab, :filename, :worth, :score, :reasons

  def initialize(student, lab, options = {})
    @student = student
    @lab = lab
    @filename = "submissions/#{@student}/#{@lab}/"
    @worth = options[:total_points] || options[:worth] || options[:points] || 100
    @score = nil
  end

  def compile!
    line = ""
    stdin, stdout, stderr = Open3.popen3('make', chdir: @filename) 
    while line = stderr.gets
      if line
        @score = "0%"
        @reasons = "Failed to compile."
        return false
      end
    end   
    [stdin, stdout, stderr].each { |io| io.close }
    true
  end

  def evaluate!(options = {})
    return "0%" if @score

    return grade_with_script(options[:with]) if options[:with]

    correct_output = File.read("solutions/#{@lab}/#{@lab}.out")
    lab = @lab
    lab += ".#{options[:extension]}" if options[:extension]
    stdin, stdout, stderr = Open3.popen3(lab, chdir: @filename)
    out, output = '', ''
    output << out while out = stdout.gets
    stdin.close; stdout.close; stderr.close;
    return @score = "100%" if output == correct_output
    @score = "0%"
  end

  def grade_with_script(script)
    output = `#{script} #{@filename}`
    return @score = "100%" if $?.to_i == 0
    @score = "0%"
  end
end
