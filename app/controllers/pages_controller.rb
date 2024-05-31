class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[about_us contact_us terms_of_services]
  
  def create
    redirect_to root_path, notice: "Your message has been successfully sent ❤️"
  end
end
