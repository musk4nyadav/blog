class AddThumbnail < ActiveRecord::Migration[7.0]
  def change
    add_column :blog_posts, :thumbnail, :string
  end
end
