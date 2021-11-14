class ProductsController < ApplicationController

  def index
    @category_id = params[:category_id]
    if @category_id.present?
      @products = Product.where(category_id: @category_id)
    else
      @products = Product.all
    end
    @cart = current_user.cart if user_signed_in?
  end
end