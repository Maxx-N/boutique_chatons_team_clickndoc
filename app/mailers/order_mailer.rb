class OrderMailer < ApplicationMailer

	def confirm_order_email(order)
		@order = order
		@url = 'http://boutique_chatons_team_clickndoc.fr/login'
		mail(to: @order.cart.user.email, subject: 'Confirmation de votre commande.')
	end

end
