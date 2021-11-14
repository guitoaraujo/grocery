# frozen_string_literal: true

FactoryBot.define do
  factory :cart do
    total_price { 0 }
    user_id { 1 }
    created_at { 'Thu, 21 Oct 2021 09:43:48.242767000 UTC +00:00' }
    updated_at { 'Thu, 21 Oct 2021 09:43:48.242767000 UTC +00:00' }
  end
end
