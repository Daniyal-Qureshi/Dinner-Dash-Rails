# frozen_string_literal: true

class AddAttributestoUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :full_name, :string
    add_column :users, :display_name, :string
    add_column :users, :role, :integer
  end
end
