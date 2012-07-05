require_relative '../spec_helper'

describe "new match" do
  let!(:match) { Factory(:match) }
  before { visit root_path }
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