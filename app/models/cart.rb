class Cart < ApplicationRecord
  belongs_to :user
  has_many :item_carts, dependent: :destroy
  has_many :items, through: :item_carts, dependent: :destroy
  has_many :orders, dependent: :destroy
end
