require_relative '../spec_helper'

describe Player do
  let!(:player) { Factory(:player) }
  
  it { should have_many(:matches).through(:match_players) }
  it { should validate_presence_of :username }
  it { should validate_uniqueness_of :username }
  
  describe "score methods" do
    let!(:score) { Factory(:score, :player => player, :score => 2) }
    let!(:penalty) { Factory(:penalty, :player => player, :strokes => 1) }
    let!(:match) { Factory(:match) }
    let!(:hole) { Factory(:hole, :par => 7, :match => match) }
    
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
end