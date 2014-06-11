class AddPictureToLogins < ActiveRecord::Migration
  def change
    add_column :logins, :picture, :string
  end
end
