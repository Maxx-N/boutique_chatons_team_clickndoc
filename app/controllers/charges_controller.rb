class ChargesController < ApplicationController
  def new
    if current_user.cart.items.length === 0
      flash[:alert] = "Merci d'ajouter au moins un article à votre panier pour valider la commande"
      redirect_to root_path
    else
      @cart = current_user.cart
      @total = 0
      @cart.items.each do |item|
        @total += item.price
      end
    end
  end
  
  def create
    @cart = current_user.cart
    @total = 0
    @cart.items.each do |item|
      @total += item.price
    end
    # Amount in cents
    @amount = (@total * 100).to_i
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

# Création d'une commande après chaque paiement (et suppression du contenu du panier)
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


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
