class Tag < ApplicationRecord
    has_many :item_orders, dependent: :destroy
    has_many :items, through: :item_orders, dependent: :destroy
  
end
