class ItemsController < ApplicationController
  def index
  end

  private
  def item_params
    require.params(:item).permit(:product, :description, :category_id, :delivery_charge_id, :state_id, :condition_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end
end
