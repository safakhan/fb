class Post < ActiveRecord::Base
	belongs_to :login
	has_many :comments, dependent: :destroy
	validates_presence_of :title
	validates_presence_of :body
#	before_create :owner
	#def owner
    #@post.login = current_login
#end
end
