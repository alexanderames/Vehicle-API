class User < ApplicationRecord
  validates :login, presence: true, uniqueness: true
  validates :provider, presence: true

  has_many :vehicles, dependent: :destroy
  has_many :makes, dependent: :destroy
  has_one :access_token, dependent: :destroy
end
