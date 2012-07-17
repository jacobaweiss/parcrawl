require_relative '../spec_helper'

describe "Penalties Pages" do
  
  describe "the match page" do
    let!(:player) { Factory(:player) }
    let!(:match) { Factory(:match, :players => [player]) }
    let!(:penalty) { Factory(:penalty, :player => player) }
    before { visit "/matches/#{match.id}" }
    
    it "should show penalties of its players" do
      page.should have_content('Rustled the jimmies of the bartender')
    end
    
    describe "when adding a penalty" do
      before do
        select "#{player.username}", :from => 'penalty_player_id'
      end
    
      it "should allow a player to add a penalty" do
        fill_in 'Offense', :with => 'Mentioned PHP'
        fill_in 'penalty_strokes', :with => '3'

        click_button 'Add Penalty'
      
        page.should have_content('Mentioned PHP')
      end
    
      it "should redirect to match page when penalty is invalid" do
        fill_in 'Offense', :with => 'Broke the app'
        fill_in 'penalty_strokes', :with => "her?"
        
        click_button 'Add Penalty'
        
        page.should have_content("Something went wrong when trying to add this penalty; please try again.")
      end
    end
  end
  
end