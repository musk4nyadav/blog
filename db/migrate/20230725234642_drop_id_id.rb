class DropIdId < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :id_id
  end
end
