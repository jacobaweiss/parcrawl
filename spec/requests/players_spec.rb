require_relative '../spec_helper'

describe "Players" do
  let!(:match) { Factory(:match) }
  before(:each) do
    cookies[:players_match] = "#{match.slug}"
  end
  
  describe "When creating a player" do
    let!(:match2) { Factory(:match, :password => "foobar") }
    
    context "in a public match" do
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
    
    context "in a protected match, when not logged in" do
      context "with valid player info" do
        it "should create the player" do
          visit "/matches/#{match2.slug}"
          fill_in 'Username', :with => "Walter Sobchak"
          click_button('Join the Match')
          fill_in 'Password', :with => 'foobar'
          click_button('Log in')
          page.should have_content('Walter Sobchak')
        end
      end
      
      context "with invalid player info" do
        it "should throw an error and redirect to match" do
          visit "/matches/#{match2.slug}"
          fill_in 'Username', :with => "Walter Sobchak"
          click_button('Join the Match')
          fill_in 'Password', :with => 'ethos'
          click_button('Log in')
          page.should have_content('The password you entered was incorrect.')
        end
      end
    end
    
    context "in a protected match, when logged in" do
      before do
        visit "/matches/#{match2.slug}/login"
        fill_in 'Password', :with => 'foobar'
        click_button('Log in')
      end
      
      context "with valid player info" do
        it "should create the player" do
          fill_in 'Username', :with => 'Tobias'
          click_button('Join the Match')
          page.should have_content('Tobias')
        end
      end
      
      context "with invalid player info" do
        it "should flash an error and redirect" do
          fill_in 'Username', :with => ''
          click_button('Join the Match')
          page.should have_content('We were unable to add you to the match at this time.')
        end
      end
    end
  end
  
  describe "show page" do
    let!(:player) { Factory(:player, :match => match) }
    let!(:penalty) { Factory(:penalty, :player => player, :offense => "test 1", :created_at => 3.minutes.ago)}
    let!(:penalty) { Factory(:penalty, :player => player, :offense => "test 2", :created_at => 2.minutes.ago)}
    let!(:penalty) { Factory(:penalty, :player => player, :offense => "test 3", :created_at => 1.minutes.ago)}

    it "should show penalties in reverse chronological order" do
      visit "/matches/#{match.slug}/players/#{player.id}"
      player.penalties.first.offense.should == "test 3"
    end
  end
end