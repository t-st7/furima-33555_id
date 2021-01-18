class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:product, :description, :category_id, :delivery_charge_id, :state_id, :condition_id,
                                 :day_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
