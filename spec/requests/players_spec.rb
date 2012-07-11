require_relative '../spec_helper'

describe "Players" do
  let!(:match) { Factory(:match) }
  before(:each) do
    cookies[:players_match] = "#{match.slug}"
  end
  
  describe "When creating a player" do
    before do
      visit match_path(match)
      fill_in 'Username', :with => 'Walter Sobchak'
      click_button 'Join the Match'
    end
    
    it "can be created on the match page" do
      page.should have_content('Walter Sobchak')
    end
    
    it "sets a link to 'your match' after a player joins" do
      visit "/"
      
      page.should have_content('Your Match')
    end
  end
  
end