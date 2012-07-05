# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hole do
    sequence :name do  |n| 
      "The Green Leafe #{n}"
    end
    match { Factory(:match) }
  end
end
