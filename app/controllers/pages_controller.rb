class PagesController < ApplicationController
  def create
    redirect_to root_path, notice: "Your message has been successfully sent ❤️"
  end

end
