require File.join(File.dirname(__FILE__), '../src/roster.rb')

describe Roster do

  describe "find" do
    context "When there is is no roster file," do
      it "should return nil" do
        roster = Roster.find
        roster.should be_nil
      end
    end

    context "When there is a default roster file," do
      before { File.new("roster.xml", 'w').close }
      after  { File.delete("roster.xml") }
      it "should return the path to the directory's roster file." do
        roster = Roster.find
        roster.should eq "roster.txt"
      end
    end

    context "When there is a roster file, but not in the default location" do
      before { File.new("./submissions/roster.xml", 'w').close }
      after  { File.delete("./submissions/roster.xml") }
      it "should return the path to the directory's roster file." do
        roster = Roster.find
        roster.should eq "./submissions/roster.txt"
      end
    end
  end

  describe "#new" do
    context "When there is an invalid roster file given" do
      it "should raise an exception" do
        begin
          roster = Roster.new("Gemfile")
        rescue InvalidRosterFileException
          roster.should be_nil
        end
      end
    end

    context "When there is a valid roster file given" do
      before { File.rename("roster.hidden.xml", "roster.xml") }
      after  { File.rename("roster.xml", "roster.hidden.xml") }
      it "should return a valid Roster object" do
        roster = Roster.new(Roster.find)
        roster.students.size.should eq(5)
      end
    end
  end
end
