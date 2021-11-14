# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_products, dependent: :destroy
  has_many :carts, through: :cart_products

  validates :title, :price, :description, :image, presence: true
end
