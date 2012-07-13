FactoryGirl.define do
  factory :score do
    score 4
    hole { Factory(:hole) }
    player { Factory(:player) }
  end
end
