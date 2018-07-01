require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe '#validations' do
    it 'should test that the factory is valid' do
      expect(build :vehicle).to be_valid
    end

    it 'should validate the presence of vin' do
      v = build :vehicle, vin: ''
      expect(v).not_to be_valid
      expect(v.errors.messages[:vin]).to include("can't be blank")
    end

    it 'should validate the uniqueness of vin' do
      v = create :vehicle
      invalid_vehicle = build :vehicle, vin: v.vin
      expect(invalid_vehicle).not_to be_valid
    end

    it 'should validate the presence of mileage' do
      v = build :vehicle, mileage: ''
      expect(v).not_to be_valid
      expect(v.errors.messages[:mileage]).to include("can't be blank")
    end

    it 'should validate the presence of plate_state' do
      v = build :vehicle, plate_state: ''
      expect(v).not_to be_valid
      expect(v.errors.messages[:plate_state]).to include("can't be blank")
    end
  end
end
