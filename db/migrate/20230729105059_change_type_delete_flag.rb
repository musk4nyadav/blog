class ChangeTypeDeleteFlag < ActiveRecord::Migration[7.0]
  def change
    remove_column :blog_posts, :delete_flag
  end
end
