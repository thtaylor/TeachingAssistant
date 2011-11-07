require 'teaching_assistant/submission'

class SubmissionSet
  attr_accessor :submissions

  def initialize()
    @submissions = []
  end

  def << (submission)
    @submissions << submission if submission.is_a?(Submission)
  end

  def each(&block)
    @submissions.each {|s| yield s }
  end
end
