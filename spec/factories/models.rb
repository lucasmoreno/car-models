FactoryGirl.define do
  sequence :model_name do |n|
    "model #{n}"
  end

  factory :model do
    name { generate :model_name }
    manufacturer
  end
end
