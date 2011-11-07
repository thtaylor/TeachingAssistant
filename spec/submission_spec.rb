require 'spec_helper'
require 'teaching_assistant'

describe Submission do
  describe "cleanup!" do
    it "cleans up executable files in the given student/lab directory" do
      Submission.cleanup!('student01', 'lab1')
      count = 0
      Dir['submissions/student01/lab1/*'].each {|f| count += 1 if File.executable?(f) }
      count.should eq(0)
    end
  end

  describe "#compile!" do
    context "When the code compiles" do
      before { Submission.cleanup!('student01', 'lab1') }
      after  { Submission.cleanup!('student01', 'lab1') }
      it "returns true if there are no compile errors" do
        submission = Submission.new('student01', 'lab1')
        prior_count = Dir[submission.filename+'*'].count
        submission.compile!.should == true
        Dir[submission.filename+'*'].count.should have_at_least(prior_count).items
      end
    end
 
    context "When the code doesn't compile" do
      it "should return false, set 0% for the score, and have reasons set to 'Failed to compile'" do
        submission = Submission.new('student02', 'lab1')
        submission.compile!.should == false
        submission.score.should == "0%"
        submission.reasons.should eq("Failed to compile.")
      end
    end
  end

  describe "#evaluate!" do
    context "When the code compiles" do
      before { Submission.cleanup!('student01', 'lab1') }
      after  { Submission.cleanup!('student01', 'lab1') }
      it "should return the grade the student received on the project" do
        submission = Submission.new('student01', 'lab1')
        submission.compile!
        submission.evaluate!(:extension => 'exe').should eq("100%")
        submission.evaluate!(:extension => 'exe')
      end
    end

    context "When a script is provided for the grading of a lab" do
      before { Submission.cleanup!('student01', 'lab2') }
      after  { Submission.cleanup!('student01', 'lab2') }
      it "that script provides the grade for the lab." do
        submission = Submission.new('student01', 'lab2')
        submission.compile!
        submission.evaluate!(:with => 'solutions/lab2/lab2.grader', :extension => 'exe').should eq("100%")
      end
    end
  end
end  
