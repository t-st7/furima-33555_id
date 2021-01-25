class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:user_order).permit(:zip, :state_id, :city, :address_line, :address_line_second, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], order_id: params[:order_id])
  end
end
