# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :price
      t.string :photo
      t.string :description
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
