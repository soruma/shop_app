# frozen_string_literal: true

# 注文コントローラー
class OrdersController < ApplicationController
  before_action :set_order, only: %i[show destroy]

  def index
    @orders = Order.includes(:user, details: :item).all
  end

  def show; end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: t('.create_successfully') }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @order.destroy
    format.html { redirect_to orders_url, notice: t('.destroy_successfully') }
  end

  private

  def set_order
    @order = Order.includes(details: :item).find(params[:id])
  end

  def order_params
    params.require(:order).permit(:user_id, order_details_attributes: [:id, :_destroy, :item, :quantity])
  end
end
