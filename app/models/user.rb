# frozen_string_literal: true

# ユーザー
class User < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :email, uniqueness: true
  validates_with EmailAddress::ActiveRecordValidator, field: :email

  validates :name, presence: true, length: { minimum: 3 }
  validates :address, length: { minimum: 10 }
end
