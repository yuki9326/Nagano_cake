class Public::ItemsController < ApplicationController

  def index
    @items = Item.first(8)
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