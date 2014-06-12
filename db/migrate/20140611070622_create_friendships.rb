class CreateFriendships < ActiveRecord::Migration
  #def change
  def self.up
    create_table :friendships do |t|
      t.integer :login_id, :friend_id
	  t.string :status
      t.timestamps
    end
  end
  def self.down
	drop_table :friendships
	end
end
