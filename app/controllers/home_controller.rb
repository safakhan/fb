class HomeController < ApplicationController
  def index
  	if login_signed_in?
  		#redirect_to :controller => 'post', :action => 'index'
  		#redirect_to :controller => 'posts_controller', :action => 'index'
  		respond_to do |format|
  			format.html { redirect_to posts_path }
  		end	
  	end
  end
end
