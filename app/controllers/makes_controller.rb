class MakesController < ApplicationController
  skip_before_action :authorize!, only: [:index]
  before_action :load_vehicle

  # GET /makes
  def index
    makes = @vehicle.makes

    render json: makes
  end


  # POST /makes
  def create
    @make = @vehicle.makes.build(make_params.merge(user: current_user))

    if @make.save
      render json: @make, status: :created, location: @vehicle
    else
      render json: @make.errors, status: :unprocessable_entity
    end
  end


  private

  def load_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

    # Only allow a trusted parameter "white list" through.
    def make_params
      params.require(:make).permit(:name)
    end
end
