class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  mount_uploader :picture, PictureUploader
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 100 }
  validates :article_tag, presence: true
  validate  :picture_size
  
  
  
   def self.search(search) 
    if search
      where(['article_tag LIKE ?', "%#{search}%"]) 
    else
      all 
    end
   end
    
    def like_user(user_id)
       likes.find_by(user_id: user_id)
    end
  
   private
   
   def picture_size
     if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
     end
   end
end
