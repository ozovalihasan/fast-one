class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :body
      t.references :product, null: false, foreign_key: true 
      t.references :consumer, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
