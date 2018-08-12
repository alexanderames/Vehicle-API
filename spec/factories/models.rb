FactoryBot.define do
  factory :model do
    name 'Outback'
    association :make
    association :vehicle
  end
end
