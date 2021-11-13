class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_products
  has_many :carts, through: :cart_products, dependent: :destroy
  
  validates :title , :price, :description, :image, presence: true
end
