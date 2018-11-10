class AddEndOfProductionToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :end_of_production, :boolean, null: false, default: false
  end
end
