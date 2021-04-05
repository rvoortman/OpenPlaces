# frozen_string_literal: true

class Category < ApplicationRecord
  validates :color, :title, presence: true
end
