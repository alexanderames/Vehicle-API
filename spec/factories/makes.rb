FactoryBot.define do
  factory :make do
    name "Subaru"
    association :vehicle
    association :user
  end
end
