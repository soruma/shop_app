# frozen_string_literal: true

# 製品
class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :end_of_production, inclusion: { in: [true, false] }
end
