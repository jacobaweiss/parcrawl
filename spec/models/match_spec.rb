require_relative '../spec_helper'

describe Match do
  let!(:match) { Factory(:match) }
  it { should have_many(:players).through(:match_players) }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
end