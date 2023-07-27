class SelfJoin < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :comment, index: true
  end
end
