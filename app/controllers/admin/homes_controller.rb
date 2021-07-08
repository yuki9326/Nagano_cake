class Admin::HomesController < ApplicationController

  def top
    @orders = Order.first(10)
  end
end
