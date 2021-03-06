# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

  def update_total_price
    self.total_price = products.map(&:price).sum.to_f
    save
  end
end
