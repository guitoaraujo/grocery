namespace :products do
  desc 'Creates products'
  task create: :environment do
    response = Typhoeus.get('https://fakestoreapi.com/products')
    if response.response_code == 200
      products = JSON.parse(response.body)
      products.each do |product|
        Product.create(product.except('id', 'rating'))
      end
      puts 'OK!'
    else
      puts 'Something went wrong'
    end
  end
end