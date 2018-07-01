class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :vin, :mileage, :plate_state
end
