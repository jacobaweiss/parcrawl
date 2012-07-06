require_relative '../spec_helper'

describe Hole do
  subject { Factory(:hole) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to(:match_id) }
  it { should validate_presence_of :slug }
  it { should belong_to :match }
  it { should validate_presence_of(:hole_number) }
  it { should validate_uniqueness_of(:hole_number).scoped_to(:match_id) }
  it { should validate_presence_of(:par) }
  it { should validate_presence_of(:drink) }
  
  describe "when par is out of range" do
    it "should be invalid" do
      hole = Factory.build(:hole, :name => "Special Lady Friend", :par => 10)
      hole.valid?.should == false
    end
  end
  
  describe "when hole number" do
    it "is out of range, should be invalid" do
      hole = Factory.build(:hole, :hole_number => 10)
      hole.valid?.should == false
    end
    
    it "is already taken, should be invalid" do
      match = Factory.build(:match)
      hole = Factory.build(:hole, :hole_number => 1, :match => match)
      hole.save
      hole2 = Factory.build(:hole, :hole_number => 1, :match => match)
      hole2.valid?.should == false
    end
  end
end
