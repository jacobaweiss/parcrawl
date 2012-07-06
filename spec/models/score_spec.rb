require_relative '../spec_helper'

describe Score do
  it { should belong_to(:player) }
  it { should belong_to(:hole) }
  it { should validate_presence_of(:score) }
  it { should validate_numericality_of(:score) }
end
