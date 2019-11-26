class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
    @total = 0
    @cart.items.each do |item|
      @total += item.price
    end
  end

  def create
  end

  def update
    if current_user

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

    else 
      redirect_to '/'
      flash[:alert] = "Connectez-vous pour ajouter des photos à votre panier" 
    end

  end

  def destroy
  end
end
