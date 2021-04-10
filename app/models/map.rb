# frozen_string_literal: true

class Map < ApplicationRecord
  has_many :map_users
  has_many :point_of_interests
  has_many :users, through: :map_users

  validates :title, presence: true
end
