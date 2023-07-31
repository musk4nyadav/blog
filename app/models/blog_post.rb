class BlogPost < ApplicationRecord

  has_many :comments, dependent: :destroy
  belongs_to :user 
  has_one_attached :cover_image
  
  validates :title, presence: true
  validates :body, presence: true
  validates_length_of :body, :maximum => 500
  mount_uploader :thumbnail, ThumbnailUploader
  validates_integrity_of :thumbnail
  
end
