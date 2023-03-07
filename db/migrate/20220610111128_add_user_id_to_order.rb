# frozen_string_literal: true

class AddUserIdToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :user_id, :integer
  end
end
20_220_610_111_128
