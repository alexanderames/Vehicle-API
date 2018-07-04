require 'rails_helper'

describe VehiclesController do
  describe '#index' do
    subject { get :index }

    it 'should return success response' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      vehicles = create_list :vehicle, 2
      subject
      vehicles.each_with_index do |vehicle, index|
        expect(json_data[index]['attributes']).to eq({
          'vin' => vehicle.vin,
          'mileage' => vehicle.mileage,
          'plate-state' => vehicle.plate_state
        })
      end
    end
  end
end
