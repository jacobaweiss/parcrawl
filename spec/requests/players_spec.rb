require_relative '../spec_helper'

describe "Players" do
  let!(:match) { Factory(:match) }
  
  it "can be created on the match page" do
    visit match_path(match)
    fill_in 'Player', :with => 'Walter Sobchak'
    click_button 'Join the Match'
    page.should have_content('Walter Sobchak')
  end
end