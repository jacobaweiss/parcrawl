require_relative '../spec_helper'

describe Player do
  let!(:player) { Factory(:player) }
  
  it { should have_many(:matches).through(:match_players) }
  it { should validate_presence_of :username }
  it { should validate_uniqueness_of :username }
end