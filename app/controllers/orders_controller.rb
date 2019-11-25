class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def create
    o = Order.new
    o.cart_id = current_user.cart.id 
    o.save
    
    current_user.cart.items.each do |item|
      i = ItemOrder.new
      i.item_id = item.id
      i.order_id = o.id
      i.save
    end
    
  end

  def destroy
  end
end
