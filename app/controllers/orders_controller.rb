# frozen_string_literal: true

# Order Controler
# Class for order controller
class OrdersController < ApplicationController
  def new
    total_amount = session[:items].reduce(0) { |sum, item| sum + (item['quantity'] * item['price']) }
    @order = Order.new(total_amount: total_amount)
  end

  def create_order_item(order)
    session[:items].each do |item|
      OrderItem.create!(item_id: item['item_id'], quantity: item['quantity'],
                        order_id: order[:id])

      Cart.where(item_id: item['item_id']).destroy_all
    end
  end

  def create
    @order = Order.new(user_id: current_user.id, total_amount: params[:amount], status: :ordered)
    @order.save!
    create_order_item(@order)
    session[:items] = []

    redirect_to root_path, flash: { notice: 'You have successfully placed the order' }
  end

  def show
    @items = OrderItem.where(order: params[:id]).joins(:item).select('items.title', 'items.price',
                                                                     'quantity', 'created_at').as_json
    @total_amount = @items.reduce(0) { |sum, item| sum + (item['quantity'] * item['price']) }
    @status = Order.find(params[:id]).status
  end
end
