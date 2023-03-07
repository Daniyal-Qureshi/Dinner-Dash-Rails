# frozen_string_literal: true

class CreateResturantsItems < ActiveRecord::Migration[5.2]
  def change
    create_table :resturants_items do |t|
      t.references :item, foreign_key: true
      t.references :resturant, foreign_key: true

      t.timestamps
    end
  end
end
