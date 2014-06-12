class AddLogInIdToFriendships < ActiveRecord::Migration
  def change
    add_column :friendships, :login_id, :integer
  end
end
