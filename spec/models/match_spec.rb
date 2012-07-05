require_relative '../spec_helper'

describe Match do
  let!(:match) { Factory(:match) }
  it { should have_many(:players).through(:match_players) }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  
  describe "match name" do
    it "should be valid with letters, numbers, and spaces" do
      @match = Factory.build(:match, :name => "cha cha 5")
      @match.valid?.should == true
    end

    it "should be invalid if it ends in a space" do
      @match = Factory.build(:match, :name => "cha cha ")
      @match.valid?.should == false
    end
    
    it "should be invalid with special characters" do
      @match = Factory.build(:match, :name => "/matches/")
      @match.valid?.should == false
    end
  end
  
end