class CabsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cabs = Cab.idle

    format.json {
      render json: @user
    }
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def start_trip
    city = City.find(params[:city_id])
    cab = Cab.where(city: city, state: :idle).order(:updated_at).first
    return "No cabs are present" if cab.blank?

    Trip.create!(cab: cab, user: current_user, start_time: DateTime.now)
  end

  def end_trip
    trip = Trip.find(params[:id])
    trip&.update_attributes!(end_time: DateTime.now)
  end
end
