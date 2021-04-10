# frozen_string_literal: true

class PointOfInterest < ApplicationRecord
  has_many :point_of_interest_categories
  has_many :categories, through: :point_of_interest_categories
  belongs_to :map

  validates :latitude, presence: true,
                       numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 90 }
  validates :longitude, presence: true,
                        numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :title, presence: true
end
