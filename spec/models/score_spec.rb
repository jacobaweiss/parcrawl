require_relative '../spec_helper'

describe Score do
  it { should belong_to(:player) }
  it { should belong_to(:hole) }
  it { should validate_presence_of(:player_id) }
  it { should validate_presence_of(:score) }
  it { should validate_numericality_of(:score) }
  
  describe "checking uniqueness" do
    let!(:player) { Factory(:player) }
    let!(:score) { Factory(:score, :player => player, :hole_id => 1, :score => 2) }
    
    it "should not allow the same player to make a second score per hole" do
      score2 = Factory.build(:score, :player => player, :hole_id => 1, :score => 3)
      score2.valid?.should == false
    end
    
    #not a necessary test, just for my own peace of mind
    it "should allow other players to create scores on the same hole" do
      score2 = Factory.build(:score, :player_id => player.id.next, :hole_id => 1, :score => 3)
      score2.valid?.should == true
    end
    
    it "should allow a player to create scores on different holes" do
      score2 = Factory.build(:score, :player => player, :hole_id => 2, :score => 3)
      score2.valid?.should == true
    end
  end
  
end
