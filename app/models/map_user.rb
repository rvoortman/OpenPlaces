# frozen_string_literal: true

class MapUser < ApplicationRecord
  belongs_to :map
  belongs_to :user

  validates :user, uniqueness: {scope: %i[map_id user_id]}
end
