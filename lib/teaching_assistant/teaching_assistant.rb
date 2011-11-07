require 'teaching_assistant/submission_set'

class TeachingAssistant
  
  def self.grade!(lab, options = {})
    result_set = SubmissionSet.new
    Dir['submissions/*'].each do |path|
      next if File.basename(path)[0] == ?.
      student = File.basename(path)
      sub = Submission.new(student, lab.to_s)
      sub.compile! unless options[:no_compile]
      sub.evaluate! options
      result_set << sub
    end
    result_set
  end
end
