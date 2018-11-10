# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Movie.quote }
    price { Faker::Number.number(5) }
  end
end
