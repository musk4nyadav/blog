class BlogPost < ApplicationRecord
  
  has_many :comments, dependent: :destroy
  has_one_attached :cover_image
  
  validates :title, presence: true
  validates :body, presence: true
  validates_length_of :body, :maximum => 500
  
end
