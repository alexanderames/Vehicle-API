require 'rails_helper'

RSpec.describe MakesController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    let(:vehicle) { create :vehicle }

    it "returns a success response" do
      get :index, params: { vehicle_id: vehicle.id }, session: valid_session
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Make" do
        expect {
          post :create, params: {make: valid_attributes}, session: valid_session
        }.to change(Make, :count).by(1)
      end

      it "renders a JSON response with the new make" do

        post :create, params: {make: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(make_url(Make.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new make" do

        post :create, params: {make: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
