class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products
  has_many :products, through: :cart_products, dependent: :destroy

  def update_total_price
    self.total_price = self.products.map(&:price).sum.to_f
    save
  end
end
