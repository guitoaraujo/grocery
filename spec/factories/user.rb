# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'user@user.com' }
    password { '12345678' }
  end
end
