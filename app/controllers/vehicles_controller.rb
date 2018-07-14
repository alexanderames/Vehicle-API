class VehiclesController < ApplicationController
  skip_before_action :authorize!, only: [:index, :show]

  def index
    vehicles = Vehicle.recent
                      .page(params[:page])
                      .per(params[:per_page])
    render json: vehicles
  end

  def show
    render json: Vehicle.find(params[:id])
  end
end
