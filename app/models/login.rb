class Login < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  has_many :comments

  # has_many :friends, :through => :friendships, :conditions => "status = 'accepted'"
  # has_many :requested_friends, :through => :friendships, :source => :friend, -> {where status: 'requested'}, :order => "friendships.created_at"
  # has_many :pending_friends, :through => :friendships, :source => :friend, :conditions => "status = 'pending'", :order => "friendships.created_at"
#  has_many :friendships, :dependent => :destroy
  #has_many  foreign_key: 'login_id'	

  has_many :friends, -> {where 'friendships.status = "accepted"'}, through: :friendships, source: :friend
  has_many :requested_friends, -> {where 'friendships.status = "requested"'}, through: :friendships, source: :friend
  has_many :pending_friends, -> {where 'friendships.status = "pending"'}, through: :friendships, source: :friend
  has_many :friendships, :dependent => :destroy
	
	

  #has_many :messages 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         

    #attr_accessible :email, :password, :password_confirmation  
end
