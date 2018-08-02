class Make < ApplicationRecord
  belongs_to :vehicle
  belongs_to :user

  validates :name, presence: true
end
