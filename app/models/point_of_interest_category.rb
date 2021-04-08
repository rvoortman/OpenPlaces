# frozen_string_literal: true

class PointOfInterestCategory < ApplicationRecord
  belongs_to :category
  belongs_to :point_of_interest
end
