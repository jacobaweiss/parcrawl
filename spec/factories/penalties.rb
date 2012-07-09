FactoryGirl.define do
  factory :penalty do
    player { Factory(:player) }
    offense 'Rustled the jimmies of the bartender'
    strokes 4
  end
end
