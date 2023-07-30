class AddSoftDel < ActiveRecord::Migration[7.0]
  def change
    add_column :blog_posts, :delete_flag, :binary
  end
end
