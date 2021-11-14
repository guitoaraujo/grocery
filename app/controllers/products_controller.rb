# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @category_id = params[:category_id]
    @products = if @category_id.present?
                  Product.where(category_id: @category_id)
                else
                  Product.all
                end
    @cart = current_user.cart if user_signed_in?
  end
end
