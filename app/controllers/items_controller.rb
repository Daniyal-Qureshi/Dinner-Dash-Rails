# frozen_string_literal: true

# Items Controller
# Helper methods for the items controller
class ItemsController < ApplicationController

  def index
    saving_cart_items_for_existing_users
    get_user_cart_items
    @items = get_items_by_category
    @categories = Category.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def saving_cart_items_for_existing_users
    if user_signed_in?
      session[:items].each do |session_item|
        cart_item = Cart.find_by(item_id: session_item['item_id'], user_id: current_user.id)
        Cart.create!(item_id: session_item['item_id'], quantity: session_item['quantity'], user_id: current_user.id) if cart_item.nil?
      end
      session[:items] = []
    end
  end

  def get_user_cart_items
    if user_signed_in?
      @cart_items = Cart.includes(:item).where(user_id: current_user.id).pluck('title', 'quantity', 'price', 'item_id')
      session[:items] = @cart_items.map do |item|
        { 'title' => item[0],
          'quantity' => item[1],
          'price' => item[2],
          'item_id' => item[3] }
      end
    end
  end

  def new
    @item = Item.new
    authorize @item
    @resturants = Resturant.all
  end

  def create
    @item = Resturant.find_by(name: params[:item][:resturants]).items.new(item_params)
    authorize @item
    if !@item.valid?
      flash[:alert] = @item.errors.full_messages.to_sentence
      redirect_to new_item_path
    else
      @item.save
      redirect_to items_path, flash: { notice: 'A new item has been added' }

    end
  end

  def get_items_by_category
    if params[:category_id].present?
      params[:category_id] == '0' ? Item.all : Category.find(params[:category_id]).items
    else
      Item.all
    end
  end

  def item_params
    params.require(:item).permit(
      :title,
      :description,
      :price,
      :cover_picture
    )
  end

end
