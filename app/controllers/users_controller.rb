class UsersController < ApplicationController
  def index
    @userselect = User.search(params[:search])
    @users = @userselect.where.not(id: current_user.id).page(params[:page]).per(18)
  end

  def show
    @user = User.find(params[:id])
    @topics = @user.topics.page(params[:page]).per(10)
    @likes = Like.where(topic_id: params[:topic_id])
  end

end
