class ItemsController < ApplicationController
  before_action :move_to_sign_in, only: [:new]
  def index
  end

  def new
  end

  def create
  end

  private
  def item_params
    require.params(:item).permit(:product, :description, :category_id, :delivery_charge_id, :state_id, :condition_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_sign_in
    unless user_signed_in? 
      redirect_to user_session_path
    end
  end
end
