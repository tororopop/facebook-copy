class User < ActiveRecord::Base
  has_many :topics ,dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :like_topics, through: :likes, source: :topic

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy

  has_many :followed_users, through: :relationships, source: :followed
  has_many :followers, through: :reverse_relationships, source: :follower

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :lockable, :timeoutable

         mount_uploader :avatar, AvatarUploader

   def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
     user = User.find_by(email: auth.info.email)

     unless user
       user = User.new(
           name:     auth.extra.raw_info.name,
           provider: auth.provider,
           uid:      auth.uid,
           email:    auth.info.email ||= "#{auth.uid}-#{auth.provider}@example.com",
           image_url:   auth.info.image,
           password: Devise.friendly_token[0, 20]
       )
       user.skip_confirmation!
       user.save(validate: false)
     end
     user
   end

   def self.find_for_twitter_oauth(auth, signed_in_resource = nil)
     user = User.find_by(provider: auth.provider, uid: auth.uid)

     unless user
       user = User.new(
           name:     auth.info.nickname,
           image_url: auth.info.image,
           provider: auth.provider,
           uid:      auth.uid,
           email:    auth.info.email ||= "#{auth.uid}-#{auth.provider}@example.com",
           password: Devise.friendly_token[0, 20]
       )
       user.skip_confirmation!
       user.save
     end
     user
   end

   def self.create_unique_string
     SecureRandom.uuid
   end

   def update_with_password(params, *options)
     if provider.blank?
       super
     else
       params.delete :current_password
       update_without_password(params, *options)
     end
   end


   def self.search(search)
     if search
       where(['name LIKE ?', "%#{search}%"])
     else
       all
     end
   end


end
