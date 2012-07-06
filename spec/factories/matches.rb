FactoryGirl.define do
  factory :match do
    sequence :name do |n|
      "BGA National #{n}"
    end
    sequence :slug do |n|
      "bga-national-#{n}"
    end
  end
end
