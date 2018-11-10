# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email.to_s }
    name { Faker::Name.name.to_s }
    address { Faker::Address.full_address.to_s }

    trait :with_order do
      orders { create_list(:order, Faker::Number.number(2), user) }
    end
  end
end
