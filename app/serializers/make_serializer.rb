class MakeSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :vehicle
  has_one :user
end
