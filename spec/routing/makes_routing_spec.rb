require "rails_helper"

RSpec.describe MakesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "vehicles/1/makes").to route_to("makes#index", vehicle_id: '1')
    end

    it "routes to #create" do
      expect(:post => "vehicles/1/makes").to route_to("makes#create", vehicle_id: '1')
    end
  end
end
