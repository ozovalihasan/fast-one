class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :quantity
      t.string :name
      t.decimal :price
      t.text :description
      t.references :seller, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
