# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :full_name, presence: true, length: { minimum: 5, maximum: 200 }
  validates :display_name, presence: false, length: { maximum: 200 }
  enum role: %i[user admin]
end
