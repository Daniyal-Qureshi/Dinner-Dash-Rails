# frozen_string_literal: true

require 'date'

# Carts Controller
# Class for cart controller
class CartsController < ApplicationController
  def create
    store_data
    respond_to do |format|
      format.html
      format.js
    end
  end

  def exist_item(id = params[:item_id])
    session[:items].find { |item| item['item_id'].to_i == id.to_i }
  end

  def save_session(item)
    item[:price] = Item.find(params[:item_id]).price
    item[:title] = Item.find(params[:item_id]).title
    session[:items] << item
  end

  def update_cart(exist_item)
    index = session[:items].find_index(exist_item)
    session[:items][index]['quantity'] += 1
    Cart.where(item_id: params[:item_id]).update(quantity: exist_item['quantity']) if user_signed_in?
  end

  def store_data
    if exist_item.nil?
      item = { item_id: params[:item_id], quantity: 1 }
      if user_signed_in?
        item[:user_id] = current_user.id
        Cart.create(item)
      end

      save_session(item)
    else
      update_cart(exist_item)
    end
  end

  def index
    if user_signed_in?
      orderitems = OrderItem.where(order_id: Order.where(user_id: current_user.id)).includes(:item).pluck('order_id',
                                                                                                          'created_at')
      @orders = {}
      orderitems.each do |order|
        date = DateTime.parse(order[1].to_s)
        @orders[date] = { quantity: 0, order_id: order[0] } unless @orders.key?(date)
        @orders[date][:quantity] += 1
      end

    else
      @orders = []
    end

    @cart_items = session[:items]
  end

  def destroy
    @item = exist_item(params[:id])
    @item = Cart.find_by(item_id: params[:id]) if user_signed_in?
    if @item.nil?
      flash.now[:error] = 'invalid id'
    elsif user_signed_in?
      @item.destroy
    end

    session[:items] = session[:items].select do |session_item|
      session_item['item_id'] != @item['item_id']
    end

    redirect_to carts_path
  end

  def destroy_all
    if params.as_json.key?('carts')
      Cart.where(item_id: params[:carts]).destroy_all if user_signed_in?
      params[:carts].each do |item|
        session[:items].delete(exist_item(item))
      end
      redirect_to carts_path
    else
      redirect_to carts_path, flash: { alert: 'No item selected' }
    end
  end

  def update
    @item = exist_item(params[:id])
    unless @item.nil?
      index = session[:items].find_index(@item)

      if params[:operation] == '+'
        session[:items][index]['quantity'] += 1

      elsif params[:operation] == '-' && @item['quantity'] > 1
        session[:items][index]['quantity'] -= 1
      end

      Cart.where(item_id: params[:id]).update(quantity: session[:items][index]['quantity']) if user_signed_in?
    end
    redirect_to carts_path
  end

end
