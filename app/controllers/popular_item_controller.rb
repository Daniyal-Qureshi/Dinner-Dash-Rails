# frozen_string_literal: true

# Popular Item
# Popular Item controller
class PopularItemController < ApplicationController
  def index
    counts = OrderItem.group(:item_id).count
    item_id = counts.key(counts.values.max)

    item = Item.find_by(id: item_id)
    if item.nil?
      redirect_to items_path, flash: { notice: 'No item found' }

    else
      @popular = item.title
    end
  end
end
