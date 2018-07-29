require 'rails_helper'

RSpec.describe "Makes", type: :request do
  describe "GET /makes" do
    it "works! (now write some real specs)" do
      get makes_path
      expect(response).to have_http_status(200)
    end
  end
end
