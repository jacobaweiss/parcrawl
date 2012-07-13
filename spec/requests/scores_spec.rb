require_relative '../spec_helper'

describe "Scores" do
  let!(:match) { Factory(:match, :password => "cornballer") }
  let!(:hole) { Factory(:hole, :hole_number => 1, :match => match) }
  let!(:player) { Factory(:player, :match => match) }
  
  describe "creating a score" do
    
    describe "that should get saved" do    
      context "when logged in" do
        before do
          visit "/matches/#{match.slug}/login"
          fill_in 'Password', :with => "cornballer"
          click_button('Log in')
        end
      
        it "should add the score" do
          visit "/matches/#{match.slug}/holes/#{hole.slug}"
          select "#{player.username}", :from => "Player"
          fill_in 'Strokes', :with => 3
          click_button('Add to Score')
          visit "/matches/#{match.slug}/holes/#{hole.slug}"
          page.should_not have_content("N/A")
        end
      end
    
      context "when not logged in" do
        it "should not add the score" do
          visit "/matches/#{match.slug}/holes/#{hole.slug}"
          select "#{player.username}", :from => "Player"
          fill_in 'Strokes', :with => 3
          click_button('Add to Score')
          page.should have_content("Please sign in with the match password to access this")
        end
      end
    end
    
    describe "that should not be saved" do
      before do
        visit "/matches/#{match.slug}/login"
        fill_in 'Password', :with => "cornballer"
        click_button('Log in')
      end
      
      it "should return an error flash" do
        visit "/matches/#{match.slug}/holes/#{hole.slug}"
        select "#{player.username}", :from => "Player"
        fill_in 'Strokes', :with => ''
        click_button('Add to Score')
        page.should have_content("Your score couldn't be saved")
      end
    end
    
  end
  
end