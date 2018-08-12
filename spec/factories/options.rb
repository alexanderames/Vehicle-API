FactoryBot.define do
  factory :option do
    seats { rand(2..6) }
    transmission "MyString"
    drivetrain "MyString"
    fuel_type "MyString"
    style "MyString"
    color "MyString"
    association :vehicle
  end
end
