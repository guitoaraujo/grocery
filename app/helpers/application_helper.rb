module ApplicationHelper

  def product_added_in(cart, product)
    CartProduct.where(cart: cart, product: product).first.created_at.strftime('%d-%m-%Y at %H:%M')
  end
  
  def cart_product?(cart, product)
    cart.products.include?(product)
  end

  def categories_list(category)
    options_for_select(Category.all.map { |c| [c.name.capitalize, c.id] }, category)
  end

  def formated_price(price)
    "US$ #{price.to_f / 100}"
  end
end
