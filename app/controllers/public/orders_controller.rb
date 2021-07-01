class Public::OrdersController < ApplicationController

  def index
  @orders = Order.all
  end

  def thanks
  end
end
