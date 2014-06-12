class RemoveUserIdFromFriendships < ActiveRecord::Migration
  def change
    remove_column :friendships, :user_id, :integer
  end
end
