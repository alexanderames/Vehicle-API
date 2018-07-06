class VehiclesController < ApplicationController
  def index
    vehicles = Vehicle.recent
    render json: vehicles
  end

  def show
  end
end
