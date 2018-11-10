# frozen_string_literal: true

# 注文
class Order < ApplicationRecord
  has_many :details, class_name: 'OrderDetail', validate: true, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :details, reject_if: :all_blank, allow_destroy: true
end
