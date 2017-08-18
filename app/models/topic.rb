class Topic < ActiveRecord::Base
  validates :caption, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end

  default_scope -> { order(created_at: :desc) }

  mount_uploader :file, PictureUploader
end
