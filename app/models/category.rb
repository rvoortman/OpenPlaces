# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :point_of_interest_categories
  has_many :point_of_interests, through: :point_of_interest_categories

  belongs_to :user

  validates :color, :title, presence: true
end
