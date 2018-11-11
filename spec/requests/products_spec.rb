# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:product) { create(:product) }
  let(:valid) { build(:product) }
  let(:invalid) { build(:product, :invalid) }

  describe 'GET #index' do
    it 'リクエストが成功する' do
      get products_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'リクエストが成功する' do
      get product_path product
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    it 'リクエストが成功する' do
      get new_product_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #edit' do
    it '商品編集ページが表示される' do
      get edit_product_path product
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context '商品の登録に成功したら' do
      let(:params_product) { { name: valid.name, price: valid.price } }

      it 'リクエストが成功する' do
        post products_path, params: { product: params_product }
        expect(response).to have_http_status(:found)
      end

      it '商品ページにリダイレクト' do
        post products_path, params: { product: params_product }
        expect(response).to redirect_to(Product.last)
      end

      it '商品が登録される' do
        expect do
          post products_path, params: { product: params_product }
        end.to change(Product, :count)
      end
    end

    context '商品の登録に失敗したら' do
      let(:params_product) { { name: invalid.name, price: invalid.price } }

      it 'リクエストが成功する' do
        post products_path, params: { product: params_product }
        expect(response).to have_http_status(:ok)
      end

      it '商品が登録されない' do
        expect do
          post products_path, params: { product: params_product }
        end.to_not change(Product, :count)
      end
    end
  end

  describe 'PATCH #update' do
    context '商品の更新に成功したら' do
      let(:params_product) { { name: valid.name, price: valid.price } }

      it 'リクエストが成功する' do
        patch product_path(product), params: { product: params_product }
        expect(response).to have_http_status(:found)
      end

      it '商品ページにリダイレクト' do
        patch product_path(product), params: { product: params_product }
        expect(response).to redirect_to(product)
      end

      it '商品が更新される' do
        expect do
          patch product_path(product), params: { product: params_product }
        end.to change { Product.find(product.id).name }.from(product.name).to(valid.name)
      end
    end

    context '商品の更新に失敗したら' do
      let(:params_product) { { name: invalid.name, price: invalid.price } }

      it 'リクエストが成功する' do
        patch product_path(product), params: { product: { name: invalid.name, price: invalid.price } }
        expect(response).to have_http_status(:ok)
      end

      it '商品が更新されない' do
        expect do
          patch product_path(product), params: { product: { name: invalid.name, price: invalid.price } }
        end.to_not change(Product.find(product.id), :name)
      end
    end
  end

  describe 'DELETE #destory' do
    let!(:product) { create(:product) }

    it 'リクエストが成功する' do
      delete product_path(product)
      expect(response).to have_http_status(:found)
    end

    it '一覧ページにリダイレクト' do
      delete product_path(product)
      expect(response).to redirect_to(products_path)
    end

    it '商品の削除に成功する' do
      expect do
        delete product_path(product)
      end.to change(Product, :count).by(-1)
    end
  end
end
