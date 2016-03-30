FactoryGirl.define do
  sequence :manufacturer_name do |n|
    "manufacturer #{n}"
  end

  sequence :webmotors_id do |n|
    n
  end

  factory :manufacturer do
    name { generate :manufacturer_name }
    webmotors_id
  end
end
