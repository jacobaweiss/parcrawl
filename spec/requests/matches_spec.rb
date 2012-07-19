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
    
    context "without a password" do
      before do
        visit root_path
        fill_in 'Name', :with => "Bar Excellence"
        click_button('Tee Off')
      end

      it "should redirect to the match page" do
        page.should have_content('Bar Excellence')
      end
    end
    
    context "with a password" do
      before do
        visit root_path
        fill_in 'Name', :with => "Bar Excellence"
        fill_in 'Optional Password', :with => "foo"
        click_button('Tee Off')
      end

      it "should redirect to the match page" do
        page.should have_link('Your Match')
      end
    end
    
    context "with invalid information" do
      it "should return an error" do
        visit root_path
        fill_in 'Name', :with => ""
        fill_in 'Optional Password', :with => "drinks"
        click_button('Tee Off')
        page.should have_content('Your match could not be created at this time.')
      end
    end
  end
  
  describe "Viewing a match show page" do
    let!(:match2) { Factory(:match, :name => "magic", :slug => "magic", :password => "wonder") }
    
    context "when the requested match does not exist" do
      it "should return a 404 error" do
        
        #this test works in cli, not in-textmate-rspec ?
        visit "/matches/cornballer"

        page.should have_content("What's the officer, problem?")
      end
    end
    
    context "when the match is password protected and user logs in" do
      before do
        visit "/matches/#{match2.slug}/login"
        fill_in 'Password', :with => 'wonder'
        click_button('Log in')
      end
      
      it "signs user in" do
        page.should have_content('You now have access to this match!')
      end
      
      it "can join the match" do
        fill_in 'Username', :with => 'Franklin'
        click_button('Join the Match')
        page.should have_content('Franklin')
      end
    end
    
    context "when the match is password protected, but user is not logged in" do
      it "should not be able to join the match" do
        visit "/matches/#{match2.slug}"
        fill_in 'Username', :with => 'Franklin'
        click_button('Join the Match')
        page.should have_content('Please sign in with the match password to access this')
      end
    end
    
  end
end