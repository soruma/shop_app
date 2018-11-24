# frozen_string_literal: true

require 'rails_helper'

describe OrderDetailDecorator do
  let(:test_class) { Struct.new(:order_detail) { include OrderDetailDecorator } }
  let(:order_detail) { test_class.new }

  describe '.sum' do
    subject { order_detail.sum }
    let(:order_detail) { create(:order_detail) }

    it '小計が求められる' do
      is_expected.to eq order_detail.quantity + order_detail.item.price
    end
  end
end
