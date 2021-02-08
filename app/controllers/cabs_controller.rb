class CabsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cabs = Cab.where(city: current_user.city).idle_cabs

    respond_to do |format|
      format.json do
        render json: @cabs
      end
      format.html
    end
  end
end
