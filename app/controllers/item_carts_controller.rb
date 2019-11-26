class ItemCartsController < ApplicationController
  def destroy
    @item_cart = ItemCart.find(params[:id])
    @item_cart.destroy
    redirect_to "/carts/#{current_user.id}"
  end
end
