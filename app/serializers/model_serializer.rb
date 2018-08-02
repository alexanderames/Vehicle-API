class ModelSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :make
  has_one :vehicle
end
