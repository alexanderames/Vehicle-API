require 'rails_helper'

describe VehiclesController do
  describe '#index' do
    subject { get :index }

    it 'should return success response' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      create_list :vehicle, 2
      subject
      Vehicle.recent.each_with_index do |vehicle, index|
        expect(json_data[index]['attributes']).to eq({
          'vin' => vehicle.vin,
          'mileage' => vehicle.mileage,
          'plate-state' => vehicle.plate_state
        })
      end
    end

    it 'should return vehicles in the proper order' do
      old_vehicle = create :vehicle
      newer_vehicle = create :vehicle
      subject
      expect(json_data.first['id']).to eq(newer_vehicle.id.to_s)
      expect(json_data.last['id']).to eq(old_vehicle.id.to_s)
    end

    it 'should paginate results' do
      create_list :vehicle, 3
      get :index, params: { page: 2, per_page: 1 }
      expect(json_data.length).to eq 1
      expected_vehicle = Vehicle.recent.second.id.to_s
      expect(json_data.first['id']).to eq(expected_vehicle)
    end
end
