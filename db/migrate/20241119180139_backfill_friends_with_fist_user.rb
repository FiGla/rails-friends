class BackfillFriendsWithFistUser < ActiveRecord::Migration[7.0]
  class MigrationFriend < ActiveRecord::Base
    self.table_name = :friends
  end

  def change
    MigrationFriend.update_all(user_id: 1)
  end
end
