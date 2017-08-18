class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, topic_id: params[:topic_id])
    @likes = Like.where(topic_id: params[:topic_id])
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    like.destroy
    @likes = Like.where(topic_id: params[:topic_id])
    @topic = Topic.find(params[:topic_id])
  end
end
