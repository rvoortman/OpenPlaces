class MapUser < ApplicationRecord
  belongs_to :map
  belongs_to :user

  validates :user, uniqueness: {scope: [:map_id, :user_id]}
end
