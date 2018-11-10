# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    user

    factory :order_with_order_details do
      transient do
        order_details_count { 3 }
      end

      after(:build) do |order, evaluator|
        create_list(:order_detail, evaluator.order_details_count, order: order)
      end
    end
  end
end
