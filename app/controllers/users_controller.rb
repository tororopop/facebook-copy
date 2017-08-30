class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(6)
  end

  def show
    @user = User.find(params[:id])
    @topics = @user.topics.page(params[:page]).per(20)
    @likes = Like.where(topic_id: params[:topic_id])
  end

end
