class OrderMailer < ApplicationMailer

	def confirm_order_email_to_user2(order)
		@cart = Order.find_by(cart_id: order.cart_id)
		@all_items_cart = Cart.where(id: ItemCart.where(cart_id: @cart.id)) 
		print "0" *100
		puts @all_items_cart
		puts @all_items_cart.class
		puts @all_items_cart.inspect
		puts "1"*100
		mail(to: "staff-chaton@yopmail.com", subject: "Une commande vient d'être passée.")
	end

end
 