class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
  end

  def create
  end

  def destroy
  end
end
