class ItemCartsController < ApplicationController
  def destroy
    @item_cart = ItemCart.find(params[:id])
    @item_cart.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end
end
