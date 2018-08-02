class OptionSerializer < ActiveModel::Serializer
  attributes :id, :seats, :transmission, :drivetrain, :fuel_type, :style, :color
  has_one :vehicle
end
