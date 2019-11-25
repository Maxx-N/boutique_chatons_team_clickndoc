class CreateItemCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :item_carts do |t|

      t.timestamps
    end
  end
end
