# frozen_string_literal: true

FactoryBot.define do
  factory :order_detail do
    order
    item { FactoryBot.create(:product) }
    quantity { Faker::Number.number(2) }
  end
end
