class VehiclesController < ApplicationController
  skip_before_action :authorize!, only: %i[index show]

  def index
    vehicles = Vehicle.recent
                      .page(params[:page])
                      .per(params[:per_page])
    render json: vehicles
  end

  def show
    render json: Vehicle.find(params[:id])
  end

  def create
    vehicle = current_user.vehicles.build(vehicle_params)
    vehicle.save!
    render json: vehicle, status: :created
  rescue ActiveRecord::RecordNotFound
    authorization_error
  rescue
    render json: vehicle, adapter: :json_api,
      serializer: ErrorSerializer,
      status: :unprocessable_entity
  end

  def update
    vehicle = current_user.vehicles.find(params[:id])
    vehicle.update_attributes!(vehicle_params)
    render json: vehicle, status: :ok
  rescue ActiveRecord::RecordNotFound
    authorization_error
  rescue
    render json: vehicle, adapter: :json_api,
      serializer: ErrorSerializer,
      status: :unprocessable_entity
  end

  private

  def vehicle_params
    params.require(:data).require(:attributes).
      permit(:vin, :mileage) ||
    ActionController::Parameters.new
  end
end
