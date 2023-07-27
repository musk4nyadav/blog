class AddCoverImageToBlogPost < ActiveRecord::Migration[7.0]
  def change
    add_column :blog_posts, :cover_image, :string
  end
end
