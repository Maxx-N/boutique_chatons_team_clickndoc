class CartsController < ApplicationController
  def show
    
  end

  def create
  end

  def update
    ic = ItemCart.new
    ic.cart_id = current_user.id
    ic.item_id = Item.find(params[:id]).id
    ic.save
    puts ic.errors
    tp current_user.cart.items, :title
  end

  def destroy
  end
end
