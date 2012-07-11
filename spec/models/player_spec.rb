require_relative '../spec_helper'

describe Player do
  let!(:player) { Factory(:player) }
  let!(:match) { Factory(:match, :players => [player]) }
  
  it { should validate_presence_of :username }
  it { should belong_to(:match)}
  
  describe "score methods" do
    let!(:score) { Factory(:score, :player => player, :score => 2) }
    let!(:penalty) { Factory(:penalty, :player => player, :strokes => 1) }
    let!(:hole) { Factory(:hole, :par => 7, :hole_number => 3, :match => match) }
    
    it "should display the correct match score" do
      player.match_score.should == 3
    end
    
    it "should display correct match score relative to match par" do
      player.match_score_relative_to_par(match).should == -4
    end
    
    it "should correctly assert over or under par" do
      player.over_or_under_par?(match).should == 'under-par'
    end
  end
  
  describe "when joining a match" do
    
    context "if name is already taken within match" do
      
      it "should be invalid" do
        invalid_player = Factory.build(:player, :match => match)
        invalid_player.valid?.should == false
      end
    end
    
    context "if name exists in a different match" do
      
      it "should be valid" do
        match_2 = Factory.build(:match)
        invalid_player = Factory.build(:player, :match => match_2 )
        invalid_player.valid?.should == true
      end
    end
  end
  
end