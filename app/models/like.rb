class Like < ActiveRecord::Base
  belongs_to :topic, counter_cache: :likes_count
  belongs_to :user

end
