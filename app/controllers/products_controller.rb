class ProductsController < ApplicationController

  def index
    @products = Product.all
    @cart = current_user.cart if user_signed_in?
  end
end