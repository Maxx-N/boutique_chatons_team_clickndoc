class OrderMailer < ApplicationMailer

	def confirm_order_email(order)
		@order = order


    @items_array = Item.where(ItemOrder.where(order_id: @order.id))
    # ItemOrder.where(order_id: @order.id) -> on cherche dans la table ItemOrder les éléments dont l'id vaut @order.id
    # puis on regarde la colonne "item_id" de cet élément



		@url = 'http://boutique_chatons_team_clickndoc.fr/login'
		mail(to: @order.cart.user.email, subject: 'Confirmation de votre commande.')
	end

end
 