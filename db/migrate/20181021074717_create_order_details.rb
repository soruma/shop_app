class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.references :order, foreign_key: true
      t.integer :item_id, foreign_key: true
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
