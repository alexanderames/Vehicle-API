class VehiclesController < ApplicationController
  def index
    vehicles = Vehicle.all
    render json: vehicles
  end

  def show
  end
end
