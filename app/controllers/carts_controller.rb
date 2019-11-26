class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
  end

  def create
  end

  def update
    unless current_user.cart.items.include?(Item.find(params[:id]))
      ic = ItemCart.new
      ic.cart_id = current_user.id
      ic.item_id = Item.find(params[:id]).id
      ic.save
      redirect_to '/'
      flash[:success] = "Article ajouté au panier !"
    else
      redirect_to '/'
      flash[:alert] = "Cet article est déjà dans votre panier" 
    end
    tp current_user.cart.items, :title
  end

  def destroy
  end
end
