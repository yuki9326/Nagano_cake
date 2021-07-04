class Public::OrdersController < ApplicationController

  def index
  @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
  @order = Order.new(order_params)
  if @order.save
    redirect_to orders_thanks_path
  else render :confirm
  end
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address, :postal_code, :name)
  end
end