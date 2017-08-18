class AddLikesCountToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :likes_count, :integer
  end
end
