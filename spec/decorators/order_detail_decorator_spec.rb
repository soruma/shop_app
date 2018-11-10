# frozen_string_literal: true

require 'rails_helper'

describe OrderDetailDecorator do
  let(:order_detail) { OrderDetail.new.extend OrderDetailDecorator }
  subject { order_detail }
  it { should be_a OrderDetail }
end
