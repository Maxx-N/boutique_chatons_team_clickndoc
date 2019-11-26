class Order < ApplicationRecord
  belongs_to :cart


  # Exécution de la méthode 'order_send_to_user' après la création d'une commande
  after_create :order_send_to_user
  # Exécution de la méthode 'order_send_to_admin' après la création d'une commande
  #after_create :order_send_to_admin

  
 

  # Méthode pour envoyer un email de confirmation de commande à l'utilisateur
  def order_send_to_user
  	#@order = order
  	UserMailer.confirm_order_email(order.cart.user).deliver_now
  end

  # Méthode pour envoyer un email de confirmation de commande à l'admin
  #def order_send_to_admin
  #	@admin = admin
   # AdminMailer.confirm_order_email(admin).deliver_now
  #end
end
