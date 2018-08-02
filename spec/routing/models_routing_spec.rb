require "rails_helper"

RSpec.describe ModelsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "vehicles/1/models").to route_to("models#index", vehicle_id: '1')
    end

    it "routes to #create" do
      expect(:post => "vehicles/1/models").to route_to("models#create", vehicle_id: '1')
    end
  end
end
