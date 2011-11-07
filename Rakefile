PROJECT_ROOT="/home/thtaylor/ruby_archives/grader/"

desc "Run all specs in the specs/ directory ("
task :rspec do
  Dir['./specs/*_spec.rb'].each do |spec|
    puts `rspec #{spec} --color`
  end
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :file do
  namespace :structure do
    task :create do
      Dir.mkdir("submissions", 755)
      if @roster.exists?
        Dir.chdir("submissions") do
          
        end
      end
    end

    task :destroy do
    end
  end
end
