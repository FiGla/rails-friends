# frozen_string_literal: true

class AddIndexUniqueNameUserIdOnFriend < ActiveRecord::Migration[7.0]
  def change
    add_index(:friends, %i[first_name last_name user_id], unique: true)
  end
end
