require_relative '../spec_helper'

describe "errors" do
  
  describe "record not found" do
    it "should return the 404 page" do
      visit "/matches/banana-stand"
      page.should have_content("What's the officer, problem?")
    end
  end
  
  describe "unknown action in controller" do
    it "should return the 404 page" do
      visit "/pages/farts"
      page.should have_content("What's the officer, problem?")
    end
  end
  
end