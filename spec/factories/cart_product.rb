# frozen_string_literal: true

FactoryBot.define do
  factory :cart_product do
    cart_id { 1 }
    product_id { 1 }
  end
end
