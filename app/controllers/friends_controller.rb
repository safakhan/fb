class FriendsController < ApplicationController
  before_filter :authenticate_login!, :except => [:index, :show]

  def index
    @login = Login.find(params[:login_id])
  end

  def show
        #@login = Login.find(params[:id])
        respond_to do |format|
        format.html { redirect_to login_path(params[:id]) }
      end 
    #redirect_to login_path(params[:id])
  end
  
  def new
    @friendship1 = Friendship.new
    @friendship2 = Friendship.new
  end

  def create
    @login = Login.find(current_login)
    @friend = Login.find(params[:friend_id])
    friendship_hash = {}
    friendship_hash[:friendship1] = {:login_id => @login.id, :friend_id => @friend.id, :status => 'requested'}
    friendship_hash[:friendship2] = {:login_id => @friend.id, :friend_id => @login.id, :status => 'pending'}
    @friendship1 = Friendship.create(friendship_hash[:friendship1])
    @friendship2 = Friendship.create(friendship_hash[:friendship2])
      if @friendship1.save && @friendship2.save
        redirect_to login_friends_path(current_login)
      else
        redirect_to login_path(current_login)
      end
  end

  def update
    @login = Login.find(current_login)
    @friend = Login.find(params[:id])
    friendship_hash = {}
    friendship_hash[:friendship1] = {:login_id => @login.id, :friend_id => @friend.id, :status => 'accepted'}
    friendship_hash[:friendship2] = {:login_id => @friend.id, :friend_id => @login.id, :status => 'accepted'}
    @friendship1 = Friendship.find_by_login_id_and_friend_id(@login.id, @friend.id)
    @friendship2 = Friendship.find_by_login_id_and_friend_id(@friend.id, @login.id)
    if @friendship1.update_attributes(friendship_hash[:friendship1]) && @friendship2.update_attributes(friendship_hash[:friendship2])
      flash[:notice] = 'Friend sucessfully accepted!'
      redirect_to login_friends_path(current_login)
    else
      redirect_to login_path(current_login)
    end
  end

  def destroy
    @login = Login.find(params[:login_id])
    @friend = Login.find(params[:id])
    @friendship1 = @login.friendships.find_by_friend_id(params[:id]).destroy
    @friendship2 = @friend.friendships.find_by_login_id(params[:id]).destroy
    redirect_to login_friends_path(:login_id => current_login)
  end

end

