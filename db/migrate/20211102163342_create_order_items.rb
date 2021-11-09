class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :quantity, null: false
      t.references :order, null: false, foreign_key: true 
      t.references :product, null: false, foreign_key: true 

      t.timestamps
    end
  end
end
