# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :total_amount
      t.integer :status

      t.timestamps
    end
  end
end
