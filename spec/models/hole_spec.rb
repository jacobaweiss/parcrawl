require_relative '../spec_helper'

describe Hole do
  it { should validate_presence_of :name }
end
