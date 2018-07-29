require "rails_helper"

RSpec.describe OptionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "vehicles/1/options").to route_to("options#index", vehicle_id: '1')
    end

    it "routes to #create" do
      expect(:post => "vehicles/1/options").to route_to("options#create", vehicle_id: '1')
    end
  end
end
