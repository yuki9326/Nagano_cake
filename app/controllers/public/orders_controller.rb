class Public::OrdersController < ApplicationController

  def index
  @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new
    @order.payment_method = params[:order][:payment_method]
    @order.shipping_cost = 800

    if params[:order][:address_kind] == "0" # ご自身の住所
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:address_kind] == "1" # 既存の住所

    elsif params[:order][:address_kind] == "2" # 新規住所
      @order.address = params[:order][:address]
      @order.postal_code = params[:order][:postal_code]
      @order.name = params[:order][:name]
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_thanks_path
    else
      render :confirm
    end
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address, :postal_code, :name)
  end
end