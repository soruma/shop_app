# frozen_string_literal: true

# 注文明細
class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item, class_name: 'Product'
end
