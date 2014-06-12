class Friendship < ActiveRecord::Base
	belongs_to :login
	belongs_to :friend, :class_name => 'Login', :foreign_key =>'friend_id'
	default_scope -> {order('created_at desc')}
end
