# frozen_string_literal: true
class ItemsResturant < ApplicationRecord
  belongs_to :items
  belongs_to :resturants
end
