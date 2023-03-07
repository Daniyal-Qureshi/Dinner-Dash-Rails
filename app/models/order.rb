# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  enum status: %i[ordered paid cancelled completed]
end
