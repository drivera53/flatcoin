class CreateTrades < ActiveRecord::Migration[6.0]
  def change
    create_table :trades do |t|
      t.text :coin_name
      t.decimal :current_price
      t.integer :quantity
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
