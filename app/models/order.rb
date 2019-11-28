class Order < ApplicationRecord
  has_many :item_orders, dependent: :destroy
  has_many :items, through: :item_orders, dependent: :destroy
  belongs_to :cart


  # Exécution de la méthode 'order_send_to_user' après la création d'une commande
  after_create :order_send_to_user2 

  # Méthode pour envoyer un email de confirmation de commande à l'utilisateur
  def order_send_to_user2
    # On fait appel au fichier "order_mailer.rb" qui éxécute la méthode "confirm_order_email" sur l'instance du model "order"
  	OrderMailer.confirm_order_email_to_user2(self).deliver_now
  end
end
