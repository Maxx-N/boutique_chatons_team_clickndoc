class Cart < ApplicationRecord
  has_one :user
  has_many :item_carts, dependent: :destroy
  has_many :items, through: :item_carts, dependent: :destroy
  has_many :orders, dependent: :destroy
end
