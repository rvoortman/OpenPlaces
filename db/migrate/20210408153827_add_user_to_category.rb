# frozen_string_literal: true

class AddUserToCategory < ActiveRecord::Migration[6.1]
  def change
    change_table :categories do |t|
      t.belongs_to :user, type: :uuid
    end
  end
end
