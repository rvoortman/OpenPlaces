class AddPointOfInterestCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :point_of_interest_categories, id: :uuid do |t|
      t.belongs_to :category, type: :uuid
      t.belongs_to :point_of_interest, type: :uuid
      t.timestamps
    end
  end
end
