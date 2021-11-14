# frozen_string_literal: true

namespace :products do
  desc 'Creates products'
  task create: :environment do
    response = Typhoeus.get('https://fakestoreapi.com/products')
    if response.response_code == 200
      products = JSON.parse(response.body)
      products.each do |product|
        category = Category.find_or_create_by(name: product['category'])
        Product.create(
          title: product['title'],
          price: (product['price'].to_f * 100).to_i,
          description: product['description'],
          category_id: category.id,
          image: product['image']
        )
      end
      puts 'OK!'
    else
      puts 'Something went wrong'
    end
  end
end
