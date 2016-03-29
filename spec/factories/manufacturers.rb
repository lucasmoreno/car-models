FactoryGirl.define do
  sequence :name do |n|
    "manufacturer #{n}"
  end

  sequence :webmotors_id do |n|
    n
  end

  factory :manufacturer do
    name
    webmotors_id
  end
end
