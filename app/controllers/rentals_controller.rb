class RentalsController < ApplicationController
  #creating a new clothe rental

  def create
    @item = Item.find(params[:item_id])
    @rental = Rental.new(rental_params)
    @rental.item = @item
    @rental.user = current_user
    if @rental.save
      redirect_to item_path(@item)
    else
      render "items/show", notice: 'Something went wrong with your rent request', status: :unprocessable_entity
    end
  end

  #-------PRIVATE METHODS-------

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
