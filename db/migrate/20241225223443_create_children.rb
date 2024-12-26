# frozen_string_literal: true

class CreateChildren < ActiveRecord::Migration[7.0]
  def change
    create_table :children do |t|
      t.string :name
      t.date :date_of_birth
      t.integer :friend_id

      t.timestamps
    end
    add_index :children, :friend_id
  end
end
