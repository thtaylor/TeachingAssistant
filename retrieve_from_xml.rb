#!/usr/local/bin/ruby

require 'nokogiri'

doc = Nokogiri::XML(File.open("roster.hidden.xml"))

doc.xpath("//student").each do |s|
  firstname = s.children[1].text
  lastname = s.children[3].text
  puts "#{lastname}, #{firstname}"
end
