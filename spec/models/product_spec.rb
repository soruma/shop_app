# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validation' do
    let(:product) { build(:product) }

    shared_examples '無効な値' do
      it { expect(product).not_to be_valid }
    end

    it 'has a valid factory' do
      expect(product).to be_valid
    end

    it 'is valid with a name, price, end_of_production' do
      product = Product.new(
        name: 'Alice Green',
        price: 120,
        end_of_production: false
      )
      expect(product).to be_valid
    end

    describe '無効なname' do
      let(:product) { build(:product, name: '') }
      it_behaves_like '無効な値'
    end

    describe '無効なprice' do
      context '数値以外の場合' do
        let(:product) { build(:product, price: 0) }
        it_behaves_like '無効な値'
      end

      context '1以下の場合' do
        let(:product) { build(:product, price: 'A') }
        it_behaves_like '無効な値'
      end
    end

    describe 'end_of_production' do
      describe '無効' do
        context 'boolean以外の場合' do
          let(:product) { build(:product, end_of_production: '') }
          it_behaves_like '無効な値'
        end
      end

      describe '有効' do
        context 'trueの場合' do
          let(:product) { build(:product, end_of_production: true) }
          it { expect(product).to be_valid }
        end
      end

      context 'falseの場合' do
        let(:product) { build(:product, end_of_production: false) }
        it { expect(product).to be_valid }
      end
    end
  end
end
