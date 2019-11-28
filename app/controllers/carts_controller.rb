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
        
        respond_to do |format|
          format.html { redirect_to root_path }
          format.js { }
        end

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
    current_user.cart.item_carts.destroy_all
    redirect_to root_path
  end
end
