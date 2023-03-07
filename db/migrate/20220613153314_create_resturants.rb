# frozen_string_literal: true
class CreateResturants < ActiveRecord::Migration[5.2]
  def change
    create_table :resturants do |t|
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
