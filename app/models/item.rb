class Item < ApplicationRecord
  has_many :item_carts, dependent: :destroy
  has_many :carts, through: :item_carts, dependent: :destroy
  has_many :item_orders, dependent: :destroy
  has_many :orders, through: :item_orders, dependent: :destroy

  has_one_attached :item_picture

  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags, dependent: :destroy


  validates :title, presence: {message: "Le nom du produit doit être renseigné"},
                    uniqueness: {message: "Nom du produit déjà utilisé"}
  validates :price, presence: {message: "le prix doit être renseigné"},
                    numericality: {greater_than: 1, message:" Le prix doit être un chiffre entier supérieur à 1€" }

end
