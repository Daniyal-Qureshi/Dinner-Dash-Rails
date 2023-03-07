# frozen_string_literal: true

class Item < ApplicationRecord
  has_and_belongs_to_many :resturants
  has_and_belongs_to_many :categories
  has_one_attached :cover_picture

  validates :title, uniqueness: true
  validates :price, numericality: { only_integer: true, greater_than: 0, less_than: 1_000_000 }
  validates :description, length: { minimum: 5, maximum: 200 }
  validates :title, :description, :price, presence: true
end
