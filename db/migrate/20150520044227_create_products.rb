class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :price, :precision => 10, :scale => 2, null: false
      t.integer :stock, null: false
      t.integer :views, default: 0
      t.timestamps null: false
    end
  end
end
