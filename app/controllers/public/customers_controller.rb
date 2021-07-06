class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer
  end

  def update
  end

  def confirm
  end

  def unsubscribe
  end
end
