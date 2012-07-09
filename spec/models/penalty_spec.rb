require_relative '../spec_helper'

describe Penalty do
  
  it { should belong_to(:player) }
  it { should validate_presence_of(:offense) }
  it { should validate_presence_of(:strokes) }
  it { should validate_numericality_of(:strokes) }
  
  it "should only accept positive values for strokes" do
    penalty = Factory.build(:penalty, :strokes => -1)
    penalty.valid?.should == false
  end
  
end
