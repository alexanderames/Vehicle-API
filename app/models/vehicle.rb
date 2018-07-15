class Vehicle < ApplicationRecord
  validates :vin, presence: true, uniqueness: true
  validates :mileage, presence: true

  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }
end
