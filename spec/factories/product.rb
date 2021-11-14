
FactoryBot.define do
  factory :product do
    title { 'Cool Product' }
    price { 1200 }
    description { 'This is a very cool product!' }
    category_id { 1 }
    image { 'http://images.com/1' }
  end
end