class ProfileController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user

    respond_to do |format|
      format.json do
        render json: @user
      end
      format.html
    end
  end

  def update_city
    current_user.update_attributes!(city_id: params["user"]["city"])
    redirect_to cabs_path
  end
end
