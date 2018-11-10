# frozen_string_literal: true

# 注文のデコレーター
module OrderDecorator
  def sum
    details.inject(0) { |sum, detail| sum + detail.sum }
  end
end
