require 'spec_helper'
require 'teaching_assistant'

describe Roster do

  describe "find" do
    context "When there is is no roster file," do
      it "should return nil" do
        roster = Roster.find
        roster.should be_nil
      end
    end

    context "When there is a default roster file," do
      before { File.new("roster.yaml", 'w').close }
      after  { File.delete("roster.yaml") }
      it "should return the path to the directory's roster file." do
        roster = Roster.find
        roster.should eq "roster.yaml"
      end
    end

    context "When there is a roster file, but not in the default location" do
      before { File.new("./submissions/roster.yaml", 'w').close }
      after  { File.delete("./submissions/roster.yaml") }
      it "should return the path to the directory's roster file." do
        roster = Roster.find
        roster.should eq "./submissions/roster.yaml"
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
      before { File.rename("roster.hidden.yaml", "roster.yaml") }
      after  { File.rename("roster.yaml", "roster.hidden.yaml") }
      it "should return a valid Roster object" do
        roster = Roster.new(Roster.find)
        roster.students.size.should eq(5)
        roster.students.each {|s| s.username.should_not be_nil }
      end
    end
  end
end
