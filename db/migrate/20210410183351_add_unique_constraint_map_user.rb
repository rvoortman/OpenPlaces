class AddUniqueConstraintMapUser < ActiveRecord::Migration[6.1]
  def change
    add_index :map_users, [:map_id, :user_id], unique: true
  end
end
