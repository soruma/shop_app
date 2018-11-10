# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association' do
    subject { described_class.new }
    describe 'has_many' do
      it { is_expected.to have_many(:orders).dependent(:destroy) }
    end
  end

  describe 'validation' do
    let(:user) { build(:user) }

    shared_examples '無効な値' do
      it { expect(user).not_to be_valid }
    end

    it 'has a valid factory' do
      expect(user).to be_valid
    end

    it 'is valid with a name, email, address' do
      user = User.new(
        name: 'Alice Green',
        email: 'alice.green@example.com',
        address: 'Osaka-shi, Osaka'
      )
      expect(user).to be_valid
    end

    describe '無効なemail' do
      context 'ブランクの場合' do
        let(:user) { build(:user, email: '') }
        it_behaves_like '無効な値'
      end

      context 'email形式ではない場合' do
        let(:user) { build(:user, email: 'test') }
        it_behaves_like '無効な値'
      end

      context 'email形式の場合' do
        let(:user) { build(:user, email: 'test@example.com') }
        it { expect(user).to be_valid }
      end

      describe 'ユニークであるか' do
        it { expect(user).to validate_uniqueness_of(:email) }
      end
    end

    describe '無効なname' do
      let(:user) { build(:user, name: nil) }
      it_behaves_like '無効な値'
    end

    describe '無効なaddress' do
      let(:user) { build(:user, address: '') }
      it_behaves_like '無効な値'
    end
  end
end
