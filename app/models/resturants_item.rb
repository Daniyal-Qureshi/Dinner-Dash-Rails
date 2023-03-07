# frozen_string_literal: true

class ResturantsItem < ApplicationRecord
  belongs_to :item
  belongs_to :resturant
end
