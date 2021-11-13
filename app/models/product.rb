class Product < ApplicationRecord
  has_many :cart_products
  has_many :carts, through: :cart_products, dependent: :destroy
  
  validates :title , :price, :description, :category, :image, presence: true
end
