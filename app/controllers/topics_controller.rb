class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all.page(params[:page]).per(20)
    @likes = Like.where(topic_id: params[:topic_id])
  end

  def show
    @comment = @topic.comments.build
    @comments = @topic.comments
    @likes = Like.where(topic_id: params[:topic_id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to topics_path, notice: "投稿しました！"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to topics_path, notice: "投稿を編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path, notice: "投稿を削除しました！"
  end


  private
  def topic_params
    params.require(:topic).permit(:caption, :file)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

end
