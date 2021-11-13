class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.string :total_price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
