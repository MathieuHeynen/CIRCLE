class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @my_rentals = @user.rentals
    @my_uploaded_items = @user.items
  end
  
end
