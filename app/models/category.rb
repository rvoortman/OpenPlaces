# frozen_string_literal: true

class Category < ApplicationRecord
  validates :color, presence: true
  validates :title, presence: true
end
