class RentalsController < ApplicationController
  # creating a new item rental

  def create
    @item = Item.find(params[:item_id])
    @rental = Rental.new(rental_params)
    @rental.item = @item
    @rental.user = current_user
    if @rental.save
      # redirect
      redirect_to dashboard_path,  notice: "Your rental has been confirmed for the total amount of #{(@rental.end_date - @rental.start_date).to_i / 60 / 60 / 24 * @item.price} EUR"
    else
      render "items/show", notice: 'Something went wrong with your rent request', status: :unprocessable_entity
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end

end
