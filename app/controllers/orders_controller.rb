class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
  end

  def create
    o = Order.new
    o.cart_id = current_user.cart.id 
    o.save
    
    current_user.cart.items.each do |item|
      io = ItemOrder.new
      io.item_id = item.id
      io.order_id = o.id
      io.save
    end

    current_user.cart.item_carts.destroy_all

    redirect_to "/carts/#{current_user.id}"
  end

  def destroy
  end
end
