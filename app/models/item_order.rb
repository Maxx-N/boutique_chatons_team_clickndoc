class ItemOrder < ApplicationRecord
  belongs_to :order
  belongs_to :item


  # Exécution de la méthode 'order_send_to_user' après la création d'un item (il y aura autant d'emails que d'items dans la commande)
  #after_create :order_send_to_user
  #after_create :order_send_to_admin

  # Méthode pour envoyer un email de confirmation de commande à l'utilisateur
  def order_send_to_user
    # On fait appel au fichier "item_order_mailer.rb" qui éxécute la méthode "confirm_order_email" sur l'instance du model "item_order"
  	ItemOrderMailer.confirm_order_email_to_user(self).deliver_now
  end

  def order_send_to_admin
  	ItemOrderMailer.confirm_order_email_to_admin(self).deliver_now
  end
end
