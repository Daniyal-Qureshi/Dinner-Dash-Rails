# frozen_string_literal: true

class Resturant < ApplicationRecord
  has_and_belongs_to_many :items
  validates :name, uniqueness: true
  validates :name, :location, presence: true, length: { minimum: 6, maximum: 200 }
end
