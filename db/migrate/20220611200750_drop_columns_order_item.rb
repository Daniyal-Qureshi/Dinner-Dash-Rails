# frozen_string_literal: true
class DropColumnsOrderItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_items, :integer
    remove_column :order_items, :price
    remove_column :order_items, :line_item_subtotal
    remove_column :order_items, :name
  end
end
