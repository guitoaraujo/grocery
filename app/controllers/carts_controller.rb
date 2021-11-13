class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, except: :index

  def create
    products = Product.where(id: params[:products])
    @cart = Cart.new(user_id: current_user.id)
    if @cart.save
      @cart.update_total_price
      products.each do |product|
        CartProduct.create(cart: @cart, product: product)
      end
      redirect_to cart_path
    else
      render :index
    end
  end

  def show
  end

  def delete_products
    @cart.cart_products.where(product_id: params[:products_to_delete]).delete_all
    @cart.update_total_price
    redirect_to cart_path
  end

  def update
    products = Product.where(id: params[:products])
    products.each do |product|
      CartProduct.find_or_create_by(cart: @cart, product: product)
    end
    @cart.update_total_price
    redirect_to cart_path
  end

  private

  def set_cart
    @cart = current_user.cart
  end
end