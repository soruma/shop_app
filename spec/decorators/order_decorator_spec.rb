# frozen_string_literal: true

require 'rails_helper'

describe OrderDecorator do
  let(:order) { create(:order) }
  subject { decorate order }

  describe '#sum' do
    subject { order.sum }

    it 'item.price is 0'
  end
end
