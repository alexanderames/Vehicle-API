class Model < ApplicationRecord
  belongs_to :make
  belongs_to :vehicle

  validates :name, presence: true
end
