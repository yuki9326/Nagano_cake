class Public::ItemsController < ApplicationController

  def index
    @items = Item.first(8)
  end
end
