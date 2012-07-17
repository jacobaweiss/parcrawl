require_relative '../spec_helper'

describe "Holes Views" do
  
  describe "When trying to create a new hole" do
    let!(:match) { Factory(:match) }
    before { visit "/matches/#{match.slug}" }
    
    it "should be able to add a new hole through the match page" do
      fill_in 'Bar Name', :with => "Duffeys"
      select '1', :from => 'Hole Number'
      fill_in 'Name of Drink', :with => "Shot of Vodka"
      select '1', :from => 'Par'
      click_button('Add Hole')
      page.should have_content('Duffeys')
    end
    
    it "should not create invalid hole" do
      fill_in 'Bar Name', :with => ""
      click_button('Add Hole')
      page.should have_content("This hole could not be created at this time.")
    end
  end

end