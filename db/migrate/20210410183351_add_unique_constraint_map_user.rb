# frozen_string_literal: true

class AddUniqueConstraintMapUser < ActiveRecord::Migration[6.1]
  def change
    add_index :map_users, %i[map_id user_id], unique: true
  end
end
