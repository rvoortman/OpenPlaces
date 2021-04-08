class CreateMapUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :map_users, id: :uuid  do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :map, type: :uuid
      t.timestamps
    end
  end
end
