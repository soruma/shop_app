# frozen_string_literal: true

# 注文明細のデコレーター
module OrderDetailDecorator
  def sum
    quantity * item.price
  end
end
