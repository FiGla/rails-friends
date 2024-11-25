class RemoveEmailPhoneTwitterFromFriends < ActiveRecord::Migration[7.0]
  def change
    remove_column :friends, :email, :string
    remove_column :friends, :phone, :string
    remove_column :friends, :twitter, :string
  end
end
