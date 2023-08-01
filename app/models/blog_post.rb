class BlogPost < ApplicationRecord

  has_many :comments, dependent: :destroy
  belongs_to :user 
  has_one_attached :cover_image
  
  validates :title, presence: true
  validates :body, presence: true
  has_rich_text :body
  validates_length_of :body, :maximum => 500, :minimum => 3
  validates_length_of :title, :maximum => 30, :minimum => 3
  mount_uploader :thumbnail, ThumbnailUploader
  validates_integrity_of :thumbnail
  
end
