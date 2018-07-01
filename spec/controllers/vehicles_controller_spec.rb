require 'rails_helper'

describe VehiclesController do
  describe '#index' do
    it 'should return success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      create_list :vehicle, 2
      get :index
      json = JSON.parse(response.body)
      json_data = json['data']
      expect(json_data.length).to eq(2)
      expect(json_data[0]['attributes']).to eq({
        "vin"=>"1HGBH41JXMN109181", "mileage"=>wildcard_matcher, "plate-state"=>"CO"
      })
      expect(json_data[1]['attributes']).to eq({
        "vin"=>"1HGBH41JXMN109182", "mileage"=>wildcard_matcher, "plate-state"=>"CO"
      })
    end
  end
end
