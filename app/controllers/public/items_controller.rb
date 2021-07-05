class Public::ItemsController < ApplicationController

  def index
     @items = Item.page(params[:page]).reverse_order
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end



private

def item_params
  params.require(:item).permit([:image, :name, :introduction, :price, :is_active])
end

end