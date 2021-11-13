class Product < ApplicationRecord
  validates :title , :price, :description, :category, :image, presence: true
end
