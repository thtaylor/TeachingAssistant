#!/usr/local/bin/ruby

class Student
  attr_accessor :first_name, :last_name, :username
  def initialize(user, options ={})
    @first_name = options[:firstname]
    @last_name = options[:lastname]
    @username = user
  end

  def to_s
    "#{@last_name}, #{@first_name}"
  end
end
