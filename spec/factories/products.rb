# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Movie.quote }
    price { Faker::Number.number(5) }

    trait :invalid do
      name { '' }
      price { 0 }
    end
  end
end
