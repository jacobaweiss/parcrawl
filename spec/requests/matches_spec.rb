require_relative '../spec_helper'

describe "Matches" do
  let!(:match) { Factory(:match, :name => 'BGA National') }
  
  describe "new match" do
    before { visit "/" }
    it "should have a new game form" do
      page.should have_content('Match Name')
    end
  
    it "should list most recent matches" do
      page.should have_content('BGA National')
    end
  end

  describe "when creating a match" do
    before do
      visit root_path
      fill_in 'Name', :with => "Bar Excellence"
      click_button 'Tee Off'
    end
  
    it "should redirect to the match page" do
      page.should have_content('Bar Excellence')
    end
  end
  
  describe "Viewing a match show page" do
    it "links to holes" do
      hole = Factory(:hole, :match => match, :hole_number => 2, :name => 'Grady Pub')

      visit "/matches/#{match.slug}"

      page.should have_link('Grady Pub', :href => "/matches/#{match.slug}/holes/#{hole.slug}")
    end
  end
end