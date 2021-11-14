class CheckoutController < ApplicationController

  def create
    @session = Stripe::Checkout::Session.create(
      {
        payment_method_types: ['card'],
        line_items: line_items,
        mode: 'payment',
        success_url: root_url,
        cancel_url: root_url
      }
    )

    respond_to :js
  end

  private

  def line_items
    products = Product.where(id: params[:products])
    products.map do |product|
      {
        name: product.title,
        amount: product.price,
        currency: 'usd',
        quantity: 1
      }
    end
  end
end