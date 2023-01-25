class OrdersController < ApplicationController
  # GET /orders
  def index
    @orders = current_user.orders.all

    render json: @orders
  end

  # POST /orders
  def create
    Order.transaction do
      @order = Order.new(order_params)
      @order.user = current_user

      if @order.save
        params[:items].each do |item|
          product = Product.find(item[:id])
          @order.order_details.create!(product:, quantity: item[:quantity])
        end

        render json: @order, status: :created
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def order_params
    params.permit(:delivery_address)
  end
end
