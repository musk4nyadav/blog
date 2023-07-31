class Comment < ApplicationRecord
    belongs_to :blog_post
    belongs_to :parent, class_name: 'Comment', optional: true
    has_many :replies, class_name: 'Comment', foreign_key: :comment_id, dependent: :destroy

    validates :commenter, presence: :true
    validates :body, presence: true
end
