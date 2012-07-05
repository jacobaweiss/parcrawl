require_relative '../spec_helper'

describe Hole do
  subject { Factory(:hole) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to(:match_id) }
  it { should validate_presence_of :slug }
  it { should belong_to :match }
end
