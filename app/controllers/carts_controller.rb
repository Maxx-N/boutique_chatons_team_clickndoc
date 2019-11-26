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
  end

  def destroy
  end
end
