class AddLoginIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :login_id, :integer
  end
end
