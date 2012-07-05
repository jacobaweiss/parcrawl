require_relative '../spec_helper'

describe Hole do
  let!(:match) { Factory(:match, :holes => [Factory(:hole)]) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :slug }
  it { should belong_to :match }
  
  
  describe "hole name" do
    it "should be valid with letters, numbers, and spaces" do
      @hole = Factory.build(:hole, :name => "cha cha 5")
      @hole.valid?.should == true
    end

    it "should be invalid if it ends in a space" do
      @hole = Factory.build(:hole, :name => "cha cha ")
      @hole.valid?.should == false
    end
    
    it "should be invalid with special characters" do
      @hole = Factory.build(:hole, :name => "/matches/")
      @hole.valid?.should == false
    end
    
    it "should be invalid if not unique to match" do
      @hole = Factory.build(:hole, :match => match)
      @hole.valid?.should == false
    end
    
    it "should be valid if it is unique to match" do
      @hole = Factory.build(:hole, :match => Factory(:match, :name => "Campus Golf"))
      @hole.valid?.should == true
    end
  end
end
