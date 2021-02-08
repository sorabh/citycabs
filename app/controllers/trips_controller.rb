class TripsController < ApplicationController
  before_action :authenticate_user!

  def index
    @trips = Trip.where(user: current_user, end_time: nil)

    respond_to do |format|
      format.json do
        render json: @trips
      end
      format.html
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def start_trip
    cab = Cab.where(city: current_user.city, state: :idle).order(:updated_at).first
    render json: {error: "No cabs are present" } if cab.blank?

    trip = Trip.create!(cab: cab, user: current_user, start_time: DateTime.now) if cab.present?
    redirect_to action: :index
  end

  def end_trip
    trip = Trip.find(params[:id])
    trip&.update_attributes!(end_time: DateTime.now)
    redirect_to action: :index
  end
end
