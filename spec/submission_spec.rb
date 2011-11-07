require File.join(File.dirname(__FILE__), '../src/submission.rb')

describe Submission do
  describe "#compile!" do
    it "returns true if there are no compile errors" do
      submission = Submission.new('thtaylor', 1)
      prior_count = Dir[submission.filename+'*'].count
      submission.compile!.should == true
      Dir[submission.filename+'*'].count.should have_at_least(prior_count).items
    end
  end

  describe "#evaluate!" do
    it "should return the grade the student received on the project" do
      submission = Submission.new('thtaylor', 1)
      submission.compile!
      submission.evaluate!.should eq("100%")
      submission.evaluate!
    end
  end
end  
