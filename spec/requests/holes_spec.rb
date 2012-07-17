require_relative '../spec_helper'

describe "Holes Views" do
  
  describe "When trying to create a new hole" do
    let!(:match) { Factory(:match) }
    before { visit "/matches/#{match.slug}" }
    
    it "should create a valid hole" do
      fill_in 'Bar Name', :with => "Bluth Banana Stand"
      select "1", :from => 'Hole Number'
      fill_in 'Name of Drink', :with => "Afternoon Delight"
      select "1", :from => 'Par'
      click_button('Add Hole')
      page.should have_content('Bluth Banana Stand')
    end
    
    it "should not create invalid hole" do
      fill_in 'Bar Name', :with => ""
      click_button('Add Hole')
      page.should have_content("This hole could not be created at this time.")
    end
  end

  describe "show page" do
    let!(:match) { Factory(:match) }
    let!(:player1) { Factory(:player, :match => match) }
    let!(:player2) { Factory(:player, :username => "Jerry", :match => match) }
    let!(:hole) { Factory(:hole, :hole_number => 4, :match => match) }
    let!(:score) { Factory(:score, :player => player1, :hole => hole) }
    
    it "should display players scores for the hole" do
      visit "/matches/#{hole.match.slug}/holes/#{hole.id}"

      page.should have_content("#{player1.username}")
      page.should have_content("N/A")
    end
  end

end