require 'rails_helper'

RSpec.describe Cart, type: :model do
  subject { cart.update_total_price }

  context '.update_total_price' do
    let!(:user) { create(:user) }
    let!(:cart) { create(:cart, user_id: user.id) }
    let!(:category) { create(:category) }
    let!(:product1) { create(:product, price: 1000, category_id: category.id) }
    let!(:product2) { create(:product, price: 4000, category_id: category.id) }
    let!(:cart_product1) { create(:cart_product, cart_id: cart.id, product_id: product1.id) }
    let!(:cart_product2) { create(:cart_product, cart_id: cart.id, product_id: product2.id) }
    
    it 'calculates total price' do
      subject
      expect(cart.total_price).to eq(5000)
    end
  end
end