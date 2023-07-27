class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :comments, foreign_key: comment
    
  end
end
