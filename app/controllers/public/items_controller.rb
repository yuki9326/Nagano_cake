class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @items = Item.limit(8).order(created_at: :desc)
  end
end
