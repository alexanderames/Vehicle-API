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

  describe '#show' do
    let(:vehicle) { create :vehicle }
    subject { get :show, params: { id: vehicle.id } }

    it 'should return success response' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      subject
      expect(json_data['attributes']).to eq({
        'vin' => vehicle.vin,
        'mileage' => vehicle.mileage,
        'plate-state' => vehicle.plate_state
      })
    end
  end

  describe '#create' do
    subject { post :create }

    context 'when no code provided' do
      it_behaves_like 'forbidden_requests'
    end

    context 'when invalid code provided' do
      before { request.headers['authorization'] = 'Invalid token'}
      it_behaves_like 'forbidden_requests'
    end

    context 'when authorized' do
      let(:access_token) { create :access_token }
      before { request.headers['authorization'] = "Bearer #{access_token.token}" }

      context 'when invalid parameters provided' do
        let(:invalid_attributes) do
          {
            'data' => {
              'attributes' => {
                'vinn' => '',
                'mileage' => ''
              }
            }
          }
        end

        subject { post :create, params: invalid_attributes }

        it 'should return 422 status code' do
          subject
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'should return proper error json' do
          subject
          expect(json['errors']).to include(
            {
              "source" => { "pointer" => "/data/attributes/vin" },
              "detail" =>  "can't be blank"
            },
            {
              "source" => { "pointer" => "/data/attributes/mileage" },
              "detail" =>  "can't be blank"
            }
          )
        end
      end

      context 'when success request sent' do
        let(:access_token) { create :access_token }
        before { request.headers['authorization'] = "Bearer #{access_token.token}" }

        let(:valid_attributes) do
          {
            'data' => {
              'attributes' => {
                'vin' => '1HGBH41JXMN109189',
                'mileage' => 76000
              }
            }
          }
        end

        subject { post :create, params: valid_attributes }

        it 'should have 201 status code' do
          subject
          expect(response).to have_http_status(:created)
        end

        it 'should have proper json body' do
          subject
          expect(json_data['attributes']).to include(valid_attributes['data']['attributes'])
        end

        it 'should create the vehicle' do
          expect{ subject }.to change{ Vehicle.count }.by(1)
        end
      end
    end
  end

    describe '#update' do
      let(:user) { create :user }
      let(:vehicle) { create :vehicle, user: user }
      let(:access_token) { user.create_access_token }

      subject { patch :update, params: { id: vehicle.id } }

      context 'when no code provided' do
        it_behaves_like 'forbidden_requests'
      end

      context 'when invalid code provided' do
        before { request.headers['authorization'] = 'Invalid token' }
        it_behaves_like 'forbidden_requests'
      end

      context 'when trying to update not owned vehicle' do
        let(:other_user) { create :user }
        let(:other_vehicle) { create :vehicle, user: other_user }

        subject { patch :update, params: { id: other_vehicle.id } }
        before { request.headers['authorization'] = "Bearer #{access_token.token}" }

        it_behaves_like 'forbidden_requests'
      end

      context 'when authorized' do
         before { request.headers['authorization'] = "Bearer #{access_token.token}" }

         context 'when invalid parameters provided' do
           let(:invalid_attributes) do
             {
               data: {
                 attributes: {
                   vin: '',
                   mileage: ''
                 }
               }
             }
           end

           subject do
             patch :update, params: invalid_attributes.merge(id: vehicle.id)
           end

           it 'should return 422 status code' do
             subject
             expect(response).to have_http_status(:unprocessable_entity)
           end

           it 'should return proper error json' do
             subject
             expect(json['errors']).to include(
               {
                 "source" => { "pointer" => "/data/attributes/vin" },
                 "detail" =>  "can't be blank"
               },
               {
                 "source" => { "pointer" => "/data/attributes/mileage" },
                 "detail" =>  "can't be blank"
               }
             )
           end
         end

         context 'when success request sent' do
           before { request.headers['authorization'] = "Bearer #{access_token.token}" }

           let(:valid_attributes) do
             {
               'data' => {
                 'attributes' => {
                   'vin' => '1HGBH41JXMN109183',
                   'mileage' => 76000
                 }
               }
             }
           end

           subject do
             patch :update, params: valid_attributes.merge(id: vehicle.id)
           end

           it 'should have 200 status code' do
             subject
             expect(response).to have_http_status(:ok)
           end

           it 'should have proper json body' do
             subject
             expect(json_data['attributes']).to include(
               valid_attributes['data']['attributes']
             )
           end

           it 'should update the vehicle' do
             subject
             expect(vehicle.reload.vin).to eq(
               valid_attributes['data']['attributes']['vin']
             )
           end
         end
       end
     end
   end
