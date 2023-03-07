# frozen_string_literal: true
class CreateItemsResturants < ActiveRecord::Migration[5.2]
  def change
    create_table :items_resturants do |t|
      t.references :item, foreign_key: true
      t.references :resturant, foreign_key: true

      t.timestamps
    end
  end
end
