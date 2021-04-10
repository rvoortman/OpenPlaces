# frozen_string_literal: true

class AddMapToPointOfInterest < ActiveRecord::Migration[6.1]
  def change
    change_table :point_of_interests do |t|
      t.belongs_to :map, type: :uuid
    end
  end
end
