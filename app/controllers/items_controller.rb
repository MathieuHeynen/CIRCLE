class ItemsController < ApplicationController
  before_action :find_item, only: [:show]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def show
    @rental = Rental.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to item_path(@item)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    find_item
  end

  def update
    find_item
    @item.update(item_params)
    redirect_to item_path(@item)
  end

  def destroy
    find_item
    @item.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :brand, :size, :price, :photo, :description)
  end
end
