# frozen_string_literal: true
class CategoriesItem < ApplicationRecord
  belongs_to :item
  belongs_to :category
end
