FactoryBot.define do
  factory :vehicle do
    sequence(:vin) { |n| "1HGBH41JXMN10918#{n}" }
    mileage { rand(10_000..300_000) }
    plate_state 'CO'
  end
end
