class LinkItemCart < ActiveRecord::Migration[5.2]
  def change
    add_reference :item_carts, :cart, foreign_key: true
    add_reference :item_carts, :item, foreign_key: true
  end
end
