class DropCoverImage < ActiveRecord::Migration[7.0]
  def change
    remove_column :blog_posts, :cover_image
  end
end
