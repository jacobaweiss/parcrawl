require_relative '../spec_helper'

describe "Holes Views" do
  
  describe "When trying to create a new hole" do
    let!(:match) { Factory(:match) }
    it "should be able to add a new hole through the match page" do
      visit match_path(match)
      click_link('Add a hole')
      fill_in 'Bar Name', :with => "Duffeys"
      click_button('Add Hole')
      visit match_path(match)
      page.should have_content('Duffeys')
    end
    
    it "should not create invalid hole" do
      visit new_match_hole_path(match)
      fill_in 'Bar Name', :with => ""
      click_button('Add Hole')
      page.should have_content("This hole could not be created at this time.")
    end
  end

end