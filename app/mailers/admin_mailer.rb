class AdminMailer < ApplicationMailer

	def # Méthode permettant d'envoyer un mail de confirmation de commande d'un utilisateur à l'administrateur
	def confirm_order_email(admin)
		@admin = admin
		@user = user
		mail(to: @admin.email, subject: 'Confirmation de commande client.')
	end
end
