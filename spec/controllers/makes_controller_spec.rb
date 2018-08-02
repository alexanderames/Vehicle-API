require 'rails_helper'

RSpec.describe MakesController, type: :controller do
  let(:vehicle) { create :vehicle }

  describe "GET #index" do
    subject { get :index, params: { vehicle_id: vehicle.id } }
    it "returns a success response" do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'should only return make belonging to vehicle' do
      make = create :make, vehicle: vehicle
      create :make
      subject
      expect(json_data.length).to eq(1)
      expect(json_data.first['id']).to eq(make.id.to_s)
    end
  end

  describe "POST #create" do
    let(:valid_attributes) { { name: 'Subaru' } }
    let(:invalid_attributes) { { name: '' } }

    context 'when not authorized' do
      subject { post :create, params: { vehicle_id: vehicle.id } }

      it_behaves_like 'forbidden_requests'
    end

    context 'when authorized' do
      let(:user) { create :user }
      let(:access_token) { user.create_access_token }

      before { request.headers['authorization'] = "Bearer #{access_token.token}" }

      context "with valid params" do
        it "creates a new Make" do
          expect {
            post :create, params: {vehicle_id: vehicle.id, make: valid_attributes}
          }.to change(Make, :count).by(1)
        end

        it "renders a JSON response with the new make" do

          post :create, params: {vehicle_id: vehicle.id, make: valid_attributes}
          expect(response).to have_http_status(:created)
          expect(response.content_type).to eq('application/json')
          expect(response.location).to eq(vehicle_url(vehicle))
        end
      end

      context "with invalid params" do
        it "renders a JSON response with errors for the new make" do

          post :create, params: {vehicle_id: vehicle.id, make: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.content_type).to eq('application/json')
        end
      end
    end
  end
end
