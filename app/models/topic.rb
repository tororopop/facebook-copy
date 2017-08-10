class Topic < ActiveRecord::Base
  validates :caption, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :file, PictureUploader
end
