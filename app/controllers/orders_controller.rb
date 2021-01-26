class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end


  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:user_order).permit(:zip, :state_id, :city, :address_line, :address_line_second, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], price: @item.price, order_id: params[:order_id], token: params[:token])
  end

  def move_to_index
    if @item.order.present?
    redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
