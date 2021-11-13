module ApplicationHelper

  def product_added_in(cart, product)
    CartProduct.where(cart: cart, product: product).first.created_at.strftime('%d-%m-%Y at %H:%M')
  end
  
  def cart_product?(cart, product)
    cart.products.include?(product)
  end
end
