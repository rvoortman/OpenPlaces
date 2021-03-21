# frozen_string_literal: true

class CreatePointOfInterests < ActiveRecord::Migration[6.1]
  def change
    create_table :point_of_interests do |t|
      t.string :title, null: false
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false
      t.timestamps
    end
  end
end
