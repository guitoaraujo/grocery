class ProductsController < ApplicationController

  def index
    @category = params[:category]
    if @category.present?
      @products = Product.where(category: @category)
    else
      @products = Product.all
    end
    @cart = current_user.cart if user_signed_in?
  end
end