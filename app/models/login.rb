class Login < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  has_many :comments
  #has_many  foreign_key: 'login_id'	

  #has_many :messages 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    #attr_accessible :email, :password, :password_confirmation  
end
