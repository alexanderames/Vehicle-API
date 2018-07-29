class MakesController < ApplicationController
  skip_before_action :authorize!, only: [:index]

  # GET /makes
  def index
    @makes = Make.all

    render json: @makes
  end


  # POST /makes
  def create
    @make = Make.new(make_params)

    if @make.save
      render json: @make, status: :created, location: @make
    else
      render json: @make.errors, status: :unprocessable_entity
    end
  end


  private

    # Only allow a trusted parameter "white list" through.
    def make_params
      params.require(:make).permit(:name, :vehicle_id, :user_id)
    end
end
