# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'GET #index' do
    let!(:user) { create(:user) }
    let!(:cart) { create(:cart, user_id: user.id) }
    let!(:category) { create(:category) }
    let!(:product1) { create(:product, price: 1000) }
    let!(:product2) { create(:product, price: 4000) }
    let!(:cart_product1) { create(:cart_product, cart_id: cart.id, product_id: product1.id) }
    let!(:cart_product2) { create(:cart_product, cart_id: cart.id, product_id: product2.id) }
    let!(:products) { [product1, product2] }

    context 'when there is category filter' do
      subject { get :index, params: { category_id: '1' } }

      it 'assigns @category_id' do
        subject
        expect(assigns(:category_id)).to eq('1')
      end

      it 'assigns @products' do
        subject
        expect(assigns(:products)).to eq(products)
      end

      it 'returns products of that category' do
        expect(subject).to be_successful
      end
    end

    context 'when there is no category filter' do
      subject { get :index }

      it 'assigns @category_id' do
        subject
        expect(assigns(:category_id)).to eq(nil)
      end

      it 'assigns @products' do
        subject
        expect(assigns(:products)).to eq(products)
      end

      it 'returns products of that category' do
        expect(subject).to be_successful
      end
    end

    context 'when there is a user signed in' do
      subject { get :index }

      it 'assigns @cart' do
        sign_in user
        subject
        expect(assigns(:cart)).to eq(cart)
      end

      it 'returns products of that category' do
        expect(subject).to be_successful
      end
    end
  end
end
