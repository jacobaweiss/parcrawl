FactoryGirl.define do
  factory :hole do
    sequence :name do  |n| 
      "The Green Leafe #{n}"
    end
    
    sequence :hole_number do |n|
      n
    end
    
    drink "Pint o' Beer"
    par 4
    
    match { Factory(:match) }
  end
end
