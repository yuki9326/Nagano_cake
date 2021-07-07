class Public::OrdersController < ApplicationController

  def index
  @orders = current_customer.orders
  end

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new
    @order.payment_method = params[:order][:payment_method]
    @order.shipping_cost = 800
    @total = 0
    @cart_items.each do |cart_item|
    @total += cart_item.item.price * 1.1 * cart_item.amount
    end

    if params[:order][:address_kind] == "0" # ご自身の住所
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:address_kind] == "1" # 既存の住所
      @address = Address.find(params[:order][:address_id])
      @order.address = @address.address
      @order.postal_code = @address.postal_code
      @order.name = @address.name
    elsif params[:order][:address_kind] == "2" # 新規住所
      @order.address = params[:order][:address]
      @order.postal_code = params[:order][:postal_code]
      @order.name = params[:order][:name]
    end

  end

  def create
    @order = Order.new(order_params)
    if @order.save
       @cart_items = current_customer.cart_items
       @cart_items.each do |cart_item|
         item = cart_item.item
       @order_detail = OrderDetail.new(item_id: cart_item.item_id,order_id: @order.id, price: item.price * 1.1, amount: cart_item.amount, making_status:0)
       @order_detail.save
       end
       @cart_items.destroy_all
      redirect_to orders_thanks_path
    else
      @cart_items = current_customer.cart_items
      render :confirm
    end
  end

  def thanks
  end

  def show
    @order = Order.find(params[:id])
  end


  private

  def order_params
    params.require(:order).permit(:payment_method, :address, :postal_code, :name, :customer_id, :total_payment, :status, :created_at, :shipping_cost)
  end
end