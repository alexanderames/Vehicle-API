class Vehicle < ApplicationRecord
  validates :vin, presence: true, uniqueness: true
  validates :mileage, presence: true

  scope :recent, -> { order(created_at: :desc) }
end
