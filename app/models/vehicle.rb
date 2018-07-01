class Vehicle < ApplicationRecord
  validates :vin, presence: true, uniqueness: true
  validates :mileage, presence: true
  validates :plate_state, presence: true
end
