# frozen_string_literal: true

class CreateMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :maps, id: :uuid do |t|
      t.string :title, null: false
      t.timestamps
    end
  end
end
