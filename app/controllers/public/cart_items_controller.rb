class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @total = 0
    @cart_items.each do |cart_item|
    @total += cart_item.item.price * 1.1 * cart_item.amount
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if  @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else render template: "public/homes/top"
    end

  end

  def create
    @cart_item = current_customer.cart_items.build(cart_item_params)
    @item = Item.find(params[:cart_item][:item_id])
    if @cart_item.save
      redirect_to cart_items_path
    else render template: "public/items/show"
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def clear
    @cart_item = current_customer.cart_items
    @cart_item.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
