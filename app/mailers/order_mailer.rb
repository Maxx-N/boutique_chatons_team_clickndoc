class OrderMailer < ApplicationMailer

	def confirm_order_email_to_user2(order)
		@cart = Order.find_by(cart_id: order.cart_id)
		@all_items_cart = Cart.where(id: ItemCart.where(cart_id: @cart.id)) 
		mail(to: "staff-chaton@yopmail.com", subject: "Une commande vient d'être passée.")
	end

end
