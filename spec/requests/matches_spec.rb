require_relative '../spec_helper'

describe "new match" do
  it "should have a new game form" do
    visit root_path
    page.should have_content('Match Name')
  end
end

describe "when creating a match" do
  it "should redirect to the match page" do
    visit root_path
    fill_in 'Name', :with => "Bar Excellence"
    click_button 'Tee Off'
    page.should have_content('Bar Excellence')
  end
end