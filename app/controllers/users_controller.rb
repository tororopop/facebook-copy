class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @usertopics = @user.topics
    @likes = Like.where(topic_id: params[:topic_id])
  end

end
