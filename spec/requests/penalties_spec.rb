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
    
    it "should allow a player to add a penalty" do
      click_link('Add a Penalty')

      select "#{player.username}", :from => 'Player'
      fill_in 'Offense', :with => 'Mentioned PHP'
      fill_in 'Strokes', :with => '3'

      click_button 'Add Penalty'

      page.should have_content('Mentioned PHP')
    end
  end
  
end