# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.integer :price
      t.string :description
      t.references :category, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
