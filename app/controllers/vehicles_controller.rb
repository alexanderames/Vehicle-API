class VehiclesController < ApplicationController

  def index
    vehicles = Vehicle.recent
                      .page(params[:page])
                      .per(params[:per_page])
    render json: vehicles
  end

  def show
  end
end
