require 'spec_helper'
require 'teaching_assistant'

describe TeachingAssistant do
  describe "grading" do
    context "With only the lab name given" do
      it "should grade the submissions for the given lab" do
        result_set = TeachingAssistant.grade!(:lab1, :extension => 'exe')
        result_set.each do |submission|
          submission.score.should eq("100%") unless submission.student == 'student02'
        end
      end
    end

    context "When the :with option is specified," do
      it "that script is used to grade all submissions." do
        result_set = TeachingAssistant.grade! :lab2, :with => 'solutions/lab2/lab2.grader'
      end
    end
  end
end
