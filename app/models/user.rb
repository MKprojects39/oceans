class User < ApplicationRecord
   has_many :articles, dependent: :destroy
   has_many :active_relationships, class_name: "Relationship",
                                    foreign_key: "follower_id",
                                    dependent: :destroy
   has_many :passive_relationships, class_name: "Relationship",
                                    foreign_key: "followed_id",
                                    dependent: :destroy
   has_many :following, through: :active_relationships, source: :followed
   has_many :followers, through: :passive_relationships, source: :follower
  
  attr_accessor :remember_token
  
 
  mount_uploader :image, ImageUploader
  
 
  before_save { self.email = email.downcase }
  
  validates :name,  presence: true,
                      length: { maximum: 70}
                  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 
  validates :email, presence: true,
                      length: { maximum: 50 },
                      format: { with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: false }
 
  has_secure_password
  
  validates :password, presence: true,
                        length: { minimum: 1}, allow_nil: true

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
 
  def authenticated?(remember_token)
 
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  
  def forget
    update_attribute(:remember_digest, nil)
  end
  
   
   def follow(other_user)
     following << other_user
   end
   
  
   def unfollow(other_user)
     active_relationships.find_by(followed_id: other_user.id).destroy
   end
   
   
   def following?(other_user)
     following.include?(other_user)
   end
   
    def feed
      following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
      Article.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
    end
    
  def self.search(search) 
    if search
      where(['name LIKE ?', "%#{search}%"]) 
    else
      all 
    end
  end
  
  

 def self.find_or_create_from_auth(auth)
  provider = auth[:provider]
  uid = auth[:uid]
  name = auth[:info][:name]
  image = auth[:info][:image]
 
  self.find_or_create_by(provider: provider, uid: uid) do |user|
    user.username = name
    user.image_path = image
  end
 end
  
end
