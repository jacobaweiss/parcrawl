require_relative '../spec_helper'

describe "new match" do
  it "should have a new game form" do
    visit root_path
    page.should have_content('Match Name')
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
  
  it "should generate a valid match url" do
    visit "#{root_url}Bar_Excellence"
    page.should have_content('Bar Excellence')
  end
end