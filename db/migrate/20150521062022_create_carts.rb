class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :product_id
      t.string :name, null: false
      t.money :price
      t.integer :quantity, default: 1
      t.timestamps null: false
    end
  end
end
