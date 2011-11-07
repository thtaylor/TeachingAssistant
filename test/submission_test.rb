require_relative 'test_helper'

class SubmissionTest < Test::Unit::TestCase
  def test_true
    assert true
  end

  def test_compile
    submission = Submission.new('student01', 'lab1')
    prior_count = Dir[submission.filename+'*'].count
    assert submission.compile! == true
    assert Dir[submission.filename+'*'].count >= prior_count
  end

end
